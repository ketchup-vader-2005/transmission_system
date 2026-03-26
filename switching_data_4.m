trigger_samples = 80;
interface1 = 50;
interface2 = 50;
interface3 = 50;
interface4 = 50;

load_p = 1e3;
i = 1;

powersysModel = "training_data_switching";
referenceModel = "training_data_switching_refernce";

Interface = [30, 60, 90];
Load = [0.8*1e3, 1e3, 1.2*1e3];
NR_values = [1e-3, 0.032, 0.422];

open_system(powersysModel)

myfaults = Simulink.fault.findFaults(powersysModel);
names = {myfaults.Name};
% Use regex to extract the digits from 'Fault1', 'Fault2', etc.
nums = regexp(names, '\d+', 'match', 'once');
nums = str2double(nums);

% 3. Sort based on those numbers
[~, sortIdx] = sort(nums);
myfaults = myfaults(sortIdx);

for f = 34:44
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)3/Section interface", true);
    Fault = sprintf('Fault%d', f);
    for load_p = Load
        for NR = NR_values
            for interface4 = Interface
                activate(myfaults(f));
                out = sim(powersysModel);
                Vabc = squeeze(out.logsout.get('Vabc').Values.Data);
                Iabc = squeeze(out.logsout.get('Iabc').Values.Data);
                a = Iabc(1,:);
                b = Iabc(2,:);
                c = Iabc(3,:);
                Ig = a + b + c;
                d1 = modwt(a, 'db4');
                d2 = modwt(b, 'db4');
                d3 = modwt(c, 'db4');
                VI = [Vabc; Iabc; Ig; d1(1,:); d2(1,:); d3(1,:)];
                T_transient = array2table(VI', 'VariableNames', {'Va', 'Vb', 'Vc', 'Ia', 'Ib', 'Ic', 'Ig', 'D1[a]', 'D1[b]', 'D1[c]'});
                % 2. Create the "Summary Row" for this 
                % We wrap T_transient in { } to tell M
                T_mini = table({T_transient}, 'VariableNames', {'TransientData'});
                T_mini.FaultID = repmat(Fault, height(T_mini), 1);
                T_mini.Interface = repmat(interface4, height(T_mini), 1);
                storage_bucket_switching_4{i} = T_mini;
                i = i + 1;
            end
        end
    end
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)3/Section interface", false);
end