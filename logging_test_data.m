powersysModel = "realtime_test";
out = sim(powersysModel);
y = squeeze(out.logsout.get('test_data').Values.Data);

test_slice1 = y(:,:,320);
test_slice2 = y(:,:,640);
test_slice3 = y(:,:,960);
test_slice4 = y(:,:,1280);

test = {test_slice1', test_slice2', test_slice3', test_slice4'};

for f = 1:4
    T_transient = array2table(test{f}, 'VariableNames', {'D6[Va]', 'D6[Vb]', 'D6[Vc]', 'D6[Ia]', 'D6[Ib]', 'D6[Ic]', 'D2[Ia]', 'D2[Ib]', 'D2[Ic]', 'Ig'});
    T_mini = table({T_transient}, 'VariableNames', {'TransientData'});
    storage_bucket_check{f} = T_mini;
end


check_data = vertcat(storage_bucket_check{:});
%check_data_raw = z;
save("check_data_new.mat", "check_data");
parquetwrite("check_data_new.parquet", check_data);
%save("check_data_raw.mat", "check_data_raw");

%parquetwrite("check_data.parquet", check_data);

