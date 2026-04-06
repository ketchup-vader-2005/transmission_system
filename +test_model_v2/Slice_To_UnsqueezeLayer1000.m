classdef Slice_To_UnsqueezeLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'test_model_v2.coder.Slice_To_UnsqueezeLayer1000';
        end
    end


    methods
        function this = Slice_To_UnsqueezeLayer1000(name)
            this.Name = name;
            this.NumInputs = 2;
            this.OutputNames = {'functional_2_1_co_2'};
        end

        function [functional_2_1_co_2] = predict(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model_v2.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_2_1_co_2, functional_2_1_co_2NumDims] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, false);
            functional_2_1_co_2 = test_model_v2.ops.permuteOutputVar(functional_2_1_co_2, [2 3 4 1], 4);

            functional_2_1_co_2 = dlarray(single(functional_2_1_co_2), 'SSCB');
        end

        function [functional_2_1_co_2] = forward(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model_v2.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_2_1_co_2, functional_2_1_co_2NumDims] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, true);
            functional_2_1_co_2 = test_model_v2.ops.permuteOutputVar(functional_2_1_co_2, [2 3 4 1], 4);

            functional_2_1_co_2 = dlarray(single(functional_2_1_co_2), 'SSCB');
        end

        function [functional_2_1_co_2, functional_2_1_co_2NumDims1001] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, Training)

            % Execute the operators:
            % Slice:
            [Indices, functional_2_1_str_3NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__8, this.Vars.const_ends__9, this.Vars.const_axes__13, '', feature_inputNumDims);
            functional_2_1_str_3 = feature_input(Indices{:});

            % Sub:
            functional_2_1_no_7 = functional_2_1_str_3 - this.Vars.functional_2_1_no_6;
            functional_2_1_no_7NumDims = max(functional_2_1_str_3NumDims, this.NumDims.functional_2_1_no_6);

            % Slice:
            [Indices, functional_2_1_str_2NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__11, this.Vars.const_ends__12, this.Vars.const_axes__13, '', feature_inputNumDims);
            functional_2_1_str_2 = feature_input(Indices{:});

            % Sub:
            functional_2_1_no_10 = functional_2_1_str_2 - this.Vars.functional_2_1_no_9;
            functional_2_1_no_10NumDims = max(functional_2_1_str_2NumDims, this.NumDims.functional_2_1_no_9);

            % Slice:
            [Indices, functional_2_1_str_1NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__14, this.Vars.const_ends__15, this.Vars.const_axes__13, '', feature_inputNumDims);
            functional_2_1_str_1 = feature_input(Indices{:});

            % Sub:
            functional_2_1_no_1 = functional_2_1_str_1 - this.Vars.functional_2_1_norma;
            functional_2_1_no_1NumDims = max(functional_2_1_str_1NumDims, this.NumDims.functional_2_1_norma);

            % Slice:
            [Indices, functional_2_1_stridNumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__17, this.Vars.const_ends__18, this.Vars.const_axes__13, '', feature_inputNumDims);
            functional_2_1_strid = feature_input(Indices{:});

            % Sub:
            functional_2_1_no_4 = functional_2_1_strid - this.Vars.functional_2_1_no_3;
            functional_2_1_no_4NumDims = max(functional_2_1_stridNumDims, this.NumDims.functional_2_1_no_3);

            % Mul:
            functional_2_1_no_11 = functional_2_1_no_10 .* this.Vars.ConstantFolding_fu_3;
            functional_2_1_no_11NumDims = max(functional_2_1_no_10NumDims, this.NumDims.ConstantFolding_fu_3);

            % Mul:
            functional_2_1_no_8 = functional_2_1_no_7 .* this.Vars.ConstantFolding_fu_2;
            functional_2_1_no_8NumDims = max(functional_2_1_no_7NumDims, this.NumDims.ConstantFolding_fu_2);

            % Mul:
            functional_2_1_no_5 = functional_2_1_no_4 .* this.Vars.ConstantFolding_fu_1;
            functional_2_1_no_5NumDims = max(functional_2_1_no_4NumDims, this.NumDims.ConstantFolding_fu_1);

            % Mul:
            functional_2_1_no_2 = functional_2_1_no_1 .* this.Vars.ConstantFolding_func;
            functional_2_1_no_2NumDims = max(functional_2_1_no_1NumDims, this.NumDims.ConstantFolding_func);

            % Concat:
            [functional_2_1_conca, functional_2_1_concaNumDims] = test_model_v2.ops.onnxConcat(2, {functional_2_1_no_8, functional_2_1_no_11, functional_2_1_no_2, functional_2_1_no_5}, [functional_2_1_no_8NumDims, functional_2_1_no_11NumDims, functional_2_1_no_2NumDims, functional_2_1_no_5NumDims]);

            % Unsqueeze:
            [shape, functional_2_1_co_2NumDims] = test_model_v2.ops.prepareUnsqueezeArgs(functional_2_1_conca, this.Vars.const_fold_opt__104, functional_2_1_concaNumDims);
            functional_2_1_co_2 = reshape(functional_2_1_conca, shape);

            % Set graph output arguments
            functional_2_1_co_2NumDims1001 = functional_2_1_co_2NumDims;

        end

    end

end