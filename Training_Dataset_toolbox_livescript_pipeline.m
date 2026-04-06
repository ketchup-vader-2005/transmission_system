%% Master Controller Script
fault_batches = {"Training_Dataset_toolbox_livescript_pipeline_1", "Training_Dataset_toolbox_livescript_pipeline_2", "Training_Dataset_toolbox_livescript_pipeline_3", "Training_Dataset_toolbox_livescript_pipeline_4"};

for b = 1:length(fault_batches)
    fprintf('Starting Batch %d...\n', b);
    
    % 1. Run the specific script
    run(fault_batches{b});
   

    fprintf('Batch %d completed and memory cleared.\n', b);
end