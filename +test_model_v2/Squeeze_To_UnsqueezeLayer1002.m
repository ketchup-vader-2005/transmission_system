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
            this.OutputNames = {'functional_4_1_max_2', 'functional_4_1_globa', 'functional_4_1_glo_2', 'functional_4_1_globaNumDims', 'functional_4_1_glo_2NumDims'};
        end

        function [functional_4_1_max_2, functional_4_1_globa, functional_4_1_glo_2, functional_4_1_globaNumDims, functional_4_1_glo_2NumDims] = predict(this, functional_4_1_co_11)
            if isdlarray(functional_4_1_co_11)
                functional_4_1_co_11 = stripdims(functional_4_1_co_11);
            end
            functional_4_1_co_11NumDims = 4;
            functional_4_1_co_11 = test_model_v2.ops.permuteInputVar(functional_4_1_co_11, [4 3 1 2], 4);

            [functional_4_1_max_2, functional_4_1_globa, functional_4_1_glo_2, functional_4_1_max_2NumDims, functional_4_1_globaNumDims, functional_4_1_glo_2NumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_4_1_co_11, functional_4_1_co_11NumDims, false);
            functional_4_1_max_2 = test_model_v2.ops.permuteOutputVar(functional_4_1_max_2, [2 3 4 1], 4);
            functional_4_1_globa = test_model_v2.ops.permuteOutputVar(functional_4_1_globa, ['as-is'], 0);
            functional_4_1_glo_2 = test_model_v2.ops.permuteOutputVar(functional_4_1_glo_2, ['as-is'], 0);

            functional_4_1_max_2 = dlarray(single(functional_4_1_max_2), 'SSCB');
            functional_4_1_globa = dlarray(single(functional_4_1_globa), repmat('U', 1, max(2, functional_4_1_globaNumDims)));
            functional_4_1_glo_2 = dlarray(single(functional_4_1_glo_2), repmat('U', 1, max(2, functional_4_1_glo_2NumDims)));
            functional_4_1_globaNumDims = dlarray(ones(1,functional_4_1_globaNumDims,'like',functional_4_1_max_2), 'UU');
            functional_4_1_glo_2NumDims = dlarray(ones(1,functional_4_1_glo_2NumDims,'like',functional_4_1_max_2), 'UU');
        end

        function [functional_4_1_max_2, functional_4_1_globa, functional_4_1_glo_2, functional_4_1_globaNumDims, functional_4_1_glo_2NumDims] = forward(this, functional_4_1_co_11)
            if isdlarray(functional_4_1_co_11)
                functional_4_1_co_11 = stripdims(functional_4_1_co_11);
            end
            functional_4_1_co_11NumDims = 4;
            functional_4_1_co_11 = test_model_v2.ops.permuteInputVar(functional_4_1_co_11, [4 3 1 2], 4);

            [functional_4_1_max_2, functional_4_1_globa, functional_4_1_glo_2, functional_4_1_max_2NumDims, functional_4_1_globaNumDims, functional_4_1_glo_2NumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_4_1_co_11, functional_4_1_co_11NumDims, true);
            functional_4_1_max_2 = test_model_v2.ops.permuteOutputVar(functional_4_1_max_2, [2 3 4 1], 4);
            functional_4_1_globa = test_model_v2.ops.permuteOutputVar(functional_4_1_globa, ['as-is'], 0);
            functional_4_1_glo_2 = test_model_v2.ops.permuteOutputVar(functional_4_1_glo_2, ['as-is'], 0);

            functional_4_1_max_2 = dlarray(single(functional_4_1_max_2), 'SSCB');
            functional_4_1_globa = dlarray(single(functional_4_1_globa), repmat('U', 1, max(2, functional_4_1_globaNumDims)));
            functional_4_1_glo_2 = dlarray(single(functional_4_1_glo_2), repmat('U', 1, max(2, functional_4_1_glo_2NumDims)));
            functional_4_1_globaNumDims = dlarray(ones(1,functional_4_1_globaNumDims,'like',functional_4_1_max_2), 'UU');
            functional_4_1_glo_2NumDims = dlarray(ones(1,functional_4_1_glo_2NumDims,'like',functional_4_1_max_2), 'UU');
        end

        function [functional_4_1_max_2, functional_4_1_globa, functional_4_1_glo_2, functional_4_1_max_2NumDims1008, functional_4_1_globaNumDims1009, functional_4_1_glo_2NumDims1010] = Squeeze_To_UnsqueezeGraph1004(this, functional_4_1_co_11, functional_4_1_co_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_4_1_co_10, functional_4_1_co_10NumDims] = test_model_v2.ops.onnxSqueeze(functional_4_1_co_11, this.Vars.const_fold_opt__213_, functional_4_1_co_11NumDims);

            % Add:
            functional_4_1_co_7 = functional_4_1_co_10 + this.Vars.const_fold_opt__206;
            functional_4_1_co_7NumDims = max(functional_4_1_co_10NumDims, this.NumDims.const_fold_opt__206);

            % LeakyRelu:
            functional_4_1_co_8 = leakyrelu(functional_4_1_co_7, 0.200000);
            functional_4_1_co_8NumDims = functional_4_1_co_7NumDims;

            % Transpose:
            [perm, Transpose__188_0NumDims] = test_model_v2.ops.prepareTransposeArgs(this.Vars.TransposePerm1005, functional_4_1_co_8NumDims);
            if isempty(perm)
                Transpose__188_0 = functional_4_1_co_8;
            else
                Transpose__188_0 = permute(functional_4_1_co_8, perm);
            end

            % Unsqueeze:
            [shape, functional_4_1_max_2NumDims] = test_model_v2.ops.prepareUnsqueezeArgs(Transpose__188_0, this.Vars.const_fold_opt__218, Transpose__188_0NumDims);
            functional_4_1_max_2 = reshape(Transpose__188_0, shape);

            % ReduceMax:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1006, Transpose__188_0NumDims);
            xMax = max(Transpose__188_0, [], dims);
            [functional_4_1_glo_2, functional_4_1_glo_2NumDims] = test_model_v2.ops.onnxSqueeze(xMax, this.Vars.ReduceMaxAxes1006, Transpose__188_0NumDims);

            % ReduceMean:
            dims = test_model_v2.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1007, Transpose__188_0NumDims);
            xMean = mean(Transpose__188_0, dims);
            [functional_4_1_globa, functional_4_1_globaNumDims] = test_model_v2.ops.onnxSqueeze(xMean, this.Vars.ReduceMeanAxes1007, Transpose__188_0NumDims);

            % Set graph output arguments
            functional_4_1_max_2NumDims1008 = functional_4_1_max_2NumDims;
            functional_4_1_globaNumDims1009 = functional_4_1_globaNumDims;
            functional_4_1_glo_2NumDims1010 = functional_4_1_glo_2NumDims;

        end

    end

end