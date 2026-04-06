interface1 = 30;
interface2 = 30;
interface3 = 30;
interface4 = 30;

load_p = 1e3;
NR = 1e-3;
trigger_samples = 80;

for i = 1:44
    varName = sprintf('x%d', i);
    assignin('base', varName, 0);
end

powersysModel = "training_data_switching";
refModel = "training_data_switching_reference";

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
Fs = 3840;

set_param(powersysModel, 'SimulationCommand', 'start');
set_param(powersysModel, 'SimulationCommand', 'pause');

while ~strcmpi(get_param(powersysModel, 'SimulationStatus'), 'stopped')
    
    % 3. GET current status: This is your "Tracking"
    currentTime = get_param(powersysModel, 'SimulationTime');
    
    % 4. PERFORM logic based on the sample count
    if currentTime == 20/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 0. Injecting fault LG now...\n');
        activate(myfaults(1));
        Simulink.fault.injection(powersysModel, true);
        Simulink.fault.updateReferences(powersysModel);
        set_param(powersysModel, 'SimulationCommand', 'update');

    elseif currentTime == 80/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 80. Injecting fault LG now...\n');
        assignin('base', 'x1', 1);
        set_param(powersysModel, 'SimulationCommand', 'update');

    elseif currentTime == 320/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 320. Stoping LG fault now...\n');
        assignin('base', 'x1', 0);
        activate(myfaults(2));
        Simulink.fault.injection(powersysModel, true);
        Simulink.fault.updateReferences(powersysModel);
        set_param(powersysModel, 'SimulationCommand', 'update');

    elseif currentTime == 400/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 400. Injecting fault LL now...\n');
        assignin('base', 'x2', 1);
        set_param(powersysModel, 'SimulationCommand', 'update');

    elseif currentTime == 640/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 640. Stoping LL fault now...\n');
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)1/Section interface", false);
        set_param(powersysModel, 'SimulationCommand', 'update');

    elseif currentTime == 720/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 720. Injecting fault LLG now...\n');
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)2/Section interface", true);
        activate(myfaults(f(3)));
        set_param(powersysModel, 'SimulationCommand', 'update');

    elseif currentTime == 960/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 960. Stopping fault LLG now...\n');
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)2/Section interface", false);
        set_param(powersysModel, 'SimulationCommand', 'update');

    elseif currentTime == 1040/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 1040. Injecting fault LLL/LLLG now...\n');
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)3/Section interface", true);
        activate(myfaults(f(4)));
        set_param(powersysModel, 'SimulationCommand', 'update');
        
    elseif currentTime == 1280/Fs
        set_param(powersysModel, 'SimulationCommand', 'pause');
        fprintf('At sample 1280. Stopping fault LLL/LLLG now...\n');
        Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)3/Section interface", false);
        set_param(powersysModel, 'SimulationCommand', 'update');
    end

    
    drawnow;

    % 5. ADVANCE the simulation by one step
    set_param(powersysModel, 'SimulationCommand', 'step');
    
    % Safety break if it gets stuck
    if currentTime > 10.0; break; end 

end

