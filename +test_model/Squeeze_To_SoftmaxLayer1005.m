classdef Squeeze_To_SoftmaxLayer1005 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dens_9
        functional_1_type__2
        functional_1_dens_2
        functional_1_dense_5
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
            name = 'test_model.coder.Squeeze_To_SoftmaxLayer1005';
        end
    end


    methods
        function this = Squeeze_To_SoftmaxLayer1005(name)
            this.Name = name;
            this.NumOutputs = 2;
            this.OutputNames = {'type', 'distance'};
        end

        function [type, distance] = predict(this, functional_1_conv_26)
            if isdlarray(functional_1_conv_26)
                functional_1_conv_26 = stripdims(functional_1_conv_26);
            end
            functional_1_conv_26NumDims = 4;
            functional_1_conv_26 = test_model.ops.permuteInputVar(functional_1_conv_26, [4 3 1 2], 4);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SoftmaxGraph1010(this, functional_1_conv_26, functional_1_conv_26NumDims, false);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance] = forward(this, functional_1_conv_26)
            if isdlarray(functional_1_conv_26)
                functional_1_conv_26 = stripdims(functional_1_conv_26);
            end
            functional_1_conv_26NumDims = 4;
            functional_1_conv_26 = test_model.ops.permuteInputVar(functional_1_conv_26, [4 3 1 2], 4);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SoftmaxGraph1010(this, functional_1_conv_26, functional_1_conv_26NumDims, true);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance, typeNumDims1013, distanceNumDims1014] = Squeeze_To_SoftmaxGraph1010(this, functional_1_conv_26, functional_1_conv_26NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_25, functional_1_conv_25NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_26, this.Vars.const_fold_opt__20_1, functional_1_conv_26NumDims);

            % Add:
            functional_1_conv_22 = functional_1_conv_25 + this.Vars.const_fold_opt__2079;
            functional_1_conv_22NumDims = max(functional_1_conv_25NumDims, this.NumDims.const_fold_opt__2079);

            % Relu:
            functional_1_conv_23 = relu(dlarray(functional_1_conv_22));
            functional_1_conv_23NumDims = functional_1_conv_22NumDims;

            % Transpose:
            [perm, Transpose__2055_0NumDims] = test_model.ops.prepareTransposeArgs(this.Vars.TransposePerm1011, functional_1_conv_23NumDims);
            if isempty(perm)
                Transpose__2055_0 = functional_1_conv_23;
            else
                Transpose__2055_0 = permute(functional_1_conv_23, perm);
            end

            % ReduceMean:
            dims = test_model.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1012, Transpose__2055_0NumDims);
            xMean = mean(Transpose__2055_0, dims);
            [functional_1_global_, functional_1_global_NumDims] = test_model.ops.onnxSqueeze(xMean, this.Vars.ReduceMeanAxes1012, Transpose__2055_0NumDims);

            % MatMul:
            [functional_1_dens_10, functional_1_dens_10NumDims] = test_model.ops.onnxMatMul(functional_1_global_, this.functional_1_dens_9, functional_1_global_NumDims, this.NumDims.functional_1_dens_9);

            % Add:
            functional_1_dens_8 = functional_1_dens_10 + this.Vars.functional_1_dense_3;
            functional_1_dens_8NumDims = max(functional_1_dens_10NumDims, this.NumDims.functional_1_dense_3);

            % Relu:
            functional_1_dens_11 = relu(dlarray(functional_1_dens_8));
            functional_1_dens_11NumDims = functional_1_dens_8NumDims;

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model.ops.onnxMatMul(functional_1_dens_11, this.functional_1_type__2, functional_1_dens_11NumDims, this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(functional_1_type__3NumDims, this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model.ops.onnxSoftmax13(functional_1_type__1, -1, functional_1_type__1NumDims);

            % Reshape:
            [shape, functional_1_flattenNumDims] = test_model.ops.prepareReshapeArgs(Transpose__2055_0, this.Vars.functional_1_flatt_1, Transpose__2055_0NumDims, 0);
            functional_1_flatten = reshape(Transpose__2055_0, shape{:});

            % MatMul:
            [functional_1_dens_4, functional_1_dens_4NumDims] = test_model.ops.onnxMatMul(functional_1_flatten, this.functional_1_dens_2, functional_1_flattenNumDims, this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_4 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(functional_1_dens_4NumDims, this.NumDims.functional_1_dense_1);

            % LeakyRelu:
            functional_1_dens_3 = leakyrelu(functional_1_dens_1, 0.200000);
            functional_1_dens_3NumDims = functional_1_dens_1NumDims;

            % MatMul:
            [functional_1_dense_6, functional_1_dense_6NumDims] = test_model.ops.onnxMatMul(functional_1_dens_3, this.functional_1_dense_5, functional_1_dens_3NumDims, this.NumDims.functional_1_dense_5);

            % Add:
            functional_1_dense_4 = functional_1_dense_6 + this.Vars.functional_1_dense_2;
            functional_1_dense_4NumDims = max(functional_1_dense_6NumDims, this.NumDims.functional_1_dense_2);

            % MatMul:
            [functional_1_dista_2, functional_1_dista_2NumDims] = test_model.ops.onnxMatMul(functional_1_dense_4, this.functional_1_dista_1, functional_1_dense_4NumDims, this.NumDims.functional_1_dista_1);

            % Add:
            distance = functional_1_dista_2 + this.Vars.functional_1_distanc;
            distanceNumDims = max(functional_1_dista_2NumDims, this.NumDims.functional_1_distanc);

            % Set graph output arguments
            typeNumDims1013 = typeNumDims;
            distanceNumDims1014 = distanceNumDims;

        end

    end

end