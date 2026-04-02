classdef Squeeze_To_SigmoidLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dens_9
        functional_1_dens_2
        functional_1_type__2
        functional_1_dens_16
        functional_1_dens_23
        functional_1_dista_2
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
            name = 'test_model_v2.coder.Squeeze_To_SigmoidLayer1003';
        end
    end


    methods
        function this = Squeeze_To_SigmoidLayer1003(name)
            this.Name = name;
            this.NumInputs = 5;
            this.NumOutputs = 2;
            this.OutputNames = {'type', 'distance'};
        end

        function [type, distance] = predict(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_globa_1NumDims, functional_1_globa_3NumDims)
            if isdlarray(functional_1_conv_16)
                functional_1_conv_16 = stripdims(functional_1_conv_16);
            end
            if isdlarray(functional_1_globa_1)
                functional_1_globa_1 = stripdims(functional_1_globa_1);
            end
            if isdlarray(functional_1_globa_3)
                functional_1_globa_3 = stripdims(functional_1_globa_3);
            end
            functional_1_conv_16NumDims = 4;
            functional_1_globa_1NumDims = numel(functional_1_globa_1NumDims);
            functional_1_globa_3NumDims = numel(functional_1_globa_3NumDims);
            functional_1_conv_16 = test_model_v2.ops.permuteInputVar(functional_1_conv_16, [4 3 1 2], 4);
            functional_1_globa_1 = test_model_v2.ops.permuteInputVar(functional_1_globa_1, ['as-is'], 0);
            functional_1_globa_3 = test_model_v2.ops.permuteInputVar(functional_1_globa_3, ['as-is'], 0);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SigmoidGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, false);
            type = test_model_v2.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model_v2.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance] = forward(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_globa_1NumDims, functional_1_globa_3NumDims)
            if isdlarray(functional_1_conv_16)
                functional_1_conv_16 = stripdims(functional_1_conv_16);
            end
            if isdlarray(functional_1_globa_1)
                functional_1_globa_1 = stripdims(functional_1_globa_1);
            end
            if isdlarray(functional_1_globa_3)
                functional_1_globa_3 = stripdims(functional_1_globa_3);
            end
            functional_1_conv_16NumDims = 4;
            functional_1_globa_1NumDims = numel(functional_1_globa_1NumDims);
            functional_1_globa_3NumDims = numel(functional_1_globa_3NumDims);
            functional_1_conv_16 = test_model_v2.ops.permuteInputVar(functional_1_conv_16, [4 3 1 2], 4);
            functional_1_globa_1 = test_model_v2.ops.permuteInputVar(functional_1_globa_1, ['as-is'], 0);
            functional_1_globa_3 = test_model_v2.ops.permuteInputVar(functional_1_globa_3, ['as-is'], 0);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SigmoidGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, true);
            type = test_model_v2.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model_v2.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance, typeNumDims1015, distanceNumDims1016] = Squeeze_To_SigmoidGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_15, functional_1_conv_15NumDims] = test_model_v2.ops.onnxSqueeze(functional_1_conv_16, this.Vars.const_fold_opt__24_1, functional_1_conv_16NumDims);

            % Add:
            functional_1_conv_12 = functional_1_conv_15 + this.Vars.const_fold_opt__2427;
            functional_1_conv_12NumDims = max(functional_1_conv_15NumDims, this.NumDims.const_fold_opt__2427);

            % LeakyRelu:
            functional_1_conv_13 = leakyrelu(functional_1_conv_12, 0.200000);
            functional_1_conv_13NumDims = functional_1_conv_12NumDims;

            % Transpose:
            [perm, Transpose__2402_0NumDims] = test_model_v2.ops.prepareTransposeArgs(this.Vars.TransposePerm1012, functional_1_conv_13NumDims);
            if isempty(perm)
                Transpose__2402_0 = functional_1_conv_13;
            else
                Transpose__2402_0 = permute(functional_1_conv_13, perm);
            end

            % ReduceMax:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1013, Transpose__2402_0NumDims);
            xMax = max(Transpose__2402_0, [], dims);
            [functional_1_globa_2, functional_1_globa_2NumDims] = test_model_v2.ops.onnxSqueeze(xMax, this.Vars.ReduceMaxAxes1013, Transpose__2402_0NumDims);

            % ReduceMean:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1014, Transpose__2402_0NumDims);
            xMean = mean(Transpose__2402_0, dims);
            [functional_1_global_, functional_1_global_NumDims] = test_model_v2.ops.onnxSqueeze(xMean, this.Vars.ReduceMeanAxes1014, Transpose__2402_0NumDims);

            % MatMul:
            [functional_1_dens_11, functional_1_dens_11NumDims] = test_model_v2.ops.onnxMatMul(functional_1_global_, this.functional_1_dens_9, functional_1_global_NumDims, this.NumDims.functional_1_dens_9);

            % Add:
            functional_1_dens_8 = functional_1_dens_11 + this.Vars.functional_1_dense_2;
            functional_1_dens_8NumDims = max(functional_1_dens_11NumDims, this.NumDims.functional_1_dense_2);

            % LeakyRelu:
            functional_1_dens_10 = leakyrelu(functional_1_dens_8, 0.200000);
            functional_1_dens_10NumDims = functional_1_dens_8NumDims;

            % Mul:
            functional_1_batc_5 = functional_1_dens_10 .* this.Vars.functional_1_batc_4;
            functional_1_batc_5NumDims = max(functional_1_dens_10NumDims, this.NumDims.functional_1_batc_4);

            % Add:
            functional_1_batc_3 = functional_1_batc_5 + this.Vars.functional_1_batc_6;
            functional_1_batc_3NumDims = max(functional_1_batc_5NumDims, this.NumDims.functional_1_batc_6);

            % MatMul:
            [functional_1_dens_4, functional_1_dens_4NumDims] = test_model_v2.ops.onnxMatMul(functional_1_global_, this.functional_1_dens_2, functional_1_global_NumDims, this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_4 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(functional_1_dens_4NumDims, this.NumDims.functional_1_dense_1);

            % LeakyRelu:
            functional_1_dens_3 = leakyrelu(functional_1_dens_1, 0.200000);
            functional_1_dens_3NumDims = functional_1_dens_1NumDims;

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model_v2.ops.onnxMatMul(functional_1_dens_3, this.functional_1_type__2, functional_1_dens_3NumDims, this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(functional_1_type__3NumDims, this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model_v2.ops.onnxSoftmax13(functional_1_type__1, -1, functional_1_type__1NumDims);

            % Concat:
            [functional_1_concate, functional_1_concateNumDims] = test_model_v2.ops.onnxConcat(1, {functional_1_batc_3, functional_1_globa_2, functional_1_globa_1, functional_1_globa_3}, [functional_1_batc_3NumDims, functional_1_globa_2NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims]);

            % MatMul:
            [functional_1_dens_18, functional_1_dens_18NumDims] = test_model_v2.ops.onnxMatMul(functional_1_concate, this.functional_1_dens_16, functional_1_concateNumDims, this.NumDims.functional_1_dens_16);

            % Add:
            functional_1_dens_15 = functional_1_dens_18 + this.Vars.functional_1_dense_3;
            functional_1_dens_15NumDims = max(functional_1_dens_18NumDims, this.NumDims.functional_1_dense_3);

            % LeakyRelu:
            functional_1_dens_17 = leakyrelu(functional_1_dens_15, 0.200000);
            functional_1_dens_17NumDims = functional_1_dens_15NumDims;

            % Mul:
            functional_1_batc_9 = functional_1_dens_17 .* this.Vars.functional_1_batc_8;
            functional_1_batc_9NumDims = max(functional_1_dens_17NumDims, this.NumDims.functional_1_batc_8);

            % Add:
            functional_1_batc_7 = functional_1_batc_9 + this.Vars.functional_1_batc_10;
            functional_1_batc_7NumDims = max(functional_1_batc_9NumDims, this.NumDims.functional_1_batc_10);

            % MatMul:
            [functional_1_dens_25, functional_1_dens_25NumDims] = test_model_v2.ops.onnxMatMul(functional_1_batc_7, this.functional_1_dens_23, functional_1_batc_7NumDims, this.NumDims.functional_1_dens_23);

            % Add:
            functional_1_dens_22 = functional_1_dens_25 + this.Vars.functional_1_dense_4;
            functional_1_dens_22NumDims = max(functional_1_dens_25NumDims, this.NumDims.functional_1_dense_4);

            % LeakyRelu:
            functional_1_dens_24 = leakyrelu(functional_1_dens_22, 0.200000);
            functional_1_dens_24NumDims = functional_1_dens_22NumDims;

            % MatMul:
            [functional_1_dista_3, functional_1_dista_3NumDims] = test_model_v2.ops.onnxMatMul(functional_1_dens_24, this.functional_1_dista_2, functional_1_dens_24NumDims, this.NumDims.functional_1_dista_2);

            % Add:
            functional_1_dista_1 = functional_1_dista_3 + this.Vars.functional_1_distanc;
            functional_1_dista_1NumDims = max(functional_1_dista_3NumDims, this.NumDims.functional_1_distanc);

            % Sigmoid:
            distance = sigmoid(dlarray(functional_1_dista_1));
            distanceNumDims = functional_1_dista_1NumDims;

            % Set graph output arguments
            typeNumDims1015 = typeNumDims;
            distanceNumDims1016 = distanceNumDims;

        end

    end

end