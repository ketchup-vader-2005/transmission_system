trigger_samples = 80;
interface1 = 50;
interface2 = 50;
interface3 = 50;
interface4 = 50;

load_p = 1e3;
NR = 1e-3;
i = 1;

powersysModel = "training_data_switching";
referenceModel = "training_data_switching_refernce";

Interface = [30, 60, 90];
Load = [0.8*1e3, 1e3, 1.2*1e3];
NR_values = [1e-3, 0.032, 0.422];

trigger_samples = 80;
x = 1;

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

set_param(powersysModel, 'SimulationCommand', 'start');
set_param(powersysModel, 'SimulationCommand', 'pause');

for f = 1:11
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)/Section interface", true);
    Fault = sprintf('Fault%d', f);
    for load_p = Load
        for NR = NR_values
            for interface1 = Interface
                activate(myfaults(f));
                out = sim(powersysModel);
                Data = squeeze(out.logsout.get('toolbox_input').Values.Data);
                

            end
        end
    end
end