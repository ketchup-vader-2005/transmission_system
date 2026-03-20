net = importNetworkFromONNX('/Users/faizshaikh/Documents/machine_learning/test_model.onnx');
inputSize = [6 321 1];
dummyData = dlarray(single(rand(inputSize)), 'SSC');
net = initialize(net, dummyData);
analyzeNetwork(net);