storage_bucket = storage_bucket';
storage_bucket_healthy = storage_bucket_healthy';
storage_bucket_switching_1 = storage_bucket_switching_1';
storage_bucket_switching_2 = storage_bucket_switching_2';
storage_bucket_switching_3 = storage_bucket_switching_3';
storage_bucket_switching_4 = storage_bucket_switching_4';

for i = 1:243
    if i < 28
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 1) ;
    elseif (27 < i) && (i < 55)
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 2);
    elseif (54 < i) && (i < 82)
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 3);
    elseif (81 < i) && (i < 109)
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 4);
    elseif (108 < i) && (i < 136)
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 5);
    elseif (135 < i) && (i < 163)
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 6);
    elseif (162 < i) && (i < 190)
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 7);
    elseif (189 < i) && (i < 217)
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 8);
    elseif (216 < i) && (i < 244)
        storage_bucket{i,1}.FaultID = sprintf('Fault0%d', 9);
    end
end

for i = 1:243
    if i < 28
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 1) ;
    elseif (27 < i) && (i < 55)
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 2);
    elseif (54 < i) && (i < 82)
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 3);
    elseif (81 < i) && (i < 109)
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 4);
    elseif (108 < i) && (i < 136)
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 5);
    elseif (135 < i) && (i < 163)
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 6);
    elseif (162 < i) && (i < 190)
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 7);
    elseif (189 < i) && (i < 217)
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 8);
    elseif (216 < i) && (i < 244)
        storage_bucket_switching_1{i,1}.FaultID = sprintf('Fault0%d', 9);
    end
end

for i = 1:243
    if i < 28
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 1) ;
    elseif (27 < i) && (i < 55)
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 2);
    elseif (54 < i) && (i < 82)
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 3);
    elseif (81 < i) && (i < 109)
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 4);
    elseif (108 < i) && (i < 136)
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 5);
    elseif (135 < i) && (i < 163)
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 6);
    elseif (162 < i) && (i < 190)
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 7);
    elseif (189 < i) && (i < 217)
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 8);
    elseif (216 < i) && (i < 244)
        storage_bucket_switching_2{i,1}.FaultID = sprintf('Fault0%d', 9);
    end
end

for i = 1:243
    if i < 28
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 1) ;
    elseif (27 < i) && (i < 55)
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 2);
    elseif (54 < i) && (i < 82)
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 3);
    elseif (81 < i) && (i < 109)
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 4);
    elseif (108 < i) && (i < 136)
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 5);
    elseif (135 < i) && (i < 163)
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 6);
    elseif (162 < i) && (i < 190)
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 7);
    elseif (189 < i) && (i < 217)
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 8);
    elseif (216 < i) && (i < 244)
       storage_bucket_switching_3{i,1}.FaultID = sprintf('Fault0%d', 9);
    end
end

for i = 1:243
    if i < 28
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 1) ;
    elseif (27 < i) && (i < 55)
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 2);
    elseif (54 < i) && (i < 82)
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 3);
    elseif (81 < i) && (i < 109)
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 4);
    elseif (108 < i) && (i < 136)
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 5);
    elseif (135 < i) && (i < 163)
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 6);
    elseif (162 < i) && (i < 190)
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 7);
    elseif (189 < i) && (i < 217)
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 8);
    elseif (216 < i) && (i < 244)
       storage_bucket_switching_4{i,1}.FaultID = sprintf('Fault0%d', 9);
    end
end

training_data_faults = vertcat(storage_bucket{:});
training_data_healthy = vertcat(storage_bucket_healthy{:});
training_data_switching_1 = vertcat(storage_bucket_switching_1{:});
training_data_switching_2 = vertcat(storage_bucket_switching_2{:});
training_data_switching_3 = vertcat(storage_bucket_switching_3{:});
training_data_switching_4 = vertcat(storage_bucket_switching_4{:});
training_data_switching = vertcat(training_data_switching_1, training_data_switching_2, training_data_switching_3, training_data_switching_4);
Training_Dataset = vertcat(training_data_faults,training_data_healthy, training_data_switching);
save("training_data_switching.mat", "training_data_switching");
save("training_data_faults.mat", "training_data_faults");
save("training_data_healthy.mat", "training_data_healthy");
save("Training_Dataset.mat", "Training_Dataset");
parquetwrite("Training_Dataset.parquet", Training_Dataset);