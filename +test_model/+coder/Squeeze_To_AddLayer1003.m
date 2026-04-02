classdef Squeeze_To_AddLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

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
            this_cg = test_model.coder.Squeeze_To_AddLayer1003(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_AddLayer1003(cgInstance.Name);
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
            this_ml.functional_6_1_de_12 = cgInstance.functional_6_1_de_12;
            this_ml.functional_6_1_de_2 = cgInstance.functional_6_1_de_2;
            this_ml.functional_6_1_de_7 = cgInstance.functional_6_1_de_7;
            this_ml.functional_6_1_typ_2 = cgInstance.functional_6_1_typ_2;
            this_ml.functional_6_1_de_17 = cgInstance.functional_6_1_de_17;
            this_ml.functional_6_1_dis_1 = cgInstance.functional_6_1_dis_1;
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
                    this.Vars.(fieldname) = test_model.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
                end
            else
                this.Vars = [];
            end

            this.NumDims = mlInstance.NumDims;
            this.functional_6_1_de_12 = mlInstance.functional_6_1_de_12;
            this.functional_6_1_de_2 = mlInstance.functional_6_1_de_2;
            this.functional_6_1_de_7 = mlInstance.functional_6_1_de_7;
            this.functional_6_1_typ_2 = mlInstance.functional_6_1_typ_2;
            this.functional_6_1_de_17 = mlInstance.functional_6_1_de_17;
            this.functional_6_1_dis_1 = mlInstance.functional_6_1_dis_1;
        end

        function [type, distance] = predict(this, functional_6_1_co_16__, functional_6_1_glo_1__, functional_6_1_glo_3__, functional_6_1_glo_1NumDims__, functional_6_1_glo_3NumDims__)
            if isdlarray(functional_6_1_co_16__)
                functional_6_1_co_16_ = stripdims(functional_6_1_co_16__);
            else
                functional_6_1_co_16_ = functional_6_1_co_16__;
            end
            if isdlarray(functional_6_1_glo_1__)
                functional_6_1_glo_1_ = stripdims(functional_6_1_glo_1__);
            else
                functional_6_1_glo_1_ = functional_6_1_glo_1__;
            end
            if isdlarray(functional_6_1_glo_3__)
                functional_6_1_glo_3_ = stripdims(functional_6_1_glo_3__);
            else
                functional_6_1_glo_3_ = functional_6_1_glo_3__;
            end
            functional_6_1_co_16NumDims = 4;
            functional_6_1_glo_1NumDims = numel(functional_6_1_glo_1NumDims__);
            functional_6_1_glo_3NumDims = numel(functional_6_1_glo_3NumDims__);
            functional_6_1_co_16 = test_model.coder.ops.permuteInputVar(functional_6_1_co_16_, [4 3 1 2], 4);
            functional_6_1_glo_1 = test_model.coder.ops.permuteInputVar(functional_6_1_glo_1_, ['as-is'], 0);
            functional_6_1_glo_3 = test_model.coder.ops.permuteInputVar(functional_6_1_glo_3_, ['as-is'], 0);

            [type__, distance__, typeNumDims__, distanceNumDims__] = Squeeze_To_AddGraph1011(this, functional_6_1_co_16, functional_6_1_glo_1, functional_6_1_glo_3, functional_6_1_co_16NumDims, functional_6_1_glo_1NumDims, functional_6_1_glo_3NumDims, false);
            type_ = test_model.coder.ops.permuteOutputVar(type__, ['as-is'], 2);
            distance_ = test_model.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [type, distance, typeNumDims1015, distanceNumDims1016] = Squeeze_To_AddGraph1011(this, functional_6_1_co_16, functional_6_1_glo_1, functional_6_1_glo_3, functional_6_1_co_16NumDims, functional_6_1_glo_1NumDims, functional_6_1_glo_3NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_6_1_co_15, functional_6_1_co_15NumDims] = test_model.coder.ops.onnxSqueeze(functional_6_1_co_16, this.Vars.const_fold_opt__14_1, coder.const(functional_6_1_co_16NumDims));

            % Add:
            functional_6_1_co_12 = functional_6_1_co_15 + this.Vars.const_fold_opt__1497;
            functional_6_1_co_12NumDims = max(coder.const(functional_6_1_co_15NumDims), this.NumDims.const_fold_opt__1497);

            % LeakyRelu:
            functional_6_1_co_13 = leakyrelu(dlarray(functional_6_1_co_12), 0.200000);
            functional_6_1_co_13NumDims = coder.const(functional_6_1_co_12NumDims);

            % Transpose:
            [perm1008, Transpose__1473_0NumDims] = test_model.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1012, coder.const(functional_6_1_co_13NumDims));
            if isempty(perm1008)
                Transpose__1473_0 = functional_6_1_co_13;
            else
                Transpose__1473_0 = permute(test_model.coder.ops.extractIfDlarray(functional_6_1_co_13), perm1008);
            end

            % ReduceMax:
            dims1009 = test_model.coder.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1013, coder.const(Transpose__1473_0NumDims));
            xReduced1010 = max(Transpose__1473_0, [], dims1009);
            [functional_6_1_glo_2, functional_6_1_glo_2NumDims] = test_model.coder.ops.onnxSqueeze(xReduced1010, this.Vars.ReduceMaxAxes1013, coder.const(Transpose__1473_0NumDims));

            % ReduceMean:
            dims1011 = test_model.coder.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1014, coder.const(Transpose__1473_0NumDims));
            xReduced1012 = mean(Transpose__1473_0, dims1011);
            [functional_6_1_globa, functional_6_1_globaNumDims] = test_model.coder.ops.onnxSqueeze(xReduced1012, this.Vars.ReduceMeanAxes1014, coder.const(Transpose__1473_0NumDims));

            % MatMul:
            [functional_6_1_de_14, functional_6_1_de_14NumDims] = test_model.coder.ops.onnxMatMul(functional_6_1_globa, this.functional_6_1_de_12, coder.const(functional_6_1_globaNumDims), this.NumDims.functional_6_1_de_12);

            % Add:
            functional_6_1_de_11 = functional_6_1_de_14 + this.Vars.functional_6_1_de_10;
            functional_6_1_de_11NumDims = max(coder.const(functional_6_1_de_14NumDims), this.NumDims.functional_6_1_de_10);

            % LeakyRelu:
            functional_6_1_de_13 = leakyrelu(dlarray(functional_6_1_de_11), 0.200000);
            functional_6_1_de_13NumDims = coder.const(functional_6_1_de_11NumDims);

            % Mul:
            functional_6_1_ba_9 = functional_6_1_de_13 .* this.Vars.functional_6_1_ba_8;
            functional_6_1_ba_9NumDims = max(coder.const(functional_6_1_de_13NumDims), this.NumDims.functional_6_1_ba_8);

            % Add:
            functional_6_1_ba_7 = functional_6_1_ba_9 + this.Vars.functional_6_1_ba_10;
            functional_6_1_ba_7NumDims = max(coder.const(functional_6_1_ba_9NumDims), this.NumDims.functional_6_1_ba_10);

            % MatMul:
            [functional_6_1_de_4, functional_6_1_de_4NumDims] = test_model.coder.ops.onnxMatMul(functional_6_1_globa, this.functional_6_1_de_2, coder.const(functional_6_1_globaNumDims), this.NumDims.functional_6_1_de_2);

            % Add:
            functional_6_1_de_1 = functional_6_1_de_4 + this.Vars.functional_6_1_dense;
            functional_6_1_de_1NumDims = max(coder.const(functional_6_1_de_4NumDims), this.NumDims.functional_6_1_dense);

            % LeakyRelu:
            functional_6_1_de_3 = leakyrelu(dlarray(functional_6_1_de_1), 0.200000);
            functional_6_1_de_3NumDims = coder.const(functional_6_1_de_1NumDims);

            % Mul:
            functional_6_1_ba_5 = functional_6_1_de_3 .* this.Vars.functional_6_1_ba_4;
            functional_6_1_ba_5NumDims = max(coder.const(functional_6_1_de_3NumDims), this.NumDims.functional_6_1_ba_4);

            % Add:
            functional_6_1_ba_3 = functional_6_1_ba_5 + this.Vars.functional_6_1_ba_6;
            functional_6_1_ba_3NumDims = max(coder.const(functional_6_1_ba_5NumDims), this.NumDims.functional_6_1_ba_6);

            % MatMul:
            [functional_6_1_de_9, functional_6_1_de_9NumDims] = test_model.coder.ops.onnxMatMul(functional_6_1_ba_3, this.functional_6_1_de_7, coder.const(functional_6_1_ba_3NumDims), this.NumDims.functional_6_1_de_7);

            % Add:
            functional_6_1_de_6 = functional_6_1_de_9 + this.Vars.functional_6_1_de_5;
            functional_6_1_de_6NumDims = max(coder.const(functional_6_1_de_9NumDims), this.NumDims.functional_6_1_de_5);

            % LeakyRelu:
            functional_6_1_de_8 = leakyrelu(dlarray(functional_6_1_de_6), 0.200000);
            functional_6_1_de_8NumDims = coder.const(functional_6_1_de_6NumDims);

            % MatMul:
            [functional_6_1_typ_3, functional_6_1_typ_3NumDims] = test_model.coder.ops.onnxMatMul(functional_6_1_de_8, this.functional_6_1_typ_2, coder.const(functional_6_1_de_8NumDims), this.NumDims.functional_6_1_typ_2);

            % Add:
            functional_6_1_typ_1 = functional_6_1_typ_3 + this.Vars.functional_6_1_type_;
            functional_6_1_typ_1NumDims = max(coder.const(functional_6_1_typ_3NumDims), this.NumDims.functional_6_1_type_);

            % Softmax:
            [type, typeNumDims] = test_model.coder.ops.onnxSoftmax13(functional_6_1_typ_1, -1, coder.const(functional_6_1_typ_1NumDims));

            % Concat:
            [functional_6_1_conca, functional_6_1_concaNumDims] = test_model.coder.ops.onnxConcat(1, {functional_6_1_ba_7, functional_6_1_glo_2, functional_6_1_glo_1, functional_6_1_glo_3}, [coder.const(functional_6_1_ba_7NumDims), coder.const(functional_6_1_glo_2NumDims), coder.const(functional_6_1_glo_1NumDims), coder.const(functional_6_1_glo_3NumDims)]);

            % MatMul:
            [functional_6_1_de_19, functional_6_1_de_19NumDims] = test_model.coder.ops.onnxMatMul(functional_6_1_conca, this.functional_6_1_de_17, coder.const(functional_6_1_concaNumDims), this.NumDims.functional_6_1_de_17);

            % Add:
            functional_6_1_de_16 = functional_6_1_de_19 + this.Vars.functional_6_1_de_15;
            functional_6_1_de_16NumDims = max(coder.const(functional_6_1_de_19NumDims), this.NumDims.functional_6_1_de_15);

            % LeakyRelu:
            functional_6_1_de_18 = leakyrelu(dlarray(functional_6_1_de_16), 0.200000);
            functional_6_1_de_18NumDims = coder.const(functional_6_1_de_16NumDims);

            % MatMul:
            [functional_6_1_dis_2, functional_6_1_dis_2NumDims] = test_model.coder.ops.onnxMatMul(functional_6_1_de_18, this.functional_6_1_dis_1, coder.const(functional_6_1_de_18NumDims), this.NumDims.functional_6_1_dis_1);

            % Add:
            distance = functional_6_1_dis_2 + this.Vars.functional_6_1_dista;
            distanceNumDims = max(coder.const(functional_6_1_dis_2NumDims), this.NumDims.functional_6_1_dista);

            % Set graph output arguments
            typeNumDims1015 = typeNumDims;
            distanceNumDims1016 = distanceNumDims;

        end

    end

end