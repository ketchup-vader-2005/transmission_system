function [poolsize, dataFormat, numDimsX] = prepareGlobalMaxPoolArgs(X_, numDimsX_)
% Prepares arguments for implementing the ONNX GlobalMaxPool operator
%#codegen

% Copyright 2024 The MathWorks, Inc.

X          = test_model.coder.ops.extractIfDlarray(X_);   
numDimsX   = test_model.coder.ops.extractIfDlarray(numDimsX_);   

poolsize    = size(X, 1:numDimsX-2);                   % The spatial dimensions
dataFormat  = [repmat('S', [1 numDimsX-2]) 'CB'];
end
