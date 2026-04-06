classdef Squeeze_To_AddLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

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
        % Specify the properties of the class that will not be modified
        % after the first assignment.
        function p = matlabCodegenNontunableProperties(~)
            p = {
                % Constants, i.e., Vars, NumDims and all learnables and states
                'Vars'
                'NumDims'
                };
        end
    end


    methods(Static, Hidden)
        % Instantiate a codegenable layer instance from a MATLAB layer instance
        function this_cg = matlabCodegenToRedirected(mlInstance)
            this_cg = test_model_v2.coder.Squeeze_To_AddLayer1003(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model_v2.Squeeze_To_AddLayer1003(cgInstance.Name);
            if isstruct(cgInstance.Vars)
                names = fieldnames(cgInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this_ml.Vars.(fieldname) = dlarray(cgInstance.Vars.(fieldname));
                end
            else
                this_ml.Vars = [];
            end
            this_ml.NumDims = cgInstance.NumDims;
            this_ml.functional_2_1_de_12 = cgInstance.functional_2_1_de_12;
            this_ml.functional_2_1_de_17 = cgInstance.functional_2_1_de_17;
            this_ml.functional_2_1_de_22 = cgInstance.functional_2_1_de_22;
            this_ml.functional_2_1_de_27 = cgInstance.functional_2_1_de_27;
            this_ml.functional_2_1_dis_1 = cgInstance.functional_2_1_dis_1;
            this_ml.functional_2_1_de_2 = cgInstance.functional_2_1_de_2;
            this_ml.functional_2_1_de_7 = cgInstance.functional_2_1_de_7;
            this_ml.functional_2_1_typ_2 = cgInstance.functional_2_1_typ_2;
        end
    end

    methods
        function this = Squeeze_To_AddLayer1003(mlInstance)
            this.Name = mlInstance.Name;
            this.NumInputs = 5;
            this.NumOutputs = 2;
            this.OutputNames = {'type', 'distance'};
            if isstruct(mlInstance.Vars)
                names = fieldnames(mlInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this.Vars.(fieldname) = test_model_v2.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
                end
            else
                this.Vars = [];
            end

            this.NumDims = mlInstance.NumDims;
            this.functional_2_1_de_12 = mlInstance.functional_2_1_de_12;
            this.functional_2_1_de_17 = mlInstance.functional_2_1_de_17;
            this.functional_2_1_de_22 = mlInstance.functional_2_1_de_22;
            this.functional_2_1_de_27 = mlInstance.functional_2_1_de_27;
            this.functional_2_1_dis_1 = mlInstance.functional_2_1_dis_1;
            this.functional_2_1_de_2 = mlInstance.functional_2_1_de_2;
            this.functional_2_1_de_7 = mlInstance.functional_2_1_de_7;
            this.functional_2_1_typ_2 = mlInstance.functional_2_1_typ_2;
        end

        function [type, distance] = predict(this, functional_2_1_co_16__, functional_2_1_globa__, functional_2_1_glo_2__, functional_2_1_globaNumDims__, functional_2_1_glo_2NumDims__)
            if isdlarray(functional_2_1_co_16__)
                functional_2_1_co_16_ = stripdims(functional_2_1_co_16__);
            else
                functional_2_1_co_16_ = functional_2_1_co_16__;
            end
            if isdlarray(functional_2_1_globa__)
                functional_2_1_globa_ = stripdims(functional_2_1_globa__);
            else
                functional_2_1_globa_ = functional_2_1_globa__;
            end
            if isdlarray(functional_2_1_glo_2__)
                functional_2_1_glo_2_ = stripdims(functional_2_1_glo_2__);
            else
                functional_2_1_glo_2_ = functional_2_1_glo_2__;
            end
            functional_2_1_co_16NumDims = 4;
            functional_2_1_globaNumDims = numel(functional_2_1_globaNumDims__);
            functional_2_1_glo_2NumDims = numel(functional_2_1_glo_2NumDims__);
            functional_2_1_co_16 = test_model_v2.coder.ops.permuteInputVar(functional_2_1_co_16_, [4 3 1 2], 4);
            functional_2_1_globa = test_model_v2.coder.ops.permuteInputVar(functional_2_1_globa_, ['as-is'], 0);
            functional_2_1_glo_2 = test_model_v2.coder.ops.permuteInputVar(functional_2_1_glo_2_, ['as-is'], 0);

            [type__, distance__, typeNumDims__, distanceNumDims__] = Squeeze_To_AddGraph1011(this, functional_2_1_co_16, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_co_16NumDims, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims, false);
            type_ = test_model_v2.coder.ops.permuteOutputVar(type__, ['as-is'], 2);
            distance_ = test_model_v2.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [type, distance, typeNumDims1015, distanceNumDims1016] = Squeeze_To_AddGraph1011(this, functional_2_1_co_16, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_co_16NumDims, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_2_1_co_15, functional_2_1_co_15NumDims] = test_model_v2.coder.ops.onnxSqueeze(functional_2_1_co_16, this.Vars.const_fold_opt__104_, coder.const(functional_2_1_co_16NumDims));

            % Add:
            functional_2_1_co_12 = functional_2_1_co_15 + this.Vars.const_fold_opt__102;
            functional_2_1_co_12NumDims = max(coder.const(functional_2_1_co_15NumDims), this.NumDims.const_fold_opt__102);

            % LeakyRelu:
            functional_2_1_co_13 = leakyrelu(dlarray(functional_2_1_co_12), 0.200000);
            functional_2_1_co_13NumDims = coder.const(functional_2_1_co_12NumDims);

            % Transpose:
            [perm1012, Transpose__87_0NumDims] = test_model_v2.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1012, coder.const(functional_2_1_co_13NumDims));
            if isempty(perm1012)
                Transpose__87_0 = functional_2_1_co_13;
            else
                Transpose__87_0 = permute(test_model_v2.coder.ops.extractIfDlarray(functional_2_1_co_13), perm1012);
            end

            % ReduceMax:
            dims1013 = test_model_v2.coder.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1013, coder.const(Transpose__87_0NumDims));
            xReduced1014 = max(Transpose__87_0, [], dims1013);
            [functional_2_1_glo_3, functional_2_1_glo_3NumDims] = test_model_v2.coder.ops.onnxSqueeze(xReduced1014, this.Vars.ReduceMaxAxes1013, coder.const(Transpose__87_0NumDims));

            % ReduceMean:
            dims1015 = test_model_v2.coder.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1014, coder.const(Transpose__87_0NumDims));
            xReduced1016 = mean(Transpose__87_0, dims1015);
            [functional_2_1_glo_1, functional_2_1_glo_1NumDims] = test_model_v2.coder.ops.onnxSqueeze(xReduced1016, this.Vars.ReduceMeanAxes1014, coder.const(Transpose__87_0NumDims));

            % MatMul:
            [functional_2_1_de_14, functional_2_1_de_14NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_2_1_glo_1, this.functional_2_1_de_12, coder.const(functional_2_1_glo_1NumDims), this.NumDims.functional_2_1_de_12);

            % Add:
            functional_2_1_de_11 = functional_2_1_de_14 + this.Vars.functional_2_1_de_10;
            functional_2_1_de_11NumDims = max(coder.const(functional_2_1_de_14NumDims), this.NumDims.functional_2_1_de_10);

            % LeakyRelu:
            functional_2_1_de_13 = leakyrelu(dlarray(functional_2_1_de_11), 0.200000);
            functional_2_1_de_13NumDims = coder.const(functional_2_1_de_11NumDims);

            % Concat:
            [functional_2_1_con_2, functional_2_1_con_2NumDims] = test_model_v2.coder.ops.onnxConcat(1, {functional_2_1_de_13, functional_2_1_glo_3, functional_2_1_globa, functional_2_1_glo_2}, [coder.const(functional_2_1_de_13NumDims), coder.const(functional_2_1_glo_3NumDims), coder.const(functional_2_1_globaNumDims), coder.const(functional_2_1_glo_2NumDims)]);

            % MatMul:
            [functional_2_1_de_19, functional_2_1_de_19NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_2_1_con_2, this.functional_2_1_de_17, coder.const(functional_2_1_con_2NumDims), this.NumDims.functional_2_1_de_17);

            % Add:
            functional_2_1_de_16 = functional_2_1_de_19 + this.Vars.functional_2_1_de_15;
            functional_2_1_de_16NumDims = max(coder.const(functional_2_1_de_19NumDims), this.NumDims.functional_2_1_de_15);

            % LeakyRelu:
            functional_2_1_de_18 = leakyrelu(dlarray(functional_2_1_de_16), 0.200000);
            functional_2_1_de_18NumDims = coder.const(functional_2_1_de_16NumDims);

            % MatMul:
            [functional_2_1_de_24, functional_2_1_de_24NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_2_1_de_18, this.functional_2_1_de_22, coder.const(functional_2_1_de_18NumDims), this.NumDims.functional_2_1_de_22);

            % Add:
            functional_2_1_de_21 = functional_2_1_de_24 + this.Vars.functional_2_1_de_20;
            functional_2_1_de_21NumDims = max(coder.const(functional_2_1_de_24NumDims), this.NumDims.functional_2_1_de_20);

            % LeakyRelu:
            functional_2_1_de_23 = leakyrelu(dlarray(functional_2_1_de_21), 0.200000);
            functional_2_1_de_23NumDims = coder.const(functional_2_1_de_21NumDims);

            % MatMul:
            [functional_2_1_de_29, functional_2_1_de_29NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_2_1_de_23, this.functional_2_1_de_27, coder.const(functional_2_1_de_23NumDims), this.NumDims.functional_2_1_de_27);

            % Add:
            functional_2_1_de_26 = functional_2_1_de_29 + this.Vars.functional_2_1_de_25;
            functional_2_1_de_26NumDims = max(coder.const(functional_2_1_de_29NumDims), this.NumDims.functional_2_1_de_25);

            % LeakyRelu:
            functional_2_1_de_28 = leakyrelu(dlarray(functional_2_1_de_26), 0.200000);
            functional_2_1_de_28NumDims = coder.const(functional_2_1_de_26NumDims);

            % MatMul:
            [functional_2_1_dis_2, functional_2_1_dis_2NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_2_1_de_28, this.functional_2_1_dis_1, coder.const(functional_2_1_de_28NumDims), this.NumDims.functional_2_1_dis_1);

            % Add:
            distance = functional_2_1_dis_2 + this.Vars.functional_2_1_dista;
            distanceNumDims = max(coder.const(functional_2_1_dis_2NumDims), this.NumDims.functional_2_1_dista);

            % Concat:
            [functional_2_1_con_1, functional_2_1_con_1NumDims] = test_model_v2.coder.ops.onnxConcat(1, {functional_2_1_glo_1, functional_2_1_glo_3, functional_2_1_globa}, [coder.const(functional_2_1_glo_1NumDims), coder.const(functional_2_1_glo_3NumDims), coder.const(functional_2_1_globaNumDims)]);

            % MatMul:
            [functional_2_1_de_4, functional_2_1_de_4NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_2_1_con_1, this.functional_2_1_de_2, coder.const(functional_2_1_con_1NumDims), this.NumDims.functional_2_1_de_2);

            % Add:
            functional_2_1_de_1 = functional_2_1_de_4 + this.Vars.functional_2_1_dense;
            functional_2_1_de_1NumDims = max(coder.const(functional_2_1_de_4NumDims), this.NumDims.functional_2_1_dense);

            % LeakyRelu:
            functional_2_1_de_3 = leakyrelu(dlarray(functional_2_1_de_1), 0.200000);
            functional_2_1_de_3NumDims = coder.const(functional_2_1_de_1NumDims);

            % MatMul:
            [functional_2_1_de_9, functional_2_1_de_9NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_2_1_de_3, this.functional_2_1_de_7, coder.const(functional_2_1_de_3NumDims), this.NumDims.functional_2_1_de_7);

            % Add:
            functional_2_1_de_6 = functional_2_1_de_9 + this.Vars.functional_2_1_de_5;
            functional_2_1_de_6NumDims = max(coder.const(functional_2_1_de_9NumDims), this.NumDims.functional_2_1_de_5);

            % LeakyRelu:
            functional_2_1_de_8 = leakyrelu(dlarray(functional_2_1_de_6), 0.200000);
            functional_2_1_de_8NumDims = coder.const(functional_2_1_de_6NumDims);

            % MatMul:
            [functional_2_1_typ_3, functional_2_1_typ_3NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_2_1_de_8, this.functional_2_1_typ_2, coder.const(functional_2_1_de_8NumDims), this.NumDims.functional_2_1_typ_2);

            % Add:
            functional_2_1_typ_1 = functional_2_1_typ_3 + this.Vars.functional_2_1_type_;
            functional_2_1_typ_1NumDims = max(coder.const(functional_2_1_typ_3NumDims), this.NumDims.functional_2_1_type_);

            % Softmax:
            [type, typeNumDims] = test_model_v2.coder.ops.onnxSoftmax13(functional_2_1_typ_1, -1, coder.const(functional_2_1_typ_1NumDims));

            % Set graph output arguments
            typeNumDims1015 = typeNumDims;
            distanceNumDims1016 = distanceNumDims;

        end

    end

end