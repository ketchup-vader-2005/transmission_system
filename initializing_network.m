net = importNetworkFromONNX('/Users/faizshaikh/Documents/machine_learning/test_model_v2.onnx');
inputSize = [10 240]; % 10 Channels, 240 Time steps
% 'CB' stands for Channel, Batch. 
% For sequences, use 'CST' (Channel, Spatial, Time) or 'SC' 
dummyData = dlarray(single(rand(inputSize)), 'CT'); 
net = initialize(net, dummyData);
analyzeNetwork(net);
save("my_model_test_toolbox.mat", "net");