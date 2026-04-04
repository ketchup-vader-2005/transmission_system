powersysModel = "Check_predictblock";
out = sim(powersysModel);
Array = squeeze(out.logsout.get('array_output').Values.Data);
Type = squeeze(out.logsout.get('TypeOutput').Values.Data);
Distance = squeeze(out.logsout.get('DistanceOutput').Values.Data);
y = [Type, Distance];
T_check = array2table(y, 'VariableNames', {'Type', 'Distance'});