%% Master Controller Script
fault_batches = {"switching_data_1", "switching_data_2", "switching_data_3", "switching_data_4"};

for b = 1:length(fault_batches)
    fprintf('Starting Batch %d...\n', b);
    
    % 1. Run the specific script
    run(fault_batches{b});
   

    fprintf('Batch %d completed and memory cleared.\n', b);
end