classdef Squeeze_To_SoftmaxLayer1004 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dense_3
        functional_1_type__2
        functional_1_dista_1
    end

    properties (State)
    end

    properties
        Vars
        NumDims
    end


    methods(Static, Hidden)
        % Specify the path to the class that will be used for codegen
        function name = matlabCodegenRedirect(~)
            name = 'test_model.coder.Squeeze_To_SoftmaxLayer1004';
        end
    end


    methods
        function this = Squeeze_To_SoftmaxLayer1004(name)
            this.Name = name;
            this.NumOutputs = 2;
            this.OutputNames = {'type', 'distance'};
        end

        function [type, distance] = predict(this, functional_1_conv_21)
            if isdlarray(functional_1_conv_21)
                functional_1_conv_21 = stripdims(functional_1_conv_21);
            end
            functional_1_conv_21NumDims = 4;
            functional_1_conv_21 = test_model.ops.permuteInputVar(functional_1_conv_21, [4 3 1 2], 4);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SoftmaxGraph1008(this, functional_1_conv_21, functional_1_conv_21NumDims, false);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance] = forward(this, functional_1_conv_21)
            if isdlarray(functional_1_conv_21)
                functional_1_conv_21 = stripdims(functional_1_conv_21);
            end
            functional_1_conv_21NumDims = 4;
            functional_1_conv_21 = test_model.ops.permuteInputVar(functional_1_conv_21, [4 3 1 2], 4);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SoftmaxGraph1008(this, functional_1_conv_21, functional_1_conv_21NumDims, true);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance, typeNumDims1009, distanceNumDims1010] = Squeeze_To_SoftmaxGraph1008(this, functional_1_conv_21, functional_1_conv_21NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_20, functional_1_conv_20NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_21, this.Vars.const_fold_opt__122_, functional_1_conv_21NumDims);

            % Add:
            functional_1_conv_17 = functional_1_conv_20 + this.Vars.const_fold_opt__121;
            functional_1_conv_17NumDims = max(functional_1_conv_20NumDims, this.NumDims.const_fold_opt__121);

            % Relu:
            functional_1_conv_18 = relu(dlarray(functional_1_conv_17));
            functional_1_conv_18NumDims = functional_1_conv_17NumDims;

            % GlobalAveragePool:
            [poolsize, dataFormat, functional_1_global_NumDims] = test_model.ops.prepareGlobalAveragePoolArgs(functional_1_conv_18, functional_1_conv_18NumDims);
            functional_1_global_ = avgpool(functional_1_conv_18, poolsize, 'DataFormat', dataFormat);

            % Squeeze:
            [functional_1_globa_1, functional_1_globa_1NumDims] = test_model.ops.onnxSqueeze(functional_1_global_, this.Vars.const_fold_opt__122_, functional_1_global_NumDims);

            % MatMul:
            [functional_1_dense_4, functional_1_dense_4NumDims] = test_model.ops.onnxMatMul(functional_1_globa_1, this.functional_1_dense_3, functional_1_globa_1NumDims, this.NumDims.functional_1_dense_3);

            % Add:
            functional_1_dense_2 = functional_1_dense_4 + this.Vars.functional_1_dense_1;
            functional_1_dense_2NumDims = max(functional_1_dense_4NumDims, this.NumDims.functional_1_dense_1);

            % Relu:
            functional_1_dense_5 = relu(dlarray(functional_1_dense_2));
            functional_1_dense_5NumDims = functional_1_dense_2NumDims;

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model.ops.onnxMatMul(functional_1_dense_5, this.functional_1_type__2, functional_1_dense_5NumDims, this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(functional_1_type__3NumDims, this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model.ops.onnxSoftmax13(functional_1_type__1, -1, functional_1_type__1NumDims);

            % MatMul:
            [functional_1_dista_2, functional_1_dista_2NumDims] = test_model.ops.onnxMatMul(functional_1_dense_5, this.functional_1_dista_1, functional_1_dense_5NumDims, this.NumDims.functional_1_dista_1);

            % Add:
            distance = functional_1_dista_2 + this.Vars.functional_1_distanc;
            distanceNumDims = max(functional_1_dista_2NumDims, this.NumDims.functional_1_distanc);

            % Set graph output arguments
            typeNumDims1009 = typeNumDims;
            distanceNumDims1010 = distanceNumDims;

        end

    end

end