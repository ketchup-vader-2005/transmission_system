%trigger_samples = 80;
interface1 = 50;
interface2 = 50;
interface3 = 50;
interface4 = 50;

load_p = 1e3;
NR = 1e-3;
i = 1;
x = 1;
y = 1;
z = 1;

powersysModel = "training_data_switching";
referenceModel = "training_data_switching_refernce";

Interface = [30, 60, 90];
Load = [0.8*1e3, 1e3, 1.2*1e3];
NR_values = [1e-3, 0.032, 0.422];

trigger_samples = 80;


localIdx = 1;
bufferSize = 320;

I = zeros(3, 320);
V = zeros(3, 320);

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
    for load_p = Load
        for NR = NR_values
            for interface2 = Interface
                activate(myfaults(f));
                out = sim(powersysModel);
                Data = squeeze(out.logsout.get('toolbox_input').Values.Data);
                T_mini = table({Data(:,:,319)}, 'VariableNames', {'TransientData'});
                T_mini.FaultID = repmat(Fault, height(T_mini), 1);
                T_mini.Interface = repmat(interface2, height(T_mini), 1);
                storage_bucket_switching_2{x} = T_mini;
                x = x + 1;
            end
        end
    end
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)1/Section interface", false);
end

 save("Training_Dataset_toolbox_livescript_pipeline_2.mat", "storage_bucket_switching_2");
