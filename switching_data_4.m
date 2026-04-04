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
                T_mini.FaultID = repmat(Fault, height(T_mini), 1);
                T_mini.Interface = repmat(interface4, height(T_mini), 1);
                storage_bucket_switching_4{i} = T_mini;
                i = i + 1;
            end
        end
    end
    Simulink.fault.enable(powersysModel+"/Model/Transmission Line (Three-Phase)3/Section interface", false);
   
end