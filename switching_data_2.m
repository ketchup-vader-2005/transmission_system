interface1 = 50;
interface2 = 50;
interface3 = 50;
interface4 = 50;

load_p = 1e3;
i = 1;

powersysModel = "training_data_switching";
referenceModel = "training_data_switching_refernce";

Interface = [30, 60, 90];
NR_values = [1e-3, 0.032, 0.422];
Triggers = [80, 160, 293];

open_system(powersysModel)

myfaults = Simulink.fault.findFaults(powersysModel);
names = {myfaults.Name};
% Use regex to extract the digits from 'Fault1', 'Fault2', etc.
nums = regexp(names, '\d+', 'match', 'once');
nums = str2double(nums);

% 3. Sort based on those numbers
[~, sortIdx] = sort(nums);
myfaults = myfaults(sortIdx);

for f = 12:22
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)1/Section interface", true);
    Fault = sprintf('Fault%d', f);
    for NR = NR_values
        for trigger_samples = Triggers
            for interface2 = Interface
                activate(myfaults(f));
                out = sim(powersysModel);
                Vabc = squeeze(out.logsout.get('Vabc').Values.Data);
                Iabc = squeeze(out.logsout.get('Iabc').Values.Data);
                VI = [Vabc; Iabc];
                T_transient = array2table(VI', 'VariableNames', {'Va', 'Vb', 'Vc', 'Ia', 'Ib', 'Ic'});
                % 2. Create the "Summary Row" for this 
                % We wrap T_transient in { } to tell M
                T_mini = table({T_transient}, 'VariableNames', {'TransientData'});
                T_mini.FaultID = repmat(Fault, height(T_mini), 1);
                T_mini.Interface = repmat(interface2, height(T_mini), 1);
                storage_bucket_switching_2{i} = T_mini;
                i = i + 1;
            end
        end
    end
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)1/Section interface", false);
end