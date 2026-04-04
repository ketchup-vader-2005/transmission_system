features = {'D6[Va]', 'D6[Vb]', 'D6[Vc]', 'D6[Ia]', 'D6[Ib]', 'D6[Ic]', 'D2[Ia]', 'D2[Ib]', 'D2[Ic]', 'Ig'};

% 2. Initialize a table with 135 rows and one 'cell' column
Training_Dataset_small_matrix = table('Size', [135, 1], ...
               'VariableTypes', {'cell'}, ...
               'VariableNames', {'DataMatrix'});

for i = 1:135
   dataMatrix = Training_Dataset_temp.('TransientData'){i,:}{:, features};
   dataMatrix = dataMatrix';
   Training_Dataset_small_matrix.DataMatrix{i} = dataMatrix;
end

save("Training_Dataset_small_matrix.mat", "Training_Dataset_small_matrix");
CleanDataMatrix = Training_Dataset_small_matrix.DataMatrix;
DataStack = cat(3, CleanDataMatrix{:});