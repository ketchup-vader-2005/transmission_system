
% 1. Pull the IDs and ensure they are strings
names = string(Training_Dataset_temp.FaultID);

% 2. Extract digits (regexp works on string arrays in newer MATLAB versions)
nums_cell = regexp(names, '\d+', 'match', 'once');

% 3. Convert the resulting cell array of strings to numbers
nums = str2double(nums_cell);

% 4. Sort (the rest of your sortIdx code is correct)
[~, sortIdx] = sort(nums);
Training_Dataset_temp = Training_Dataset_temp(sortIdx, :);

Training_Dataset = vertcat(Training_Dataset_temp, training_data_healthy);
save("training_data_switching.mat", "training_data_switching");
%save("training_data_faults.mat", "training_data_faults");
save("training_data_healthy.mat", "training_data_healthy");
save("Training_Dataset_singlesampletime.mat", "Training_Dataset");
parquetwrite("Training_Dataset.parquet", Training_Dataset);