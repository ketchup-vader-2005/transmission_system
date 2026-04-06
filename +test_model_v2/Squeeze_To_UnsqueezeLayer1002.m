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
            name = 'test_model_v2.coder.Squeeze_To_UnsqueezeLayer1002';
        end
    end


    methods
        function this = Squeeze_To_UnsqueezeLayer1002(name)
            this.Name = name;
            this.NumOutputs = 5;
            this.OutputNames = {'functional_2_1_max_2', 'functional_2_1_globa', 'functional_2_1_glo_2', 'functional_2_1_globaNumDims', 'functional_2_1_glo_2NumDims'};
        end

        function [functional_2_1_max_2, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims] = predict(this, functional_2_1_co_11)
            if isdlarray(functional_2_1_co_11)
                functional_2_1_co_11 = stripdims(functional_2_1_co_11);
            end
            functional_2_1_co_11NumDims = 4;
            functional_2_1_co_11 = test_model_v2.ops.permuteInputVar(functional_2_1_co_11, [4 3 1 2], 4);

            [functional_2_1_max_2, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_max_2NumDims, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_2_1_co_11, functional_2_1_co_11NumDims, false);
            functional_2_1_max_2 = test_model_v2.ops.permuteOutputVar(functional_2_1_max_2, [2 3 4 1], 4);
            functional_2_1_globa = test_model_v2.ops.permuteOutputVar(functional_2_1_globa, ['as-is'], 0);
            functional_2_1_glo_2 = test_model_v2.ops.permuteOutputVar(functional_2_1_glo_2, ['as-is'], 0);

            functional_2_1_max_2 = dlarray(single(functional_2_1_max_2), 'SSCB');
            functional_2_1_globa = dlarray(single(functional_2_1_globa), repmat('U', 1, max(2, functional_2_1_globaNumDims)));
            functional_2_1_glo_2 = dlarray(single(functional_2_1_glo_2), repmat('U', 1, max(2, functional_2_1_glo_2NumDims)));
            functional_2_1_globaNumDims = dlarray(ones(1,functional_2_1_globaNumDims,'like',functional_2_1_max_2), 'UU');
            functional_2_1_glo_2NumDims = dlarray(ones(1,functional_2_1_glo_2NumDims,'like',functional_2_1_max_2), 'UU');
        end

        function [functional_2_1_max_2, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims] = forward(this, functional_2_1_co_11)
            if isdlarray(functional_2_1_co_11)
                functional_2_1_co_11 = stripdims(functional_2_1_co_11);
            end
            functional_2_1_co_11NumDims = 4;
            functional_2_1_co_11 = test_model_v2.ops.permuteInputVar(functional_2_1_co_11, [4 3 1 2], 4);

            [functional_2_1_max_2, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_max_2NumDims, functional_2_1_globaNumDims, functional_2_1_glo_2NumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_2_1_co_11, functional_2_1_co_11NumDims, true);
            functional_2_1_max_2 = test_model_v2.ops.permuteOutputVar(functional_2_1_max_2, [2 3 4 1], 4);
            functional_2_1_globa = test_model_v2.ops.permuteOutputVar(functional_2_1_globa, ['as-is'], 0);
            functional_2_1_glo_2 = test_model_v2.ops.permuteOutputVar(functional_2_1_glo_2, ['as-is'], 0);

            functional_2_1_max_2 = dlarray(single(functional_2_1_max_2), 'SSCB');
            functional_2_1_globa = dlarray(single(functional_2_1_globa), repmat('U', 1, max(2, functional_2_1_globaNumDims)));
            functional_2_1_glo_2 = dlarray(single(functional_2_1_glo_2), repmat('U', 1, max(2, functional_2_1_glo_2NumDims)));
            functional_2_1_globaNumDims = dlarray(ones(1,functional_2_1_globaNumDims,'like',functional_2_1_max_2), 'UU');
            functional_2_1_glo_2NumDims = dlarray(ones(1,functional_2_1_glo_2NumDims,'like',functional_2_1_max_2), 'UU');
        end

        function [functional_2_1_max_2, functional_2_1_globa, functional_2_1_glo_2, functional_2_1_max_2NumDims1008, functional_2_1_globaNumDims1009, functional_2_1_glo_2NumDims1010] = Squeeze_To_UnsqueezeGraph1004(this, functional_2_1_co_11, functional_2_1_co_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_2_1_co_10, functional_2_1_co_10NumDims] = test_model_v2.ops.onnxSqueeze(functional_2_1_co_11, this.Vars.const_fold_opt__104_, functional_2_1_co_11NumDims);

            % Add:
            functional_2_1_co_7 = functional_2_1_co_10 + this.Vars.const_fold_opt__106;
            functional_2_1_co_7NumDims = max(functional_2_1_co_10NumDims, this.NumDims.const_fold_opt__106);

            % LeakyRelu:
            functional_2_1_co_8 = leakyrelu(functional_2_1_co_7, 0.200000);
            functional_2_1_co_8NumDims = functional_2_1_co_7NumDims;

            % Transpose:
            [perm, Transpose__77_0NumDims] = test_model_v2.ops.prepareTransposeArgs(this.Vars.TransposePerm1005, functional_2_1_co_8NumDims);
            if isempty(perm)
                Transpose__77_0 = functional_2_1_co_8;
            else
                Transpose__77_0 = permute(functional_2_1_co_8, perm);
            end

            % Unsqueeze:
            [shape, functional_2_1_max_2NumDims] = test_model_v2.ops.prepareUnsqueezeArgs(Transpose__77_0, this.Vars.const_fold_opt__94, Transpose__77_0NumDims);
            functional_2_1_max_2 = reshape(Transpose__77_0, shape);

            % ReduceMax:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1006, Transpose__77_0NumDims);
            xMax = max(Transpose__77_0, [], dims);
            [functional_2_1_glo_2, functional_2_1_glo_2NumDims] = test_model_v2.ops.onnxSqueeze(xMax, this.Vars.ReduceMaxAxes1006, Transpose__77_0NumDims);

            % ReduceMean:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1007, Transpose__77_0NumDims);
            xMean = mean(Transpose__77_0, dims);
            [functional_2_1_globa, functional_2_1_globaNumDims] = test_model_v2.ops.onnxSqueeze(xMean, this.Vars.ReduceMeanAxes1007, Transpose__77_0NumDims);

            % Set graph output arguments
            functional_2_1_max_2NumDims1008 = functional_2_1_max_2NumDims;
            functional_2_1_globaNumDims1009 = functional_2_1_globaNumDims;
            functional_2_1_glo_2NumDims1010 = functional_2_1_glo_2NumDims;

        end

    end

end