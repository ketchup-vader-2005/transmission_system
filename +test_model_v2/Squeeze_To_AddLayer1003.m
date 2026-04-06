classdef Squeeze_To_AddLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_2_1_de_12
        functional_2_1_de_17
        functional_2_1_de_22
        functional_2_1_de_27
        functional_2_1_dis_1
        functional_2_1_de_2
        functional_2_1_de_7
        functional_2_1_typ_2
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

        function [type, distance] = predict(this, functional_2_1_co_16, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims)
            if isdlarray(functional_2_1_co_16)
                functional_2_1_co_16 = stripdims(functional_2_1_co_16);
            end
            if isdlarray(functional_2_1_globa)
                functional_2_1_globa = stripdims(functional_2_1_globa);
            end
            if isdlarray(functional_2_1_glo_2)
                functional_2_1_glo_2 = stripdims(functional_2_1_glo_2);
            end
            functional_2_1_co_16NumDims = 4;
            functional_2_1_globaNumDims = numel(functional_2_1_globaNumDims);
            functional_2_1_glo_2NumDims = numel(functional_2_1_glo_2NumDims);
            functional_2_1_co_16 = test_model_v2.ops.permuteInputVar(functional_2_1_co_16, [4 3 1 2], 4);
            functional_2_1_globa = test_model_v2.ops.permuteInputVar(functional_2_1_globa, ['as-is'], 0);
            functional_2_1_glo_2 = test_model_v2.ops.permuteInputVar(functional_2_1_glo_2, ['as-is'], 0);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_AddGraph1011(this, functional_2_1_co_16, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_co_16NumDims, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims, false);
            type = test_model_v2.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model_v2.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance] = forward(this, functional_2_1_co_16, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims)
            if isdlarray(functional_2_1_co_16)
                functional_2_1_co_16 = stripdims(functional_2_1_co_16);
            end
            if isdlarray(functional_2_1_globa)
                functional_2_1_globa = stripdims(functional_2_1_globa);
            end
            if isdlarray(functional_2_1_glo_2)
                functional_2_1_glo_2 = stripdims(functional_2_1_glo_2);
            end
            functional_2_1_co_16NumDims = 4;
            functional_2_1_globaNumDims = numel(functional_2_1_globaNumDims);
            functional_2_1_glo_2NumDims = numel(functional_2_1_glo_2NumDims);
            functional_2_1_co_16 = test_model_v2.ops.permuteInputVar(functional_2_1_co_16, [4 3 1 2], 4);
            functional_2_1_globa = test_model_v2.ops.permuteInputVar(functional_2_1_globa, ['as-is'], 0);
            functional_2_1_glo_2 = test_model_v2.ops.permuteInputVar(functional_2_1_glo_2, ['as-is'], 0);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_AddGraph1011(this, functional_2_1_co_16, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_co_16NumDims, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims, true);
            type = test_model_v2.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model_v2.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance, typeNumDims1015, distanceNumDims1016] = Squeeze_To_AddGraph1011(this, functional_2_1_co_16, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_co_16NumDims, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_2_1_co_15, functional_2_1_co_15NumDims] = test_model_v2.ops.onnxSqueeze(functional_2_1_co_16, this.Vars.const_fold_opt__104_, functional_2_1_co_16NumDims);

            % Add:
            functional_2_1_co_12 = functional_2_1_co_15 + this.Vars.const_fold_opt__102;
            functional_2_1_co_12NumDims = max(functional_2_1_co_15NumDims, this.NumDims.const_fold_opt__102);

            % LeakyRelu:
            functional_2_1_co_13 = leakyrelu(functional_2_1_co_12, 0.200000);
            functional_2_1_co_13NumDims = functional_2_1_co_12NumDims;

            % Transpose:
            [perm, Transpose__87_0NumDims] = test_model_v2.ops.prepareTransposeArgs(this.Vars.TransposePerm1012, functional_2_1_co_13NumDims);
            if isempty(perm)
                Transpose__87_0 = functional_2_1_co_13;
            else
                Transpose__87_0 = permute(functional_2_1_co_13, perm);
            end

            % ReduceMax:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1013, Transpose__87_0NumDims);
            xMax = max(Transpose__87_0, [], dims);
            [functional_2_1_glo_3, functional_2_1_glo_3NumDims] = test_model_v2.ops.onnxSqueeze(xMax, this.Vars.ReduceMaxAxes1013, Transpose__87_0NumDims);

            % ReduceMean:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1014, Transpose__87_0NumDims);
            xMean = mean(Transpose__87_0, dims);
            [functional_2_1_glo_1, functional_2_1_glo_1NumDims] = test_model_v2.ops.onnxSqueeze(xMean, this.Vars.ReduceMeanAxes1014, Transpose__87_0NumDims);

            % MatMul:
            [functional_2_1_de_14, functional_2_1_de_14NumDims] = test_model_v2.ops.onnxMatMul(functional_2_1_glo_1, this.functional_2_1_de_12, functional_2_1_glo_1NumDims, this.NumDims.functional_2_1_de_12);

            % Add:
            functional_2_1_de_11 = functional_2_1_de_14 + this.Vars.functional_2_1_de_10;
            functional_2_1_de_11NumDims = max(functional_2_1_de_14NumDims, this.NumDims.functional_2_1_de_10);

            % LeakyRelu:
            functional_2_1_de_13 = leakyrelu(functional_2_1_de_11, 0.200000);
            functional_2_1_de_13NumDims = functional_2_1_de_11NumDims;

            % Concat:
            [functional_2_1_con_2, functional_2_1_con_2NumDims] = test_model_v2.ops.onnxConcat(1, {functional_2_1_de_13, functional_2_1_glo_3, functional_2_1_globa, functional_2_1_glo_2}, [functional_2_1_de_13NumDims, functional_2_1_glo_3NumDims, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims]);

            % MatMul:
            [functional_2_1_de_19, functional_2_1_de_19NumDims] = test_model_v2.ops.onnxMatMul(functional_2_1_con_2, this.functional_2_1_de_17, functional_2_1_con_2NumDims, this.NumDims.functional_2_1_de_17);

            % Add:
            functional_2_1_de_16 = functional_2_1_de_19 + this.Vars.functional_2_1_de_15;
            functional_2_1_de_16NumDims = max(functional_2_1_de_19NumDims, this.NumDims.functional_2_1_de_15);

            % LeakyRelu:
            functional_2_1_de_18 = leakyrelu(functional_2_1_de_16, 0.200000);
            functional_2_1_de_18NumDims = functional_2_1_de_16NumDims;

            % MatMul:
            [functional_2_1_de_24, functional_2_1_de_24NumDims] = test_model_v2.ops.onnxMatMul(functional_2_1_de_18, this.functional_2_1_de_22, functional_2_1_de_18NumDims, this.NumDims.functional_2_1_de_22);

            % Add:
            functional_2_1_de_21 = functional_2_1_de_24 + this.Vars.functional_2_1_de_20;
            functional_2_1_de_21NumDims = max(functional_2_1_de_24NumDims, this.NumDims.functional_2_1_de_20);

            % LeakyRelu:
            functional_2_1_de_23 = leakyrelu(functional_2_1_de_21, 0.200000);
            functional_2_1_de_23NumDims = functional_2_1_de_21NumDims;

            % MatMul:
            [functional_2_1_de_29, functional_2_1_de_29NumDims] = test_model_v2.ops.onnxMatMul(functional_2_1_de_23, this.functional_2_1_de_27, functional_2_1_de_23NumDims, this.NumDims.functional_2_1_de_27);

            % Add:
            functional_2_1_de_26 = functional_2_1_de_29 + this.Vars.functional_2_1_de_25;
            functional_2_1_de_26NumDims = max(functional_2_1_de_29NumDims, this.NumDims.functional_2_1_de_25);

            % LeakyRelu:
            functional_2_1_de_28 = leakyrelu(functional_2_1_de_26, 0.200000);
            functional_2_1_de_28NumDims = functional_2_1_de_26NumDims;

            % MatMul:
            [functional_2_1_dis_2, functional_2_1_dis_2NumDims] = test_model_v2.ops.onnxMatMul(functional_2_1_de_28, this.functional_2_1_dis_1, functional_2_1_de_28NumDims, this.NumDims.functional_2_1_dis_1);

            % Add:
            distance = functional_2_1_dis_2 + this.Vars.functional_2_1_dista;
            distanceNumDims = max(functional_2_1_dis_2NumDims, this.NumDims.functional_2_1_dista);

            % Concat:
            [functional_2_1_con_1, functional_2_1_con_1NumDims] = test_model_v2.ops.onnxConcat(1, {functional_2_1_glo_1, functional_2_1_glo_3, functional_2_1_globa}, [functional_2_1_glo_1NumDims, functional_2_1_glo_3NumDims, functional_2_1_globaNumDims]);

            % MatMul:
            [functional_2_1_de_4, functional_2_1_de_4NumDims] = test_model_v2.ops.onnxMatMul(functional_2_1_con_1, this.functional_2_1_de_2, functional_2_1_con_1NumDims, this.NumDims.functional_2_1_de_2);

            % Add:
            functional_2_1_de_1 = functional_2_1_de_4 + this.Vars.functional_2_1_dense;
            functional_2_1_de_1NumDims = max(functional_2_1_de_4NumDims, this.NumDims.functional_2_1_dense);

            % LeakyRelu:
            functional_2_1_de_3 = leakyrelu(functional_2_1_de_1, 0.200000);
            functional_2_1_de_3NumDims = functional_2_1_de_1NumDims;

            % MatMul:
            [functional_2_1_de_9, functional_2_1_de_9NumDims] = test_model_v2.ops.onnxMatMul(functional_2_1_de_3, this.functional_2_1_de_7, functional_2_1_de_3NumDims, this.NumDims.functional_2_1_de_7);

            % Add:
            functional_2_1_de_6 = functional_2_1_de_9 + this.Vars.functional_2_1_de_5;
            functional_2_1_de_6NumDims = max(functional_2_1_de_9NumDims, this.NumDims.functional_2_1_de_5);

            % LeakyRelu:
            functional_2_1_de_8 = leakyrelu(functional_2_1_de_6, 0.200000);
            functional_2_1_de_8NumDims = functional_2_1_de_6NumDims;

            % MatMul:
            [functional_2_1_typ_3, functional_2_1_typ_3NumDims] = test_model_v2.ops.onnxMatMul(functional_2_1_de_8, this.functional_2_1_typ_2, functional_2_1_de_8NumDims, this.NumDims.functional_2_1_typ_2);

            % Add:
            functional_2_1_typ_1 = functional_2_1_typ_3 + this.Vars.functional_2_1_type_;
            functional_2_1_typ_1NumDims = max(functional_2_1_typ_3NumDims, this.NumDims.functional_2_1_type_);

            % Softmax:
            [type, typeNumDims] = test_model_v2.ops.onnxSoftmax13(functional_2_1_typ_1, -1, functional_2_1_typ_1NumDims);

            % Set graph output arguments
            typeNumDims1015 = typeNumDims;
            distanceNumDims1016 = distanceNumDims;

        end

    end

end