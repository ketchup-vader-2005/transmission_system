classdef Squeeze_To_UnsqueezeLayer1002 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

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
        % Specify the path to the class that will be used for codegen
        function name = matlabCodegenRedirect(~)
            name = 'test_model.coder.Squeeze_To_UnsqueezeLayer1002';
        end
    end


    methods
        function this = Squeeze_To_UnsqueezeLayer1002(name)
            this.Name = name;
            this.NumOutputs = 5;
            this.OutputNames = {'functional_1_max_p_2', 'functional_1_globa_1', 'functional_1_globa_3', 'functional_1_globa_1NumDims', 'functional_1_globa_3NumDims'};
        end

        function [functional_1_max_p_2, functional_1_globa_1, functional_1_globa_3, functional_1_globa_1NumDims, functional_1_globa_3NumDims] = predict(this, functional_1_conv_11)
            if isdlarray(functional_1_conv_11)
                functional_1_conv_11 = stripdims(functional_1_conv_11);
            end
            functional_1_conv_11NumDims = 4;
            functional_1_conv_11 = test_model.ops.permuteInputVar(functional_1_conv_11, [4 3 1 2], 4);

            [functional_1_max_p_2, functional_1_globa_1, functional_1_globa_3, functional_1_max_p_2NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, false);
            functional_1_max_p_2 = test_model.ops.permuteOutputVar(functional_1_max_p_2, [2 3 4 1], 4);
            functional_1_globa_1 = test_model.ops.permuteOutputVar(functional_1_globa_1, ['as-is'], 0);
            functional_1_globa_3 = test_model.ops.permuteOutputVar(functional_1_globa_3, ['as-is'], 0);

            functional_1_max_p_2 = dlarray(single(functional_1_max_p_2), 'SSCB');
            functional_1_globa_1 = dlarray(single(functional_1_globa_1), repmat('U', 1, max(2, functional_1_globa_1NumDims)));
            functional_1_globa_3 = dlarray(single(functional_1_globa_3), repmat('U', 1, max(2, functional_1_globa_3NumDims)));
            functional_1_globa_1NumDims = dlarray(ones(1,functional_1_globa_1NumDims,'like',functional_1_max_p_2), 'UU');
            functional_1_globa_3NumDims = dlarray(ones(1,functional_1_globa_3NumDims,'like',functional_1_max_p_2), 'UU');
        end

        function [functional_1_max_p_2, functional_1_globa_1, functional_1_globa_3, functional_1_globa_1NumDims, functional_1_globa_3NumDims] = forward(this, functional_1_conv_11)
            if isdlarray(functional_1_conv_11)
                functional_1_conv_11 = stripdims(functional_1_conv_11);
            end
            functional_1_conv_11NumDims = 4;
            functional_1_conv_11 = test_model.ops.permuteInputVar(functional_1_conv_11, [4 3 1 2], 4);

            [functional_1_max_p_2, functional_1_globa_1, functional_1_globa_3, functional_1_max_p_2NumDims, functional_1_globa_1NumDims, functional_1_globa_3NumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, true);
            functional_1_max_p_2 = test_model.ops.permuteOutputVar(functional_1_max_p_2, [2 3 4 1], 4);
            functional_1_globa_1 = test_model.ops.permuteOutputVar(functional_1_globa_1, ['as-is'], 0);
            functional_1_globa_3 = test_model.ops.permuteOutputVar(functional_1_globa_3, ['as-is'], 0);

            functional_1_max_p_2 = dlarray(single(functional_1_max_p_2), 'SSCB');
            functional_1_globa_1 = dlarray(single(functional_1_globa_1), repmat('U', 1, max(2, functional_1_globa_1NumDims)));
            functional_1_globa_3 = dlarray(single(functional_1_globa_3), repmat('U', 1, max(2, functional_1_globa_3NumDims)));
            functional_1_globa_1NumDims = dlarray(ones(1,functional_1_globa_1NumDims,'like',functional_1_max_p_2), 'UU');
            functional_1_globa_3NumDims = dlarray(ones(1,functional_1_globa_3NumDims,'like',functional_1_max_p_2), 'UU');
        end

        function [functional_1_max_p_2, functional_1_globa_1, functional_1_globa_3, functional_1_max_p_2NumDims1008, functional_1_globa_1NumDims1009, functional_1_globa_3NumDims1010] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_10, functional_1_conv_10NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_11, this.Vars.axes_const__2036__20, functional_1_conv_11NumDims);

            % Add:
            functional_1_conv_7 = functional_1_conv_10 + this.Vars.const_fold_opt__2102;
            functional_1_conv_7NumDims = max(functional_1_conv_10NumDims, this.NumDims.const_fold_opt__2102);

            % LeakyRelu:
            functional_1_conv_8 = leakyrelu(functional_1_conv_7, 0.200000);
            functional_1_conv_8NumDims = functional_1_conv_7NumDims;

            % Transpose:
            [perm, Transpose__2062_0NumDims] = test_model.ops.prepareTransposeArgs(this.Vars.TransposePerm1005, functional_1_conv_8NumDims);
            if isempty(perm)
                Transpose__2062_0 = functional_1_conv_8;
            else
                Transpose__2062_0 = permute(functional_1_conv_8, perm);
            end

            % Unsqueeze:
            [shape, functional_1_max_p_2NumDims] = test_model.ops.prepareUnsqueezeArgs(Transpose__2062_0, this.Vars.const_fold_opt__2103, Transpose__2062_0NumDims);
            functional_1_max_p_2 = reshape(Transpose__2062_0, shape);

            % ReduceMax:
            dims = test_model.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1006, Transpose__2062_0NumDims);
            xMax = max(Transpose__2062_0, [], dims);
            [functional_1_globa_3, functional_1_globa_3NumDims] = test_model.ops.onnxSqueeze(xMax, this.Vars.ReduceMaxAxes1006, Transpose__2062_0NumDims);

            % ReduceMean:
            dims = test_model.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1007, Transpose__2062_0NumDims);
            xMean = mean(Transpose__2062_0, dims);
            [functional_1_globa_1, functional_1_globa_1NumDims] = test_model.ops.onnxSqueeze(xMean, this.Vars.ReduceMeanAxes1007, Transpose__2062_0NumDims);

            % Set graph output arguments
            functional_1_max_p_2NumDims1008 = functional_1_max_p_2NumDims;
            functional_1_globa_1NumDims1009 = functional_1_globa_1NumDims;
            functional_1_globa_3NumDims1010 = functional_1_globa_3NumDims;

        end

    end

end