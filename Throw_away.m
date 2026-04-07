for i = 1:243
    if i < 28
        storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 1) ;
    elseif (27 < i) && (i < 55)
        storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 2);
    elseif (54 < i) && (i < 82)
        storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 3);
    elseif (81 < i) && (i < 109)
        storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 4);
    elseif (108 < i) && (i < 136)
        storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 5);
    elseif (135 < i) && (i < 163)
        storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 6);
    elseif (162 < i) && (i < 190)
       storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 7);
    elseif (189 < i) && (i < 217)
       storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 8);
    elseif (216 < i) && (i < 244)
       storage_bucket_live_1{i,1}.('Model Output'){1,1}.FaultID = sprintf('Fault0%d', 9);
    end
end

cellData = table2cell(live_test(:, 1));
combinedTable = vertcat(cellData{:});
live_test = combinedTable;
save("live_test.mat", "live_test");
