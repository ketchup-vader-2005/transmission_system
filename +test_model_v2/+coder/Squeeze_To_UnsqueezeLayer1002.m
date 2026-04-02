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
            this_cg = test_model_v2.coder.Squeeze_To_UnsqueezeLayer1002(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model_v2.Squeeze_To_UnsqueezeLayer1002(cgInstance.Name);
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
                    this.Vars.(fieldname) = test_model_v2.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
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
            functional_1_conv_11 = test_model_v2.coder.ops.permuteInputVar(functional_1_conv_11_, [4 3 1 2], 4);

            [functional_1_max_p_2__, functional_1_globa_1__, functional_1_globa_3__, functional_1_max_p_2NumDims__, functional_1_globa_1NumDims__, functional_1_globa_3NumDims__] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, false);
            functional_1_max_p_2_ = test_model_v2.coder.ops.permuteOutputVar(functional_1_max_p_2__, [2 3 4 1], 4);
            functional_1_globa_1_ = test_model_v2.coder.ops.permuteOutputVar(functional_1_globa_1__, ['as-is'], 0);
            functional_1_globa_3_ = test_model_v2.coder.ops.permuteOutputVar(functional_1_globa_3__, ['as-is'], 0);

            functional_1_max_p_2 = dlarray(single(functional_1_max_p_2_), 'SSCB');
            functional_1_globa_1 = dlarray(single(functional_1_globa_1_), repmat('U', 1, max(2, coder.const(functional_1_globa_1NumDims__))));
            functional_1_globa_3 = dlarray(single(functional_1_globa_3_), repmat('U', 1, max(2, coder.const(functional_1_globa_3NumDims__))));
            functional_1_globa_1NumDims = dlarray(ones(1,functional_1_globa_1NumDims__,'like',functional_1_max_p_2), 'UU');
            functional_1_globa_3NumDims = dlarray(ones(1,functional_1_globa_3NumDims__,'like',functional_1_max_p_2), 'UU');
        end

        function [functional_1_max_p_2, functional_1_globa_1, functional_1_globa_3, functional_1_max_p_2NumDims1008, functional_1_globa_1NumDims1009, functional_1_globa_3NumDims1010] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_10, functional_1_conv_10NumDims] = test_model_v2.coder.ops.onnxSqueeze(functional_1_conv_11, this.Vars.axes_const__51__79, coder.const(functional_1_conv_11NumDims));

            % Add:
            functional_1_conv_7 = functional_1_conv_10 + this.Vars.const_fold_opt__108;
            functional_1_conv_7NumDims = max(coder.const(functional_1_conv_10NumDims), this.NumDims.const_fold_opt__108);

            % LeakyRelu:
            functional_1_conv_8 = leakyrelu(dlarray(functional_1_conv_7), 0.200000);
            functional_1_conv_8NumDims = coder.const(functional_1_conv_7NumDims);

            % Transpose:
            [perm1006, Transpose__77_0NumDims] = test_model_v2.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1005, coder.const(functional_1_conv_8NumDims));
            if isempty(perm1006)
                Transpose__77_0 = functional_1_conv_8;
            else
                Transpose__77_0 = permute(test_model_v2.coder.ops.extractIfDlarray(functional_1_conv_8), perm1006);
            end

            % Unsqueeze:
            [shape1007, functional_1_max_p_2NumDims] = test_model_v2.coder.ops.prepareUnsqueezeArgs(Transpose__77_0, this.Vars.const_fold_opt__105, coder.const(Transpose__77_0NumDims));
            functional_1_max_p_2 = reshape(Transpose__77_0, shape1007);

            % ReduceMax:
            dims1008 = test_model_v2.coder.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1006, coder.const(Transpose__77_0NumDims));
            xReduced1009 = max(Transpose__77_0, [], dims1008);
            [functional_1_globa_3, functional_1_globa_3NumDims] = test_model_v2.coder.ops.onnxSqueeze(xReduced1009, this.Vars.ReduceMaxAxes1006, coder.const(Transpose__77_0NumDims));

            % ReduceMean:
            dims1010 = test_model_v2.coder.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1007, coder.const(Transpose__77_0NumDims));
            xReduced1011 = mean(Transpose__77_0, dims1010);
            [functional_1_globa_1, functional_1_globa_1NumDims] = test_model_v2.coder.ops.onnxSqueeze(xReduced1011, this.Vars.ReduceMeanAxes1007, coder.const(Transpose__77_0NumDims));

            % Set graph output arguments
            functional_1_max_p_2NumDims1008 = functional_1_max_p_2NumDims;
            functional_1_globa_1NumDims1009 = functional_1_globa_1NumDims;
            functional_1_globa_3NumDims1010 = functional_1_globa_3NumDims;

        end

    end

end