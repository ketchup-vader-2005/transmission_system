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

% Use the Cell Array to avoid data type errors
schedule = {
    80,   320,  f(1), "/Model/Transmission Line (Three-Phase)/Section interface";
    400,  640,  f(2), "/Model/Transmission Line (Three-Phase)1/Section interface";
    720,  960,  f(3), "/Model/Transmission Line (Three-Phase)2/Section interface";
    1040, 1280, f(4), "/Model/Transmission Line (Three-Phase)3/Section interface"
};

% --- Configuration ---

totalSamples = 1281;
Fs = 3840;
set_param(powersysModel, 'StopTime', num2str(totalSamples/Fs));

% 1. Start and immediately pause to take control
set_param(powersysModel, 'SimulationCommand', 'start');
set_param(powersysModel, 'SimulationCommand', 'pause');

for i = 1:size(schedule, 1)
    startS   = schedule{i,1};
    endS     = schedule{i,2};
    faultIdx = schedule{i,3};
    path     = schedule{i,4};

    % --- 1. SET UP FAULT ---
    % We enable the path and the specific fault property
    Simulink.fault.enable(powersysModel + path, true);
    activate(myfaults(faultIdx)) 
    
    % Use update to push these changes into the paused simulation
    set_param(powersysModel, 'SimulationCommand', 'update'); 
    drawnow;

    % --- 2. START THE RUN ---
    set_param(powersysModel, 'SimulationCommand', 'continue');
    
    % --- 3. THE WAIT LOOP ---
    % This is where MATLAB "holds the line" until the simulation catches up
    currentSample = round(get_param(powersysModel, 'SimulationTime') * Fs);
    
    while currentSample < endS
        % Keep checking the simulation clock
        currentSample = round(get_param(powersysModel, 'SimulationTime') * Fs);
        
        % Check if the simulation stopped naturally (at StopTime)
        if strcmpi(get_param(powersysModel, 'SimulationStatus'), 'stopped')
            break; 
        end
        
        % Give the CPU a tiny bit of room to process the simulation
        pause(0.01); 
    end
    
    % --- 4. THE FORCE PAUSE ---
    % Once the while loop breaks, we are at endS. We MUST pause here.
    set_param(powersysModel, 'SimulationCommand', 'pause');
    
    % Deactivate for the next iteration
    Simulink.fault.enable(powersysModel + path, false);
    
    fprintf('Iteration %d finished. Paused at sample %d.\n', i, currentSample);
end