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
            this.OutputNames = {'functional_4_1_co_2'};
        end

        function [functional_4_1_co_2] = predict(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model_v2.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_4_1_co_2, functional_4_1_co_2NumDims] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, false);
            functional_4_1_co_2 = test_model_v2.ops.permuteOutputVar(functional_4_1_co_2, [2 3 4 1], 4);

            functional_4_1_co_2 = dlarray(single(functional_4_1_co_2), 'SSCB');
        end

        function [functional_4_1_co_2] = forward(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model_v2.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_4_1_co_2, functional_4_1_co_2NumDims] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, true);
            functional_4_1_co_2 = test_model_v2.ops.permuteOutputVar(functional_4_1_co_2, [2 3 4 1], 4);

            functional_4_1_co_2 = dlarray(single(functional_4_1_co_2), 'SSCB');
        end

        function [functional_4_1_co_2, functional_4_1_co_2NumDims1001] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, Training)

            % Execute the operators:
            % Slice:
            [Indices, functional_4_1_str_3NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__119, this.Vars.const_ends__120, this.Vars.const_axes__127, '', feature_inputNumDims);
            functional_4_1_str_3 = feature_input(Indices{:});

            % Sub:
            functional_4_1_no_1 = functional_4_1_str_3 - this.Vars.functional_4_1_norma;
            functional_4_1_no_1NumDims = max(functional_4_1_str_3NumDims, this.NumDims.functional_4_1_norma);

            % Slice:
            [Indices, functional_4_1_str_2NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__122, this.Vars.const_ends__123, this.Vars.const_axes__127, '', feature_inputNumDims);
            functional_4_1_str_2 = feature_input(Indices{:});

            % Sub:
            functional_4_1_no_4 = functional_4_1_str_2 - this.Vars.functional_4_1_no_3;
            functional_4_1_no_4NumDims = max(functional_4_1_str_2NumDims, this.NumDims.functional_4_1_no_3);

            % Slice:
            [Indices, functional_4_1_str_1NumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__125, this.Vars.const_ends__126, this.Vars.const_axes__127, '', feature_inputNumDims);
            functional_4_1_str_1 = feature_input(Indices{:});

            % Sub:
            functional_4_1_no_7 = functional_4_1_str_1 - this.Vars.functional_4_1_no_6;
            functional_4_1_no_7NumDims = max(functional_4_1_str_1NumDims, this.NumDims.functional_4_1_no_6);

            % Slice:
            [Indices, functional_4_1_stridNumDims] = test_model_v2.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__128, this.Vars.const_ends__129, this.Vars.const_axes__127, '', feature_inputNumDims);
            functional_4_1_strid = feature_input(Indices{:});

            % Sub:
            functional_4_1_no_10 = functional_4_1_strid - this.Vars.functional_4_1_no_9;
            functional_4_1_no_10NumDims = max(functional_4_1_stridNumDims, this.NumDims.functional_4_1_no_9);

            % Mul:
            functional_4_1_no_11 = functional_4_1_no_10 .* this.Vars.ConstantFolding_fu_3;
            functional_4_1_no_11NumDims = max(functional_4_1_no_10NumDims, this.NumDims.ConstantFolding_fu_3);

            % Mul:
            functional_4_1_no_8 = functional_4_1_no_7 .* this.Vars.ConstantFolding_fu_2;
            functional_4_1_no_8NumDims = max(functional_4_1_no_7NumDims, this.NumDims.ConstantFolding_fu_2);

            % Mul:
            functional_4_1_no_5 = functional_4_1_no_4 .* this.Vars.ConstantFolding_fu_1;
            functional_4_1_no_5NumDims = max(functional_4_1_no_4NumDims, this.NumDims.ConstantFolding_fu_1);

            % Mul:
            functional_4_1_no_2 = functional_4_1_no_1 .* this.Vars.ConstantFolding_func;
            functional_4_1_no_2NumDims = max(functional_4_1_no_1NumDims, this.NumDims.ConstantFolding_func);

            % Concat:
            [functional_4_1_conca, functional_4_1_concaNumDims] = test_model_v2.ops.onnxConcat(2, {functional_4_1_no_2, functional_4_1_no_5, functional_4_1_no_8, functional_4_1_no_11}, [functional_4_1_no_2NumDims, functional_4_1_no_5NumDims, functional_4_1_no_8NumDims, functional_4_1_no_11NumDims]);

            % Unsqueeze:
            [shape, functional_4_1_co_2NumDims] = test_model_v2.ops.prepareUnsqueezeArgs(functional_4_1_conca, this.Vars.const_fold_opt__213, functional_4_1_concaNumDims);
            functional_4_1_co_2 = reshape(functional_4_1_conca, shape);

            % Set graph output arguments
            functional_4_1_co_2NumDims1001 = functional_4_1_co_2NumDims;

        end

    end

end