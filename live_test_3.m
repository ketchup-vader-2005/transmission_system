pe = "/Users/faizshaikh/anaconda3/envs/machine_learning/bin/python";
pyenv('Version', pe);

mod = py.importlib.import_module('ai_engine');
py.importlib.reload(mod);

powersysModel = "training_data_switching";

open_system(powersysModel);

myfaults = Simulink.fault.findFaults(powersysModel);
names = {myfaults.Name};
% Use regex to extract the digits from 'Fault1', 'Fault2', etc.
nums = regexp(names, '\d+', 'match', 'once');
nums = str2double(nums);

% 3. Sort based on those numbers
[~, sortIdx] = sort(nums);
myfaults = myfaults(sortIdx);

interface1 = 50;
interface2 = 50;
interface3 = 50;
interface4 = 50;

load_p = 1e3;
NR = 1e-3;
trigger_samples = 80;

Interface = [10, 40, 70];
Load = [0.9*1e3, 1e3, 1.1*1e3];
NR_values = [2e-3, 0.042, 0.222];
j = 1;

localIdx = 1;
bufferSize = 320;

I = zeros(3, 320);
V = zeros(3, 320);

np = py.importlib.import_module('numpy');
tf = py.importlib.import_module('tensorflow');
keras = py.importlib.import_module('keras');
model = keras.models.load_model("/Users/faizshaikh/Documents/machine_learning/CNNmodel.keras");

sz = [1188 6]; % 100 rows, 3 columns
varTypes = {'table', 'table', 'table','table', 'table', 'table'};
varNames = {'predicted_type_toolbox', 'distance_toolbox', 'predicted_type_engine', 'distance_engine', 'FaultID', 'Interface'};

% Create the empty table with pre-allocated rows
Output_values = table('Size', sz, 'VariableTypes', varTypes, 'VariableNames', varNames);

for f = 23:33
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)2/Section interface", true);
    activate(myfaults(f));
    Fault = sprintf('Fault%d', f);
    for load_p = Load
        for NR = NR_values
            for interface3 = Interface
                
                set_param(powersysModel, 'SimulationCommand', 'start');
                set_param(powersysModel, 'SimulationCommand', 'pause');
                
                while ~strcmpi(get_param(powersysModel, 'SimulationStatus'), 'stopped')
                    currentTime = get_param(powersysModel, 'SimulationTime');
                    currentSample = round(currentTime * 3840);
                
                    rto_i = get_param('training_data_switching/Gain_Iabc', 'RuntimeObject');
                    rto_v = get_param('training_data_switching/Gain_Vabc', 'RuntimeObject');
                    rto_t = get_param('training_data_switching/Gain_type', 'RuntimeObject');
                    rto_d = get_param('training_data_switching/Gain_distance', 'RuntimeObject');
                
                    if localIdx == bufferSize
                
                        Ia = I(1,:);
                        Ib = I(2,:);
                        Ic = I(3,:);
                        Va = V(1,:);
                        Vb = V(2,:);
                        Vc = V(3,:);
                        Ig = Ia + Ib + Ic;
                        modwt1 = modwt(Ia, 'db4');
                        modwt2 = modwt(Ib, 'db4');
                        modwt3 = modwt(Ic, 'db4');
                        modwt4 = modwt(Va, 'db4');
                        modwt5 = modwt(Vb, 'db4');
                        modwt6 = modwt(Vc, 'db4');
                        mra1 = modwtmra(modwt1, 'db4');
                        mra2 = modwtmra(modwt2, 'db4');
                        mra3 = modwtmra(modwt3, 'db4');
                        mra4 = modwtmra(modwt4, 'db4');
                        mra5 = modwtmra(modwt5, 'db4');
                        mra6 = modwtmra(modwt6, 'db4');
                        VI = [V; I; Ig; mra1(1,:); mra2(1,:); mra3(1,:); mra1(2,:); mra2(2,:); mra3(2,:); mra1(5,:); mra2(5,:); mra3(5,:); mra1(6,:); mra2(6,:); mra3(6,:); mra4(1,:); mra5(1,:); mra6(1,:); mra4(2,:); mra5(2,:); mra6(2,:); mra4(5,:); mra5(5,:); mra6(5,:); mra4(6,:); mra5(6,:); mra6(6,:)];
                        T_transient = array2table(VI', 'VariableNames', {'Va', 'Vb', 'Vc', 'Ia', 'Ib', 'Ic', 'Ig', 'D1[Ia]', 'D1[Ib]', 'D1[Ic]', 'D2[Ia]', 'D2[Ib]', 'D2[Ic]', 'D5[Ia]', 'D5[Ib]', 'D5[Ic]', 'D6[Ia]', 'D6[Ib]', 'D6[Ic]', 'D1[Va]', 'D1[Vb]', 'D1[Vc]', 'D2[Va]', 'D2[Vb]', 'D2[Vc]', 'D5[Va]', 'D5[Vb]', 'D5[Vc]', 'D6[Va]', 'D6[Vb]', 'D6[Vc]'});
                        % 2. Create the "Summary Row" for this 
                        % We wrap T_transient in { } to tell M
                        T_mini = table({T_transient}, 'VariableNames', {'TransientData'});
                    
                        parquetwrite("live_test.parquet", T_mini);
                        
                        pause(0.03);
                        
                        results = py.ai_engine.run_inference();
                    
                        % Convert the results back to MATLAB doubles
                        type_probs = double(results{1});
                        distance_engine = double(results{2});
                        
                        [~, winnerIdx] = max(type_probs);
                        predicted_type_engine = winnerIdx;
                    
                        % 2. Create the row for the CURRENT window
                        LT = [predicted_type_toolbox; distance_toolbox; predicted_type_engine; distance_engine];
                        T = array2table(LT', 'VariableNames', {'predicted_type_toolbox', 'distance_toolbox', 'predicted_type_engine', 'distance_engine'});
                        T.FaultID = repmat(Fault, height(T), 1);
                        T.Interface = repmat(interface1, height(T), 1);
                        Ts = table({T}, 'VariableNames', {'Model Output'});
                        storage_bucket_live_3{j} = Ts;
                        j = j + 1;
                
                        localIdx = 1;
                        I = zeros(3, 320);
                        V = zeros(3, 320);
                
                        set_param(powersysModel, 'SimulationCommand', 'stop');
                
                    elseif localIdx == bufferSize - 1
                        predicted_type_toolbox = double(rto_t.OutputPort(1).Data);
                        distance_toolbox = double(rto_d.OutputPort(1).Data);
                        
                        localIdx = localIdx + 1;
                
                    else
                        i = double(rto_i.OutputPort(1).Data);
                        v = double(rto_v.OutputPort(1).Data);
                        I(:, localIdx) = i';
                        V(:, localIdx) = v';
                
                        localIdx = localIdx + 1;
                
                    end
                
                    set_param(powersysModel, 'SimulationCommand', 'step');
                
                end
            end
        end
    end
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)2/Section interface", false);
end

save("Model_output_3.mat", "storage_bucket_live_3");