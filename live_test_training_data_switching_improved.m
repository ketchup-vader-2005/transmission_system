interface1 = 30;
interface2 = 30;
interface3 = 30;
interface4 = 30;

load_p = 1e3;
NR = 1e-3;
trigger_samples = 80;
x = 0;

powersysModel = "training_data_switching";

Interface = [30, 60, 90];
NR_values = [1e-3, 0.032, 0.422];
Load = [0.8*1e3, 1e3, 1.2*1e3];

open_system(powersysModel)

myfaults = Simulink.fault.findFaults(powersysModel);
names = {myfaults.Name};
% Use regex to extract the digits from 'Fault1', 'Fault2', etc.
nums = regexp(names, '\d+', 'match', 'once');
nums = str2double(nums);

% 3. Sort based on those numbers
[~, sortIdx] = sort(nums);
myfaults = myfaults(sortIdx);

f = [1, 15, 29, 43]; 
% --- Setup ---
Fs = 3840;
% 1. Initialization
set_param(powersysModel, 'SimulationCommand', 'start');
set_param(powersysModel, 'SimulationCommand', 'pause');

% Use the Cell Array to avoid data type errors
schedule = {
    80,   320,  f(1), "/Model/Transmission Line (Three-Phase)/Section interface";
    400,  640,  f(2), "/Model/Transmission Line (Three-Phase)1/Section interface";
    720,  960,  f(3), "/Model/Transmission Line (Three-Phase)2/Section interface";
    1040, 1280, f(4), "/Model/Transmission Line (Three-Phase)3/Section interface"
};

for i = 1:size(schedule, 1)
    % Jump to Start of Fault
    targetT = schedule{i,1} / 3840;
    set_param(powersysModel, 'StopTime', num2str(targetT));
    set_param(powersysModel, 'SimulationCommand', 'continue');
    while ~strcmpi(get_param(powersysModel,'SimulationStatus'),'stopped'); pause(0.01); end
    
    % Inject
    Simulink.fault.enable(powersysModel + schedule{i,4}, true);
    activate(myfaults(schedule{i,3}));
    assignin('base', 'x', 1);
    
    % Jump to End of Fault
    targetT = schedule{i,2} / 3840;
    set_param(powersysModel, 'StopTime', num2str(targetT));
    set_param(powersysModel, 'SimulationCommand', 'continue');
    while ~strcmpi(get_param(powersysModel,'SimulationStatus'),'stopped'); pause(0.01); end
    
    % Clear
    deactivate(myfaults(schedule{i,3}));
    Simulink.fault.enable(powersysModel + schedule{i,4}, false);
    assignin('base', 'x', 0);
end

% Set final stop time and finish
set_param(powersysModel, 'StopTime', num2str(1281/3840));
set_param(powersysModel, 'SimulationCommand', 'continue');