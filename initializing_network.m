net = importNetworkFromONNX('/Users/faizshaikh/Documents/machine_learning/test_model.onnx');
inputSize = [4 321 1];
dummyData = dlarray(single(rand(inputSize)), 'SSC');
net = initialize(net, dummyData);
analyzeNetwork(net);
save("my_model.mat", "net");