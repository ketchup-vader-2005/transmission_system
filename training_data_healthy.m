powersysModelHealthy = "transmission_system_healthy";
Fault = 'NoFault';
interface = 0;

open_system(powersysModelHealthy);

for l = 1:length(storage_bucket)/2
    out = sim(powersysModel);
    Vabc = squeeze(out.logsout.get('Vabc').Values.Data);
    Iabc = squeeze(out.logsout.get('Iabc').Values.Data);
    VI = [Vabc; Iabc];
    T_transient = array2table(VI', 'VariableNames', {'Va', 'Vb', 'Vc', 'Ia', 'Ib', 'Ic'});
    % 2. Create the "Summary Row" for this 
    % We wrap T_transient in { } to tell M
    T_mini = table({T_transient}, 'VariableNames', {'TransientData'});
    T_mini.FaultID = repmat(Fault, height(T_mini), 1);
    T_mini.Interface = repmat(interface, height(T_mini), 1);
    storage_bucket_healthy{l} = T_mini;
end 

close_system(powersysModel);