pe = "/Users/faizshaikh/anaconda3/envs/machine_learning/bin/python";
pyenv('Version', pe);

mod = py.importlib.import_module('ai_engine');
py.importlib.reload(mod);

powersysModel = "realtime_test";

interface1 = 50;
interface2 = 50;
interface3 = 50;
interface4 = 50;

load_p = 1e3;
NR = 1e-3;

stopTime = 1280/3840; % Total simulation time
stepSize = 320/3840; % How often you want to "check" the data (e.g., every cycle)
currentTime = 0;

np = py.importlib.import_module('numpy');
tf = py.importlib.import_module('tensorflow');
keras = py.importlib.import_module('keras');
model = keras.models.load_model("/Users/faizshaikh/Documents/machine_learning/CNNmodel.keras");

while currentTime < stopTime
    nextTime = currentTime + stepSize;
    set_param(powersysModel, 'StopTime', num2str(nextTime));

    out = sim(powersysModel, 'StartTime', num2str(currentTime));
    Vabc = squeeze(out.logsout.get('Vabc').Values.Data);
    Iabc = squeeze(out.logsout.get('Iabc').Values.Data);
    Ia = Iabc(1,:);
    Ib = Iabc(2,:);
    Ic = Iabc(3,:);
    Va = Vabc(1,:);
    Vb = Vabc(2,:);
    Vc = Vabc(3,:);
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
    VI = [Vabc; Iabc; Ig; mra1(1,:); mra2(1,:); mra3(1,:); mra1(2,:); mra2(2,:); mra3(2,:); mra1(5,:); mra2(5,:); mra3(5,:); mra1(6,:); mra2(6,:); mra3(6,:); mra4(1,:); mra5(1,:); mra6(1,:); mra4(2,:); mra5(2,:); mra6(2,:); mra4(5,:); mra5(5,:); mra6(5,:); mra4(6,:); mra5(6,:); mra6(6,:)];
    T_transient = array2table(VI', 'VariableNames', {'Va', 'Vb', 'Vc', 'Ia', 'Ib', 'Ic', 'Ig', 'D1[Ia]', 'D1[Ib]', 'D1[Ic]', 'D2[Ia]', 'D2[Ib]', 'D2[Ic]', 'D5[Ia]', 'D5[Ib]', 'D5[Ic]', 'D6[Ia]', 'D6[Ib]', 'D6[Ic]', 'D1[Va]', 'D1[Vb]', 'D1[Vc]', 'D2[Va]', 'D2[Vb]', 'D2[Vc]', 'D5[Va]', 'D5[Vb]', 'D5[Vc]', 'D6[Va]', 'D6[Vb]', 'D6[Vc]'});
    % 2. Create the "Summary Row" for this 
    % We wrap T_transient in { } to tell M
    T_mini = table({T_transient}, 'VariableNames', {'TransientData'});

    parquetwrite("live_test.parquet", T_mini);
    
    pause(0.03);
    
    results = py.ai_engine.run_inference();

    % Convert the results back to MATLAB doubles
    type_probs = double(results{1});
    distance = double(results{2});
    
    [~, winnerIdx] = max(type_probs);
    predicted_type = winnerIdx - 1;

    % %d is for integer (type), %.3f and %.2f are for decimals (time and distance)
    fprintf('Time %.3f | Predicted Fault Type: %d | Distance: %.2f m\n', nextTime, predicted_type, distance);
    
    currentTime = nextTime;
end




