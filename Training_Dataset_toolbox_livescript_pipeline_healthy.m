powersysModelHealthy = "training_data_switching";
Fault = 'NoFault';
interface1 = 50;
interface2 = 50;
interface3 = 50;
interface4 = 50;
interface = 0;
load_p = 1e3;
NR = 1e-3;
trigger_samples = 80;
x = 1;

open_system(powersysModelHealthy);

for l = 1:203
    out = sim(powersysModelHealthy);
    Data = squeeze(out.logsout.get('toolbox_input').Values.Data);
    T_mini = table({Data(:,:,319)}, 'VariableNames', {'TransientData'});
    T_mini.FaultID = repmat(Fault, height(T_mini), 1);
    T_mini.Interface = repmat(interface, height(T_mini), 1);
    storage_bucket_healthy{l} = T_mini;
end 

save("Training_Dataset_toolbox_livescript_pipeline_healthy.mat", "storage_bucket_healthy");