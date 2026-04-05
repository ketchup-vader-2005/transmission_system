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

set_param(powersysModel, 'SimulationCommand', 'start');
set_param(powersysModel, 'SimulationCommand', 'pause');

while ~strcmpi(get_param(powersysModel, 'SimulationStatus'), 'stopped')
    
    % 3. GET current status: This is your "Tracking"
    currentTime = get_param(powersysModel, 'SimulationTime');
    currentSample = currentTime * 3840; % Assuming 1ms sample time
    
    % 4. PERFORM logic based on the sample count
    if currentSample == 80
        fprintf('At sample 80. Injecting fault LG now...\n');
        assignin('base', 'x', 1);
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)/Section interface", true);
        activate(myfaults(f(1)));
        
    elseif currentSample == 320
        fprintf('At sample 320. Stoping LG fault now...\n');
        assignin('base', 'x', 0);
        
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)/Section interface", false);
    elseif currentSample == 400
        fprintf('At sample 400. Injecting fault LL now...\n');
        assignin('base', 'x', 1);
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)1/Section interface", true);
        activate(myfaults(f(2)));
    elseif currentSample == 640
        fprintf('At sample 640. Stoping LL fault now...\n');
        assignin('base', 'x', 0);
        
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)1/Section interface", false);
    elseif currentSample == 720
        fprintf('At sample 720. Injecting fault LLG now...\n');
        assignin('base', 'x', 1);
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)2/Section interface", true);        
        activate(myfaults(f(3)));
    elseif currentSample == 960
        fprintf('At sample 960. Stopping fault LLG now...\n');
        assignin('base', 'x', 0);
        
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)2/Section interface", false);
    elseif currentSample == 1040
        fprintf('At sample 1040. Injecting fault LLL/LLLG now...\n');
        assignin('base', 'x', 1);
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)3/Section interface", true);
        activate(myfaults(f(4)));
        
    elseif currentSample == 1280
        fprintf('At sample 1280. Stopping fault LLL/LLLG now...\n');
        assignin('base', 'x', 0);
        
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)3/Section interface", false);
    end

    drawnow;
    
    % 5. ADVANCE the simulation by one step
    set_param(powersysModel, 'SimulationCommand', 'step');
    
    % Safety break if it gets stuck
    if currentTime > 10.0; break; end 
end

