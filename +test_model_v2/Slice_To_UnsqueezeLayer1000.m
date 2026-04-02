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
            this.OutputNames = {'functional_1_conv_2'};
        end

        function [functional_1_conv_2] = predict(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model_v2.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_1_conv_2, functional_1_conv_2NumDims] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, false);
            functional_1_conv_2 = test_model_v2.ops.permuteOutputVar(functional_1_conv_2, [2 3 4 1], 4);

            functional_1_conv_2 = dlarray(single(functional_1_conv_2), 'SSCB');
        end

        function [functional_1_conv_2] = forward(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model_v2.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_1_conv_2, functional_1_conv_2NumDims] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, true);
            functional_1_conv_2 = test_model_v2.ops.permuteOutputVar(functional_1_conv_2, [2 3 4 1], 4);

            functional_1_conv_2 = dlarray(single(functional_1_conv_2), 'SSCB');
        end

        function [functional_1_conv_2, functional_1_conv_2NumDims1001] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, Training)

            % Execute the operators:
            % Slice:
            [Indices, functional_1_strid_3NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__8, this.Vars.const_ends__9, this.Vars.const_axes__16, '', feature_inputNumDims);
            functional_1_strid_3 = feature_input(Indices{:});

            % Sub:
            functional_1_norm_1 = functional_1_strid_3 - this.Vars.functional_1_normali;
            functional_1_norm_1NumDims = max(functional_1_strid_3NumDims, this.NumDims.functional_1_normali);

            % Slice:
            [Indices, functional_1_strid_2NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__11, this.Vars.const_ends__12, this.Vars.const_axes__16, '', feature_inputNumDims);
            functional_1_strid_2 = feature_input(Indices{:});

            % Sub:
            functional_1_norm_4 = functional_1_strid_2 - this.Vars.functional_1_norm_3;
            functional_1_norm_4NumDims = max(functional_1_strid_2NumDims, this.NumDims.functional_1_norm_3);

            % Slice:
            [Indices, functional_1_strid_1NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__14, this.Vars.const_ends__15, this.Vars.const_axes__16, '', feature_inputNumDims);
            functional_1_strid_1 = feature_input(Indices{:});

            % Sub:
            functional_1_norm_7 = functional_1_strid_1 - this.Vars.functional_1_norm_6;
            functional_1_norm_7NumDims = max(functional_1_strid_1NumDims, this.NumDims.functional_1_norm_6);

            % Slice:
            [Indices, functional_1_stridedNumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__17, this.Vars.const_ends__18, this.Vars.const_axes__16, '', feature_inputNumDims);
            functional_1_strided = feature_input(Indices{:});

            % Sub:
            functional_1_norm_10 = functional_1_strided - this.Vars.functional_1_norm_9;
            functional_1_norm_10NumDims = max(functional_1_stridedNumDims, this.NumDims.functional_1_norm_9);

            % Mul:
            functional_1_norm_11 = functional_1_norm_10 .* this.Vars.ConstantFolding_fu_3;
            functional_1_norm_11NumDims = max(functional_1_norm_10NumDims, this.NumDims.ConstantFolding_fu_3);

            % Mul:
            functional_1_norm_8 = functional_1_norm_7 .* this.Vars.ConstantFolding_fu_2;
            functional_1_norm_8NumDims = max(functional_1_norm_7NumDims, this.NumDims.ConstantFolding_fu_2);

            % Mul:
            functional_1_norm_5 = functional_1_norm_4 .* this.Vars.ConstantFolding_fu_1;
            functional_1_norm_5NumDims = max(functional_1_norm_4NumDims, this.NumDims.ConstantFolding_fu_1);

            % Mul:
            functional_1_norm_2 = functional_1_norm_1 .* this.Vars.ConstantFolding_func;
            functional_1_norm_2NumDims = max(functional_1_norm_1NumDims, this.NumDims.ConstantFolding_func);

            % Concat:
            [functional_1_concate, functional_1_concateNumDims] = test_model_v2.ops.onnxConcat(2, {functional_1_norm_2, functional_1_norm_5, functional_1_norm_8, functional_1_norm_11}, [functional_1_norm_2NumDims, functional_1_norm_5NumDims, functional_1_norm_8NumDims, functional_1_norm_11NumDims]);

            % Unsqueeze:
            [shape, functional_1_conv_2NumDims] = test_model_v2.ops.prepareUnsqueezeArgs(functional_1_concate, this.Vars.const_fold_opt__117, functional_1_concateNumDims);
            functional_1_conv_2 = reshape(functional_1_concate, shape);

            % Set graph output arguments
            functional_1_conv_2NumDims1001 = functional_1_conv_2NumDims;

        end

    end

end