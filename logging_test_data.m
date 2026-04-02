
test_slice_raw1 = z(:,320);
test_slice_raw2 = z(:,640);
test_slice_raw3 = z(:,960);
test_slice_raw4 = z(:,1180);

test = {test_slice1, test_slice2, test_slice3, test_slice4};
test_raw = {test_slice_raw1, test_slice_raw2, test_slice_raw3, test_slice_raw4};

for f = 1:4
    T_transient = array2table(test_raw{f}, 'VariableNames', {'Ia', 'Ib', 'Ic', 'Va', 'Vb', 'Vc'});
    T_mini = table({T_transient}, 'VariableNames', {'TransientData'});
    storage_bucket_check_raw{f} = T_mini;
    T_transient = array2table(test{f}, 'VariableNames', {'D6[Va]', 'D6[Vb]', 'D6[Vc]', 'D6[Ia]', 'D6[Ib]', 'D6[Ic]', 'D2[Ia]', 'D2[Ib]', 'D2[Ic]', 'Ig'});
    T_mini = table({T_transient}, 'VariableNames', {'TransientData'});
    storage_bucket_check{f} = T_mini;
end


check_data = vertcat(storage_bucket_check{:});
check_data_raw = vertcat(storage_bucket_check_raw{:});
save("check_data.mat", "check_data");
save("check_data_raw.mat", "check_data_raw");
%parquetwrite("check_data.parquet", check_data);