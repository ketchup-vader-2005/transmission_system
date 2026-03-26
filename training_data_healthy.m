powersysModelHealthy = "transmission_system_healthy";
Fault = 'NoFault';
interface = 0;

open_system(powersysModelHealthy);

for l = 1:594
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
    T_mini.Interface = repmat(interface, height(T_mini), 1);
    storage_bucket_healthy{l} = T_mini;
end 

close_system(powersysModel);