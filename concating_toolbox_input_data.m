storage_bucket_healthy = storage_bucket_healthy';
storage_bucket_switching_1 = storage_bucket_switching_1';
storage_bucket_switching_2 = storage_bucket_switching_2';
storage_bucket_switching_3 = storage_bucket_switching_3';
storage_bucket_switching_4 = storage_bucket_switching_4';

training_data_healthy = vertcat(storage_bucket_healthy{:});
training_data_switching_1 = vertcat(storage_bucket_switching_1{:});
training_data_switching_2 = vertcat(storage_bucket_switching_2{:});
training_data_switching_3 = vertcat(storage_bucket_switching_3{:});
training_data_switching_4 = vertcat(storage_bucket_switching_4{:});
training_data_switching = vertcat(training_data_switching_1, training_data_switching_2, training_data_switching_3, training_data_switching_4);
Training_Dataset_temp = vertcat(training_data_switching);

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
save("Training_Dataset_toolbox.mat", "Training_Dataset");
parquetwrite("Training_Dataset_toolbox.parquet", Training_Dataset);