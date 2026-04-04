pe = "/Users/faizshaikh/anaconda3/envs/machine_learning/bin/python";
pyenv('Version', pe);
% Extract the 'TransientData' column (which contains your 1782 nested tables)
transient_cells = Training_Dataset_fixed.TransientData;

% Initialize a 3D array: [Number_of_Simulations, Time_Steps, Features]
% Based on your previous images: 1782 rows, 321 samples, 31 features
num_sims = numel(transient_cells);
[rows, cols] = size(transient_cells{1});
X_matlab = zeros(num_sims, rows, cols);

for i = 1:num_sims
    % Convert the nested table to a double matrix
    X_matlab(i, :, :) = table2array(transient_cells{i});
end

% 1. Create a reference to the numpy module in your environment
np = py.importlib.import_module('numpy');

% 2. Convert the MATLAB matrix to a NumPy array
% MATLAB (Double) -> Python (numpy.ndarray)
X_python = np.array(X_matlab);

% Optional: Check the shape in Python to ensure it matches (1782, 321, 31)
disp(X_python.shape);

