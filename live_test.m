%% Master Controller Script
live_batches = {"live_test_1", "live_test_2", "live_test_3", "live_test_4"};

for b = 2:length(live_batches)
    fprintf('Starting Batch %d...\n', b);
    
    % 1. Run the specific script
    run(live_batches{b});
   

    fprintf('Batch %d completed and memory cleared.\n', b);
end