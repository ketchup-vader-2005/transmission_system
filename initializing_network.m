net = importNetworkFromONNX('/Users/faizshaikh/Documents/machine_learning/test_model.onnx');
inputSize = [4 301 1];
dummyData = dlarray(single(rand(inputSize)), 'SSC');
net = initialize(net, dummyData);
analyzeNetwork(net);
save("my_model_new.mat", "net");