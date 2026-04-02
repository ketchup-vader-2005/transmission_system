classdef Squeeze_To_UnsqueezeLayer1002 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
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
            this_cg = test_model.coder.Squeeze_To_UnsqueezeLayer1002(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_UnsqueezeLayer1002(cgInstance.Name);
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
        end
    end

    methods
        function this = Squeeze_To_UnsqueezeLayer1002(mlInstance)
            this.Name = mlInstance.Name;
            this.NumOutputs = 5;
            this.OutputNames = {'functional_1_max_p_2', 'functional_1_globa_1', 'functional_1_globa_3', 'functional_1_globa_1NumDims', 'functional_1_globa_3NumDims'};
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
        end

        function [functional_1_max_p_2, functional_1_globa_1, functional_1_globa_3, functional_1_globa_1NumDims, functional_1_globa_3NumDims] = predict(this, functional_1_conv_11__)
            if isdlarray(functional_1_conv_11__)
                functional_1_conv_11_ = stripdims(functional_1_conv_11__);
            else
                functional_1_conv_11_ = functional_1_conv_11__;
            end
            functional_1_conv_11NumDims = 4;
            functional_1_conv_11 = test_model.coder.ops.permuteInputVar(functional_1_conv_11_, [4 3 1 2], 4);

            [functional_1_max_p_2__, functional_1_globa_1__, functional_1_globa_3__, functional_1_max_p_2NumDims__, functional_1_globa_1NumDims__, functional_1_globa_3NumDims__] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, false);
            functional_1_max_p_2_ = test_model.coder.ops.permuteOutputVar(functional_1_max_p_2__, [2 3 4 1], 4);
            functional_1_globa_1_ = test_model.coder.ops.permuteOutputVar(functional_1_globa_1__, ['as-is'], 0);
            functional_1_globa_3_ = test_model.coder.ops.permuteOutputVar(functional_1_globa_3__, ['as-is'], 0);

            functional_1_max_p_2 = dlarray(single(functional_1_max_p_2_), 'SSCB');
            functional_1_globa_1 = dlarray(single(functional_1_globa_1_), repmat('U', 1, max(2, coder.const(functional_1_globa_1NumDims__))));
            functional_1_globa_3 = dlarray(single(functional_1_globa_3_), repmat('U', 1, max(2, coder.const(functional_1_globa_3NumDims__))));
            functional_1_globa_1NumDims = dlarray(ones(1,functional_1_globa_1NumDims__,'like',functional_1_max_p_2), 'UU');
            functional_1_globa_3NumDims = dlarray(ones(1,functional_1_globa_3NumDims__,'like',functional_1_max_p_2), 'UU');
        end

        function [functional_1_max_p_2, functional_1_globa_1, functional_1_globa_3, functional_1_max_p_2NumDims1008, functional_1_globa_1NumDims1009, functional_1_globa_3NumDims1010] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_10, functional_1_conv_10NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_conv_11, this.Vars.axes_const__1939__19, coder.const(functional_1_conv_11NumDims));

            % Add:
            functional_1_conv_7 = functional_1_conv_10 + this.Vars.const_fold_opt__1987;
            functional_1_conv_7NumDims = max(coder.const(functional_1_conv_10NumDims), this.NumDims.const_fold_opt__1987);

            % LeakyRelu:
            functional_1_conv_8 = leakyrelu(dlarray(functional_1_conv_7), 0.200000);
            functional_1_conv_8NumDims = coder.const(functional_1_conv_7NumDims);

            % Transpose:
            [perm1002, Transpose__1960_0NumDims] = test_model.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1005, coder.const(functional_1_conv_8NumDims));
            if isempty(perm1002)
                Transpose__1960_0 = functional_1_conv_8;
            else
                Transpose__1960_0 = permute(test_model.coder.ops.extractIfDlarray(functional_1_conv_8), perm1002);
            end

            % Unsqueeze:
            [shape1003, functional_1_max_p_2NumDims] = test_model.coder.ops.prepareUnsqueezeArgs(Transpose__1960_0, this.Vars.const_fold_opt__1996, coder.const(Transpose__1960_0NumDims));
            functional_1_max_p_2 = reshape(Transpose__1960_0, shape1003);

            % ReduceMax:
            dims1004 = test_model.coder.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1006, coder.const(Transpose__1960_0NumDims));
            xReduced1005 = max(Transpose__1960_0, [], dims1004);
            [functional_1_globa_3, functional_1_globa_3NumDims] = test_model.coder.ops.onnxSqueeze(xReduced1005, this.Vars.ReduceMaxAxes1006, coder.const(Transpose__1960_0NumDims));

            % ReduceMean:
            dims1006 = test_model.coder.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1007, coder.const(Transpose__1960_0NumDims));
            xReduced1007 = mean(Transpose__1960_0, dims1006);
            [functional_1_globa_1, functional_1_globa_1NumDims] = test_model.coder.ops.onnxSqueeze(xReduced1007, this.Vars.ReduceMeanAxes1007, coder.const(Transpose__1960_0NumDims));

            % Set graph output arguments
            functional_1_max_p_2NumDims1008 = functional_1_max_p_2NumDims;
            functional_1_globa_1NumDims1009 = functional_1_globa_1NumDims;
            functional_1_globa_3NumDims1010 = functional_1_globa_3NumDims;

        end

    end

end