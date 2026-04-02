classdef Squeeze_To_AddLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dens_17
        functional_1_dens_24
        functional_1_dens_31
        functional_1_dens_38
        functional_1_dista_1
        functional_1_dens_2
        functional_1_dens_7
        functional_1_type__2
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
            name = 'test_model_v2.coder.Squeeze_To_AddLayer1003';
        end
    end


    methods
        function this = Squeeze_To_AddLayer1003(name)
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

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_AddGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, false);
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

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_AddGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, true);
            type = test_model_v2.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model_v2.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance, typeNumDims1015, distanceNumDims1016] = Squeeze_To_AddGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_15, functional_1_conv_15NumDims] = test_model_v2.ops.onnxSqueeze(functional_1_conv_16, this.Vars.axes_const__51__79, functional_1_conv_16NumDims);

            % Add:
            functional_1_conv_12 = functional_1_conv_15 + this.Vars.const_fold_opt__113;
            functional_1_conv_12NumDims = max(functional_1_conv_15NumDims, this.NumDims.const_fold_opt__113);

            % LeakyRelu:
            functional_1_conv_13 = leakyrelu(functional_1_conv_12, 0.200000);
            functional_1_conv_13NumDims = functional_1_conv_12NumDims;

            % Transpose:
            [perm, Transpose__87_0NumDims] = test_model_v2.ops.prepareTransposeArgs(this.Vars.TransposePerm1012, functional_1_conv_13NumDims);
            if isempty(perm)
                Transpose__87_0 = functional_1_conv_13;
            else
                Transpose__87_0 = permute(functional_1_conv_13, perm);
            end

            % ReduceMax:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1013, Transpose__87_0NumDims);
            xMax = max(Transpose__87_0, [], dims);
            [functional_1_globa_2, functional_1_globa_2NumDims] = test_model_v2.ops.onnxSqueeze(xMax, this.Vars.ReduceMaxAxes1013, Transpose__87_0NumDims);

            % ReduceMean:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1014, Transpose__87_0NumDims);
            xMean = mean(Transpose__87_0, dims);
            [functional_1_global_, functional_1_global_NumDims] = test_model_v2.ops.onnxSqueeze(xMean, this.Vars.ReduceMeanAxes1014, Transpose__87_0NumDims);

            % MatMul:
            [functional_1_dens_19, functional_1_dens_19NumDims] = test_model_v2.ops.onnxMatMul(functional_1_global_, this.functional_1_dens_17, functional_1_global_NumDims, this.NumDims.functional_1_dens_17);

            % Add:
            functional_1_dens_16 = functional_1_dens_19 + this.Vars.functional_1_dense_2;
            functional_1_dens_16NumDims = max(functional_1_dens_19NumDims, this.NumDims.functional_1_dense_2);

            % LeakyRelu:
            functional_1_dens_18 = leakyrelu(functional_1_dens_16, 0.200000);
            functional_1_dens_18NumDims = functional_1_dens_16NumDims;

            % Mul:
            functional_1_batc_13 = functional_1_dens_18 .* this.Vars.functional_1_batc_12;
            functional_1_batc_13NumDims = max(functional_1_dens_18NumDims, this.NumDims.functional_1_batc_12);

            % Add:
            functional_1_batc_11 = functional_1_batc_13 + this.Vars.functional_1_batc_14;
            functional_1_batc_11NumDims = max(functional_1_batc_13NumDims, this.NumDims.functional_1_batc_14);

            % Concat:
            [functional_1_conca_2, functional_1_conca_2NumDims] = test_model_v2.ops.onnxConcat(1, {functional_1_batc_11, functional_1_globa_2, functional_1_globa_1, functional_1_globa_3}, [functional_1_batc_11NumDims, functional_1_globa_2NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims]);

            % MatMul:
            [functional_1_dens_26, functional_1_dens_26NumDims] = test_model_v2.ops.onnxMatMul(functional_1_conca_2, this.functional_1_dens_24, functional_1_conca_2NumDims, this.NumDims.functional_1_dens_24);

            % Add:
            functional_1_dens_23 = functional_1_dens_26 + this.Vars.functional_1_dense_3;
            functional_1_dens_23NumDims = max(functional_1_dens_26NumDims, this.NumDims.functional_1_dense_3);

            % LeakyRelu:
            functional_1_dens_25 = leakyrelu(functional_1_dens_23, 0.200000);
            functional_1_dens_25NumDims = functional_1_dens_23NumDims;

            % Mul:
            functional_1_batc_17 = functional_1_dens_25 .* this.Vars.functional_1_batc_16;
            functional_1_batc_17NumDims = max(functional_1_dens_25NumDims, this.NumDims.functional_1_batc_16);

            % Add:
            functional_1_batc_15 = functional_1_batc_17 + this.Vars.functional_1_batc_18;
            functional_1_batc_15NumDims = max(functional_1_batc_17NumDims, this.NumDims.functional_1_batc_18);

            % MatMul:
            [functional_1_dens_33, functional_1_dens_33NumDims] = test_model_v2.ops.onnxMatMul(functional_1_batc_15, this.functional_1_dens_31, functional_1_batc_15NumDims, this.NumDims.functional_1_dens_31);

            % Add:
            functional_1_dens_30 = functional_1_dens_33 + this.Vars.functional_1_dense_4;
            functional_1_dens_30NumDims = max(functional_1_dens_33NumDims, this.NumDims.functional_1_dense_4);

            % LeakyRelu:
            functional_1_dens_32 = leakyrelu(functional_1_dens_30, 0.200000);
            functional_1_dens_32NumDims = functional_1_dens_30NumDims;

            % Mul:
            functional_1_batc_21 = functional_1_dens_32 .* this.Vars.functional_1_batc_20;
            functional_1_batc_21NumDims = max(functional_1_dens_32NumDims, this.NumDims.functional_1_batc_20);

            % Add:
            functional_1_batc_19 = functional_1_batc_21 + this.Vars.functional_1_batc_22;
            functional_1_batc_19NumDims = max(functional_1_batc_21NumDims, this.NumDims.functional_1_batc_22);

            % MatMul:
            [functional_1_dens_40, functional_1_dens_40NumDims] = test_model_v2.ops.onnxMatMul(functional_1_batc_19, this.functional_1_dens_38, functional_1_batc_19NumDims, this.NumDims.functional_1_dens_38);

            % Add:
            functional_1_dens_37 = functional_1_dens_40 + this.Vars.functional_1_dense_5;
            functional_1_dens_37NumDims = max(functional_1_dens_40NumDims, this.NumDims.functional_1_dense_5);

            % LeakyRelu:
            functional_1_dens_39 = leakyrelu(functional_1_dens_37, 0.200000);
            functional_1_dens_39NumDims = functional_1_dens_37NumDims;

            % MatMul:
            [functional_1_dista_2, functional_1_dista_2NumDims] = test_model_v2.ops.onnxMatMul(functional_1_dens_39, this.functional_1_dista_1, functional_1_dens_39NumDims, this.NumDims.functional_1_dista_1);

            % Add:
            distance = functional_1_dista_2 + this.Vars.functional_1_distanc;
            distanceNumDims = max(functional_1_dista_2NumDims, this.NumDims.functional_1_distanc);

            % Concat:
            [functional_1_conca_1, functional_1_conca_1NumDims] = test_model_v2.ops.onnxConcat(1, {functional_1_global_, functional_1_globa_2, functional_1_globa_1}, [functional_1_global_NumDims, functional_1_globa_2NumDims, functional_1_globa_1NumDims]);

            % MatMul:
            [functional_1_dens_4, functional_1_dens_4NumDims] = test_model_v2.ops.onnxMatMul(functional_1_conca_1, this.functional_1_dens_2, functional_1_conca_1NumDims, this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_4 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(functional_1_dens_4NumDims, this.NumDims.functional_1_dense_1);

            % LeakyRelu:
            functional_1_dens_3 = leakyrelu(functional_1_dens_1, 0.200000);
            functional_1_dens_3NumDims = functional_1_dens_1NumDims;

            % Mul:
            functional_1_batc_5 = functional_1_dens_3 .* this.Vars.functional_1_batc_4;
            functional_1_batc_5NumDims = max(functional_1_dens_3NumDims, this.NumDims.functional_1_batc_4);

            % Add:
            functional_1_batc_3 = functional_1_batc_5 + this.Vars.functional_1_batc_6;
            functional_1_batc_3NumDims = max(functional_1_batc_5NumDims, this.NumDims.functional_1_batc_6);

            % MatMul:
            [functional_1_dens_9, functional_1_dens_9NumDims] = test_model_v2.ops.onnxMatMul(functional_1_batc_3, this.functional_1_dens_7, functional_1_batc_3NumDims, this.NumDims.functional_1_dens_7);

            % Add:
            functional_1_dens_6 = functional_1_dens_9 + this.Vars.functional_1_dens_5;
            functional_1_dens_6NumDims = max(functional_1_dens_9NumDims, this.NumDims.functional_1_dens_5);

            % LeakyRelu:
            functional_1_dens_8 = leakyrelu(functional_1_dens_6, 0.200000);
            functional_1_dens_8NumDims = functional_1_dens_6NumDims;

            % Mul:
            functional_1_batc_9 = functional_1_dens_8 .* this.Vars.functional_1_batc_8;
            functional_1_batc_9NumDims = max(functional_1_dens_8NumDims, this.NumDims.functional_1_batc_8);

            % Add:
            functional_1_batc_7 = functional_1_batc_9 + this.Vars.functional_1_batc_10;
            functional_1_batc_7NumDims = max(functional_1_batc_9NumDims, this.NumDims.functional_1_batc_10);

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model_v2.ops.onnxMatMul(functional_1_batc_7, this.functional_1_type__2, functional_1_batc_7NumDims, this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(functional_1_type__3NumDims, this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model_v2.ops.onnxSoftmax13(functional_1_type__1, -1, functional_1_type__1NumDims);

            % Set graph output arguments
            typeNumDims1015 = typeNumDims;
            distanceNumDims1016 = distanceNumDims;

        end

    end

end