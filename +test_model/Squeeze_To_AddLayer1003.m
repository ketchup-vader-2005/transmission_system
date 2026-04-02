classdef Squeeze_To_AddLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_6_1_de_12
        functional_6_1_de_2
        functional_6_1_de_7
        functional_6_1_typ_2
        functional_6_1_de_17
        functional_6_1_dis_1
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
            name = 'test_model.coder.Squeeze_To_AddLayer1003';
        end
    end


    methods
        function this = Squeeze_To_AddLayer1003(name)
            this.Name = name;
            this.NumInputs = 5;
            this.NumOutputs = 2;
            this.OutputNames = {'type', 'distance'};
        end

        function [type, distance] = predict(this, functional_6_1_co_16, functional_6_1_glo_1, functional_6_1_glo_3, functional_6_1_glo_1NumDims, functional_6_1_glo_3NumDims)
            if isdlarray(functional_6_1_co_16)
                functional_6_1_co_16 = stripdims(functional_6_1_co_16);
            end
            if isdlarray(functional_6_1_glo_1)
                functional_6_1_glo_1 = stripdims(functional_6_1_glo_1);
            end
            if isdlarray(functional_6_1_glo_3)
                functional_6_1_glo_3 = stripdims(functional_6_1_glo_3);
            end
            functional_6_1_co_16NumDims = 4;
            functional_6_1_glo_1NumDims = numel(functional_6_1_glo_1NumDims);
            functional_6_1_glo_3NumDims = numel(functional_6_1_glo_3NumDims);
            functional_6_1_co_16 = test_model.ops.permuteInputVar(functional_6_1_co_16, [4 3 1 2], 4);
            functional_6_1_glo_1 = test_model.ops.permuteInputVar(functional_6_1_glo_1, ['as-is'], 0);
            functional_6_1_glo_3 = test_model.ops.permuteInputVar(functional_6_1_glo_3, ['as-is'], 0);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_AddGraph1011(this, functional_6_1_co_16, functional_6_1_glo_1, functional_6_1_glo_3, functional_6_1_co_16NumDims, functional_6_1_glo_1NumDims, functional_6_1_glo_3NumDims, false);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance] = forward(this, functional_6_1_co_16, functional_6_1_glo_1, functional_6_1_glo_3, functional_6_1_glo_1NumDims, functional_6_1_glo_3NumDims)
            if isdlarray(functional_6_1_co_16)
                functional_6_1_co_16 = stripdims(functional_6_1_co_16);
            end
            if isdlarray(functional_6_1_glo_1)
                functional_6_1_glo_1 = stripdims(functional_6_1_glo_1);
            end
            if isdlarray(functional_6_1_glo_3)
                functional_6_1_glo_3 = stripdims(functional_6_1_glo_3);
            end
            functional_6_1_co_16NumDims = 4;
            functional_6_1_glo_1NumDims = numel(functional_6_1_glo_1NumDims);
            functional_6_1_glo_3NumDims = numel(functional_6_1_glo_3NumDims);
            functional_6_1_co_16 = test_model.ops.permuteInputVar(functional_6_1_co_16, [4 3 1 2], 4);
            functional_6_1_glo_1 = test_model.ops.permuteInputVar(functional_6_1_glo_1, ['as-is'], 0);
            functional_6_1_glo_3 = test_model.ops.permuteInputVar(functional_6_1_glo_3, ['as-is'], 0);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_AddGraph1011(this, functional_6_1_co_16, functional_6_1_glo_1, functional_6_1_glo_3, functional_6_1_co_16NumDims, functional_6_1_glo_1NumDims, functional_6_1_glo_3NumDims, true);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance, typeNumDims1015, distanceNumDims1016] = Squeeze_To_AddGraph1011(this, functional_6_1_co_16, functional_6_1_glo_1, functional_6_1_glo_3, functional_6_1_co_16NumDims, functional_6_1_glo_1NumDims, functional_6_1_glo_3NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_6_1_co_15, functional_6_1_co_15NumDims] = test_model.ops.onnxSqueeze(functional_6_1_co_16, this.Vars.const_fold_opt__14_1, functional_6_1_co_16NumDims);

            % Add:
            functional_6_1_co_12 = functional_6_1_co_15 + this.Vars.const_fold_opt__1497;
            functional_6_1_co_12NumDims = max(functional_6_1_co_15NumDims, this.NumDims.const_fold_opt__1497);

            % LeakyRelu:
            functional_6_1_co_13 = leakyrelu(functional_6_1_co_12, 0.200000);
            functional_6_1_co_13NumDims = functional_6_1_co_12NumDims;

            % Transpose:
            [perm, Transpose__1473_0NumDims] = test_model.ops.prepareTransposeArgs(this.Vars.TransposePerm1012, functional_6_1_co_13NumDims);
            if isempty(perm)
                Transpose__1473_0 = functional_6_1_co_13;
            else
                Transpose__1473_0 = permute(functional_6_1_co_13, perm);
            end

            % ReduceMax:
            dims = test_model.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1013, Transpose__1473_0NumDims);
            xMax = max(Transpose__1473_0, [], dims);
            [functional_6_1_glo_2, functional_6_1_glo_2NumDims] = test_model.ops.onnxSqueeze(xMax, this.Vars.ReduceMaxAxes1013, Transpose__1473_0NumDims);

            % ReduceMean:
            dims = test_model.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1014, Transpose__1473_0NumDims);
            xMean = mean(Transpose__1473_0, dims);
            [functional_6_1_globa, functional_6_1_globaNumDims] = test_model.ops.onnxSqueeze(xMean, this.Vars.ReduceMeanAxes1014, Transpose__1473_0NumDims);

            % MatMul:
            [functional_6_1_de_14, functional_6_1_de_14NumDims] = test_model.ops.onnxMatMul(functional_6_1_globa, this.functional_6_1_de_12, functional_6_1_globaNumDims, this.NumDims.functional_6_1_de_12);

            % Add:
            functional_6_1_de_11 = functional_6_1_de_14 + this.Vars.functional_6_1_de_10;
            functional_6_1_de_11NumDims = max(functional_6_1_de_14NumDims, this.NumDims.functional_6_1_de_10);

            % LeakyRelu:
            functional_6_1_de_13 = leakyrelu(functional_6_1_de_11, 0.200000);
            functional_6_1_de_13NumDims = functional_6_1_de_11NumDims;

            % Mul:
            functional_6_1_ba_9 = functional_6_1_de_13 .* this.Vars.functional_6_1_ba_8;
            functional_6_1_ba_9NumDims = max(functional_6_1_de_13NumDims, this.NumDims.functional_6_1_ba_8);

            % Add:
            functional_6_1_ba_7 = functional_6_1_ba_9 + this.Vars.functional_6_1_ba_10;
            functional_6_1_ba_7NumDims = max(functional_6_1_ba_9NumDims, this.NumDims.functional_6_1_ba_10);

            % MatMul:
            [functional_6_1_de_4, functional_6_1_de_4NumDims] = test_model.ops.onnxMatMul(functional_6_1_globa, this.functional_6_1_de_2, functional_6_1_globaNumDims, this.NumDims.functional_6_1_de_2);

            % Add:
            functional_6_1_de_1 = functional_6_1_de_4 + this.Vars.functional_6_1_dense;
            functional_6_1_de_1NumDims = max(functional_6_1_de_4NumDims, this.NumDims.functional_6_1_dense);

            % LeakyRelu:
            functional_6_1_de_3 = leakyrelu(functional_6_1_de_1, 0.200000);
            functional_6_1_de_3NumDims = functional_6_1_de_1NumDims;

            % Mul:
            functional_6_1_ba_5 = functional_6_1_de_3 .* this.Vars.functional_6_1_ba_4;
            functional_6_1_ba_5NumDims = max(functional_6_1_de_3NumDims, this.NumDims.functional_6_1_ba_4);

            % Add:
            functional_6_1_ba_3 = functional_6_1_ba_5 + this.Vars.functional_6_1_ba_6;
            functional_6_1_ba_3NumDims = max(functional_6_1_ba_5NumDims, this.NumDims.functional_6_1_ba_6);

            % MatMul:
            [functional_6_1_de_9, functional_6_1_de_9NumDims] = test_model.ops.onnxMatMul(functional_6_1_ba_3, this.functional_6_1_de_7, functional_6_1_ba_3NumDims, this.NumDims.functional_6_1_de_7);

            % Add:
            functional_6_1_de_6 = functional_6_1_de_9 + this.Vars.functional_6_1_de_5;
            functional_6_1_de_6NumDims = max(functional_6_1_de_9NumDims, this.NumDims.functional_6_1_de_5);

            % LeakyRelu:
            functional_6_1_de_8 = leakyrelu(functional_6_1_de_6, 0.200000);
            functional_6_1_de_8NumDims = functional_6_1_de_6NumDims;

            % MatMul:
            [functional_6_1_typ_3, functional_6_1_typ_3NumDims] = test_model.ops.onnxMatMul(functional_6_1_de_8, this.functional_6_1_typ_2, functional_6_1_de_8NumDims, this.NumDims.functional_6_1_typ_2);

            % Add:
            functional_6_1_typ_1 = functional_6_1_typ_3 + this.Vars.functional_6_1_type_;
            functional_6_1_typ_1NumDims = max(functional_6_1_typ_3NumDims, this.NumDims.functional_6_1_type_);

            % Softmax:
            [type, typeNumDims] = test_model.ops.onnxSoftmax13(functional_6_1_typ_1, -1, functional_6_1_typ_1NumDims);

            % Concat:
            [functional_6_1_conca, functional_6_1_concaNumDims] = test_model.ops.onnxConcat(1, {functional_6_1_ba_7, functional_6_1_glo_2, functional_6_1_glo_1, functional_6_1_glo_3}, [functional_6_1_ba_7NumDims, functional_6_1_glo_2NumDims, functional_6_1_glo_1NumDims, functional_6_1_glo_3NumDims]);

            % MatMul:
            [functional_6_1_de_19, functional_6_1_de_19NumDims] = test_model.ops.onnxMatMul(functional_6_1_conca, this.functional_6_1_de_17, functional_6_1_concaNumDims, this.NumDims.functional_6_1_de_17);

            % Add:
            functional_6_1_de_16 = functional_6_1_de_19 + this.Vars.functional_6_1_de_15;
            functional_6_1_de_16NumDims = max(functional_6_1_de_19NumDims, this.NumDims.functional_6_1_de_15);

            % LeakyRelu:
            functional_6_1_de_18 = leakyrelu(functional_6_1_de_16, 0.200000);
            functional_6_1_de_18NumDims = functional_6_1_de_16NumDims;

            % MatMul:
            [functional_6_1_dis_2, functional_6_1_dis_2NumDims] = test_model.ops.onnxMatMul(functional_6_1_de_18, this.functional_6_1_dis_1, functional_6_1_de_18NumDims, this.NumDims.functional_6_1_dis_1);

            % Add:
            distance = functional_6_1_dis_2 + this.Vars.functional_6_1_dista;
            distanceNumDims = max(functional_6_1_dis_2NumDims, this.NumDims.functional_6_1_dista);

            % Set graph output arguments
            typeNumDims1015 = typeNumDims;
            distanceNumDims1016 = distanceNumDims;

        end

    end

end