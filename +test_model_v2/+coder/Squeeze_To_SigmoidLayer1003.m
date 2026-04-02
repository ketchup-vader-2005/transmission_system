classdef Squeeze_To_SigmoidLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

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
            this_cg = test_model_v2.coder.Squeeze_To_SigmoidLayer1003(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model_v2.Squeeze_To_SigmoidLayer1003(cgInstance.Name);
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
            this_ml.functional_1_dens_9 = cgInstance.functional_1_dens_9;
            this_ml.functional_1_dens_2 = cgInstance.functional_1_dens_2;
            this_ml.functional_1_type__2 = cgInstance.functional_1_type__2;
            this_ml.functional_1_dens_16 = cgInstance.functional_1_dens_16;
            this_ml.functional_1_dens_23 = cgInstance.functional_1_dens_23;
            this_ml.functional_1_dista_2 = cgInstance.functional_1_dista_2;
        end
    end

    methods
        function this = Squeeze_To_SigmoidLayer1003(mlInstance)
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
            this.functional_1_dens_9 = mlInstance.functional_1_dens_9;
            this.functional_1_dens_2 = mlInstance.functional_1_dens_2;
            this.functional_1_type__2 = mlInstance.functional_1_type__2;
            this.functional_1_dens_16 = mlInstance.functional_1_dens_16;
            this.functional_1_dens_23 = mlInstance.functional_1_dens_23;
            this.functional_1_dista_2 = mlInstance.functional_1_dista_2;
        end

        function [type, distance] = predict(this, functional_1_conv_16__, functional_1_globa_1__, functional_1_globa_3__, functional_1_globa_1NumDims__, functional_1_globa_3NumDims__)
            if isdlarray(functional_1_conv_16__)
                functional_1_conv_16_ = stripdims(functional_1_conv_16__);
            else
                functional_1_conv_16_ = functional_1_conv_16__;
            end
            if isdlarray(functional_1_globa_1__)
                functional_1_globa_1_ = stripdims(functional_1_globa_1__);
            else
                functional_1_globa_1_ = functional_1_globa_1__;
            end
            if isdlarray(functional_1_globa_3__)
                functional_1_globa_3_ = stripdims(functional_1_globa_3__);
            else
                functional_1_globa_3_ = functional_1_globa_3__;
            end
            functional_1_conv_16NumDims = 4;
            functional_1_globa_1NumDims = numel(functional_1_globa_1NumDims__);
            functional_1_globa_3NumDims = numel(functional_1_globa_3NumDims__);
            functional_1_conv_16 = test_model_v2.coder.ops.permuteInputVar(functional_1_conv_16_, [4 3 1 2], 4);
            functional_1_globa_1 = test_model_v2.coder.ops.permuteInputVar(functional_1_globa_1_, ['as-is'], 0);
            functional_1_globa_3 = test_model_v2.coder.ops.permuteInputVar(functional_1_globa_3_, ['as-is'], 0);

            [type__, distance__, typeNumDims__, distanceNumDims__] = Squeeze_To_SigmoidGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, false);
            type_ = test_model_v2.coder.ops.permuteOutputVar(type__, ['as-is'], 2);
            distance_ = test_model_v2.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [type, distance, typeNumDims1015, distanceNumDims1016] = Squeeze_To_SigmoidGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_15, functional_1_conv_15NumDims] = test_model_v2.coder.ops.onnxSqueeze(functional_1_conv_16, this.Vars.const_fold_opt__24_1, coder.const(functional_1_conv_16NumDims));

            % Add:
            functional_1_conv_12 = functional_1_conv_15 + this.Vars.const_fold_opt__2427;
            functional_1_conv_12NumDims = max(coder.const(functional_1_conv_15NumDims), this.NumDims.const_fold_opt__2427);

            % LeakyRelu:
            functional_1_conv_13 = leakyrelu(dlarray(functional_1_conv_12), 0.200000);
            functional_1_conv_13NumDims = coder.const(functional_1_conv_12NumDims);

            % Transpose:
            [perm1008, Transpose__2402_0NumDims] = test_model_v2.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1012, coder.const(functional_1_conv_13NumDims));
            if isempty(perm1008)
                Transpose__2402_0 = functional_1_conv_13;
            else
                Transpose__2402_0 = permute(test_model_v2.coder.ops.extractIfDlarray(functional_1_conv_13), perm1008);
            end

            % ReduceMax:
            dims1009 = test_model_v2.coder.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1013, coder.const(Transpose__2402_0NumDims));
            xReduced1010 = max(Transpose__2402_0, [], dims1009);
            [functional_1_globa_2, functional_1_globa_2NumDims] = test_model_v2.coder.ops.onnxSqueeze(xReduced1010, this.Vars.ReduceMaxAxes1013, coder.const(Transpose__2402_0NumDims));

            % ReduceMean:
            dims1011 = test_model_v2.coder.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1014, coder.const(Transpose__2402_0NumDims));
            xReduced1012 = mean(Transpose__2402_0, dims1011);
            [functional_1_global_, functional_1_global_NumDims] = test_model_v2.coder.ops.onnxSqueeze(xReduced1012, this.Vars.ReduceMeanAxes1014, coder.const(Transpose__2402_0NumDims));

            % MatMul:
            [functional_1_dens_11, functional_1_dens_11NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_1_global_, this.functional_1_dens_9, coder.const(functional_1_global_NumDims), this.NumDims.functional_1_dens_9);

            % Add:
            functional_1_dens_8 = functional_1_dens_11 + this.Vars.functional_1_dense_2;
            functional_1_dens_8NumDims = max(coder.const(functional_1_dens_11NumDims), this.NumDims.functional_1_dense_2);

            % LeakyRelu:
            functional_1_dens_10 = leakyrelu(dlarray(functional_1_dens_8), 0.200000);
            functional_1_dens_10NumDims = coder.const(functional_1_dens_8NumDims);

            % Mul:
            functional_1_batc_5 = functional_1_dens_10 .* this.Vars.functional_1_batc_4;
            functional_1_batc_5NumDims = max(coder.const(functional_1_dens_10NumDims), this.NumDims.functional_1_batc_4);

            % Add:
            functional_1_batc_3 = functional_1_batc_5 + this.Vars.functional_1_batc_6;
            functional_1_batc_3NumDims = max(coder.const(functional_1_batc_5NumDims), this.NumDims.functional_1_batc_6);

            % MatMul:
            [functional_1_dens_4, functional_1_dens_4NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_1_global_, this.functional_1_dens_2, coder.const(functional_1_global_NumDims), this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_4 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(coder.const(functional_1_dens_4NumDims), this.NumDims.functional_1_dense_1);

            % LeakyRelu:
            functional_1_dens_3 = leakyrelu(dlarray(functional_1_dens_1), 0.200000);
            functional_1_dens_3NumDims = coder.const(functional_1_dens_1NumDims);

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_1_dens_3, this.functional_1_type__2, coder.const(functional_1_dens_3NumDims), this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(coder.const(functional_1_type__3NumDims), this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model_v2.coder.ops.onnxSoftmax13(functional_1_type__1, -1, coder.const(functional_1_type__1NumDims));

            % Concat:
            [functional_1_concate, functional_1_concateNumDims] = test_model_v2.coder.ops.onnxConcat(1, {functional_1_batc_3, functional_1_globa_2, functional_1_globa_1, functional_1_globa_3}, [coder.const(functional_1_batc_3NumDims), coder.const(functional_1_globa_2NumDims), coder.const(functional_1_globa_1NumDims), coder.const(functional_1_globa_3NumDims)]);

            % MatMul:
            [functional_1_dens_18, functional_1_dens_18NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_1_concate, this.functional_1_dens_16, coder.const(functional_1_concateNumDims), this.NumDims.functional_1_dens_16);

            % Add:
            functional_1_dens_15 = functional_1_dens_18 + this.Vars.functional_1_dense_3;
            functional_1_dens_15NumDims = max(coder.const(functional_1_dens_18NumDims), this.NumDims.functional_1_dense_3);

            % LeakyRelu:
            functional_1_dens_17 = leakyrelu(dlarray(functional_1_dens_15), 0.200000);
            functional_1_dens_17NumDims = coder.const(functional_1_dens_15NumDims);

            % Mul:
            functional_1_batc_9 = functional_1_dens_17 .* this.Vars.functional_1_batc_8;
            functional_1_batc_9NumDims = max(coder.const(functional_1_dens_17NumDims), this.NumDims.functional_1_batc_8);

            % Add:
            functional_1_batc_7 = functional_1_batc_9 + this.Vars.functional_1_batc_10;
            functional_1_batc_7NumDims = max(coder.const(functional_1_batc_9NumDims), this.NumDims.functional_1_batc_10);

            % MatMul:
            [functional_1_dens_25, functional_1_dens_25NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_1_batc_7, this.functional_1_dens_23, coder.const(functional_1_batc_7NumDims), this.NumDims.functional_1_dens_23);

            % Add:
            functional_1_dens_22 = functional_1_dens_25 + this.Vars.functional_1_dense_4;
            functional_1_dens_22NumDims = max(coder.const(functional_1_dens_25NumDims), this.NumDims.functional_1_dense_4);

            % LeakyRelu:
            functional_1_dens_24 = leakyrelu(dlarray(functional_1_dens_22), 0.200000);
            functional_1_dens_24NumDims = coder.const(functional_1_dens_22NumDims);

            % MatMul:
            [functional_1_dista_3, functional_1_dista_3NumDims] = test_model_v2.coder.ops.onnxMatMul(functional_1_dens_24, this.functional_1_dista_2, coder.const(functional_1_dens_24NumDims), this.NumDims.functional_1_dista_2);

            % Add:
            functional_1_dista_1 = functional_1_dista_3 + this.Vars.functional_1_distanc;
            functional_1_dista_1NumDims = max(coder.const(functional_1_dista_3NumDims), this.NumDims.functional_1_distanc);

            % Sigmoid:
            X1013 = dlarray(test_model_v2.coder.ops.extractIfDlarray(functional_1_dista_1));
            Y1014 = sigmoid(X1013);
            distance = test_model_v2.coder.ops.extractIfDlarray(Y1014);
            distanceNumDims = coder.const(functional_1_dista_1NumDims);

            % Set graph output arguments
            typeNumDims1015 = typeNumDims;
            distanceNumDims1016 = distanceNumDims;

        end

    end

end