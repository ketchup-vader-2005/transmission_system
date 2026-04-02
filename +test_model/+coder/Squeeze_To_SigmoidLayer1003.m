classdef Squeeze_To_SigmoidLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dens_1
        functional_1_dense_2
        functional_1_dense_5
        functional_1_dense_1
        functional_1_type__1
        functional_1_type_1_
        functional_1_dens_6
        functional_1_dense_3
        functional_1_dens_11
        functional_1_dense_4
        functional_1_dista_1
        functional_1_distanc
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
            this_cg = test_model.coder.Squeeze_To_SigmoidLayer1003(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_SigmoidLayer1003(cgInstance.Name);
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
            this_ml.functional_1_dens_1 = cgInstance.functional_1_dens_1;
            this_ml.functional_1_dense_2 = cgInstance.functional_1_dense_2;
            this_ml.functional_1_dense_5 = cgInstance.functional_1_dense_5;
            this_ml.functional_1_dense_1 = cgInstance.functional_1_dense_1;
            this_ml.functional_1_type__1 = cgInstance.functional_1_type__1;
            this_ml.functional_1_type_1_ = cgInstance.functional_1_type_1_;
            this_ml.functional_1_dens_6 = cgInstance.functional_1_dens_6;
            this_ml.functional_1_dense_3 = cgInstance.functional_1_dense_3;
            this_ml.functional_1_dens_11 = cgInstance.functional_1_dens_11;
            this_ml.functional_1_dense_4 = cgInstance.functional_1_dense_4;
            this_ml.functional_1_dista_1 = cgInstance.functional_1_dista_1;
            this_ml.functional_1_distanc = cgInstance.functional_1_distanc;
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
                    this.Vars.(fieldname) = test_model.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
                end
            else
                this.Vars = [];
            end

            this.NumDims = mlInstance.NumDims;
            this.functional_1_dens_1 = mlInstance.functional_1_dens_1;
            this.functional_1_dense_2 = mlInstance.functional_1_dense_2;
            this.functional_1_dense_5 = mlInstance.functional_1_dense_5;
            this.functional_1_dense_1 = mlInstance.functional_1_dense_1;
            this.functional_1_type__1 = mlInstance.functional_1_type__1;
            this.functional_1_type_1_ = mlInstance.functional_1_type_1_;
            this.functional_1_dens_6 = mlInstance.functional_1_dens_6;
            this.functional_1_dense_3 = mlInstance.functional_1_dense_3;
            this.functional_1_dens_11 = mlInstance.functional_1_dens_11;
            this.functional_1_dense_4 = mlInstance.functional_1_dense_4;
            this.functional_1_dista_1 = mlInstance.functional_1_dista_1;
            this.functional_1_distanc = mlInstance.functional_1_distanc;
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
            functional_1_conv_16 = test_model.coder.ops.permuteInputVar(functional_1_conv_16_, [4 3 1 2], 4);
            functional_1_globa_1 = test_model.coder.ops.permuteInputVar(functional_1_globa_1_, ['as-is'], 0);
            functional_1_globa_3 = test_model.coder.ops.permuteInputVar(functional_1_globa_3_, ['as-is'], 0);

            [type__, distance__, typeNumDims__, distanceNumDims__] = Squeeze_To_SigmoidGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, false);
            type_ = test_model.coder.ops.permuteOutputVar(type__, ['as-is'], 2);
            distance_ = test_model.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [type, distance, typeNumDims1027, distanceNumDims1028] = Squeeze_To_SigmoidGraph1011(this, functional_1_conv_16, functional_1_globa_1, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_15, functional_1_conv_15NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_conv_16, this.Vars.axes_const__1939__19, coder.const(functional_1_conv_16NumDims));

            % Add:
            functional_1_conv_12 = functional_1_conv_15 + this.Vars.const_fold_opt__1988;
            functional_1_conv_12NumDims = max(coder.const(functional_1_conv_15NumDims), this.NumDims.const_fold_opt__1988);

            % LeakyRelu:
            functional_1_conv_13 = leakyrelu(dlarray(functional_1_conv_12), 0.200000);
            functional_1_conv_13NumDims = coder.const(functional_1_conv_12NumDims);

            % Transpose:
            [perm1008, Transpose__1968_0NumDims] = test_model.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1012, coder.const(functional_1_conv_13NumDims));
            if isempty(perm1008)
                Transpose__1968_0 = functional_1_conv_13;
            else
                Transpose__1968_0 = permute(test_model.coder.ops.extractIfDlarray(functional_1_conv_13), perm1008);
            end

            % ReduceMax:
            dims1009 = test_model.coder.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1013, coder.const(Transpose__1968_0NumDims));
            xReduced1010 = max(Transpose__1968_0, [], dims1009);
            [functional_1_globa_2, functional_1_globa_2NumDims] = test_model.coder.ops.onnxSqueeze(xReduced1010, this.Vars.ReduceMaxAxes1013, coder.const(Transpose__1968_0NumDims));

            % ReduceMean:
            dims1011 = test_model.coder.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1014, coder.const(Transpose__1968_0NumDims));
            xReduced1012 = mean(Transpose__1968_0, dims1011);
            [functional_1_global_, functional_1_global_NumDims] = test_model.coder.ops.onnxSqueeze(xReduced1012, this.Vars.ReduceMeanAxes1014, coder.const(Transpose__1968_0NumDims));

            % Gemm:
            [A1013, B1014, C1015, alpha1016, beta1017, functional_1_dens_3NumDims] = test_model.coder.ops.prepareGemmArgs(functional_1_global_, this.functional_1_dens_1, this.functional_1_dense_2, this.Vars.Gemmalpha1015, this.Vars.Gemmbeta1016, 0, 0, this.NumDims.functional_1_dense_2);
            functional_1_dens_3 = alpha1016*B1014*A1013 + beta1017*C1015;

            % LeakyRelu:
            functional_1_dens_2 = leakyrelu(dlarray(functional_1_dens_3), 0.200000);
            functional_1_dens_2NumDims = coder.const(functional_1_dens_3NumDims);

            % Mul:
            functional_1_batc_5 = functional_1_dens_2 .* this.Vars.functional_1_batc_4;
            functional_1_batc_5NumDims = max(coder.const(functional_1_dens_2NumDims), this.NumDims.functional_1_batc_4);

            % Add:
            functional_1_batc_3 = functional_1_batc_5 + this.Vars.functional_1_batc_6;
            functional_1_batc_3NumDims = max(coder.const(functional_1_batc_5NumDims), this.NumDims.functional_1_batc_6);

            % Gemm:
            [A1018, B1019, C1020, alpha1021, beta1022, functional_1_dense_7NumDims] = test_model.coder.ops.prepareGemmArgs(functional_1_global_, this.functional_1_dense_5, this.functional_1_dense_1, this.Vars.Gemmalpha1017, this.Vars.Gemmbeta1018, 0, 0, this.NumDims.functional_1_dense_1);
            functional_1_dense_7 = alpha1021*B1019*A1018 + beta1022*C1020;

            % LeakyRelu:
            functional_1_dense_6 = leakyrelu(dlarray(functional_1_dense_7), 0.200000);
            functional_1_dense_6NumDims = coder.const(functional_1_dense_7NumDims);

            % Gemm:
            [A1023, B1024, C1025, alpha1026, beta1027, functional_1_type__2NumDims] = test_model.coder.ops.prepareGemmArgs(functional_1_dense_6, this.functional_1_type__1, this.functional_1_type_1_, this.Vars.Gemmalpha1019, this.Vars.Gemmbeta1020, 0, 0, this.NumDims.functional_1_type_1_);
            functional_1_type__2 = alpha1026*B1024*A1023 + beta1027*C1025;

            % Softmax:
            [type, typeNumDims] = test_model.coder.ops.onnxSoftmax13(functional_1_type__2, -1, coder.const(functional_1_type__2NumDims));

            % Concat:
            [functional_1_concate, functional_1_concateNumDims] = test_model.coder.ops.onnxConcat(1, {functional_1_batc_3, functional_1_globa_2, functional_1_globa_1, functional_1_globa_3}, [coder.const(functional_1_batc_3NumDims), coder.const(functional_1_globa_2NumDims), coder.const(functional_1_globa_1NumDims), coder.const(functional_1_globa_3NumDims)]);

            % Gemm:
            [A1028, B1029, C1030, alpha1031, beta1032, functional_1_dens_8NumDims] = test_model.coder.ops.prepareGemmArgs(functional_1_concate, this.functional_1_dens_6, this.functional_1_dense_3, this.Vars.Gemmalpha1021, this.Vars.Gemmbeta1022, 0, 0, this.NumDims.functional_1_dense_3);
            functional_1_dens_8 = alpha1031*B1029*A1028 + beta1032*C1030;

            % LeakyRelu:
            functional_1_dens_7 = leakyrelu(dlarray(functional_1_dens_8), 0.200000);
            functional_1_dens_7NumDims = coder.const(functional_1_dens_8NumDims);

            % Mul:
            functional_1_batc_9 = functional_1_dens_7 .* this.Vars.functional_1_batc_8;
            functional_1_batc_9NumDims = max(coder.const(functional_1_dens_7NumDims), this.NumDims.functional_1_batc_8);

            % Add:
            functional_1_batc_7 = functional_1_batc_9 + this.Vars.functional_1_batc_10;
            functional_1_batc_7NumDims = max(coder.const(functional_1_batc_9NumDims), this.NumDims.functional_1_batc_10);

            % Gemm:
            [A1033, B1034, C1035, alpha1036, beta1037, functional_1_dens_13NumDims] = test_model.coder.ops.prepareGemmArgs(functional_1_batc_7, this.functional_1_dens_11, this.functional_1_dense_4, this.Vars.Gemmalpha1023, this.Vars.Gemmbeta1024, 0, 0, this.NumDims.functional_1_dense_4);
            functional_1_dens_13 = alpha1036*B1034*A1033 + beta1037*C1035;

            % LeakyRelu:
            functional_1_dens_12 = leakyrelu(dlarray(functional_1_dens_13), 0.200000);
            functional_1_dens_12NumDims = coder.const(functional_1_dens_13NumDims);

            % Gemm:
            [A1038, B1039, C1040, alpha1041, beta1042, functional_1_dista_2NumDims] = test_model.coder.ops.prepareGemmArgs(functional_1_dens_12, this.functional_1_dista_1, this.functional_1_distanc, this.Vars.Gemmalpha1025, this.Vars.Gemmbeta1026, 0, 0, this.NumDims.functional_1_distanc);
            functional_1_dista_2 = alpha1041*B1039*A1038 + beta1042*C1040;

            % Sigmoid:
            X1043 = dlarray(test_model.coder.ops.extractIfDlarray(functional_1_dista_2));
            Y1044 = sigmoid(X1043);
            distance = test_model.coder.ops.extractIfDlarray(Y1044);
            distanceNumDims = coder.const(functional_1_dista_2NumDims);

            % Set graph output arguments
            typeNumDims1027 = typeNumDims;
            distanceNumDims1028 = distanceNumDims;

        end

    end

end