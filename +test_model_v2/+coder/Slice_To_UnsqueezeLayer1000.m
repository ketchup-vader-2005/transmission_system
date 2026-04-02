classdef Slice_To_UnsqueezeLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = test_model_v2.coder.Slice_To_UnsqueezeLayer1000(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model_v2.Slice_To_UnsqueezeLayer1000(cgInstance.Name);
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
        function this = Slice_To_UnsqueezeLayer1000(mlInstance)
            this.Name = mlInstance.Name;
            this.NumInputs = 2;
            this.OutputNames = {'functional_1_conv_2'};
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

        function [functional_1_conv_2] = predict(this, feature_input__, feature_inputNumDims__)
            if isdlarray(feature_input__)
                feature_input_ = stripdims(feature_input__);
            else
                feature_input_ = feature_input__;
            end
            feature_inputNumDims = numel(feature_inputNumDims__);
            feature_input = test_model_v2.coder.ops.permuteInputVar(feature_input_, ['as-is'], 3);

            [functional_1_conv_2__, functional_1_conv_2NumDims__] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, false);
            functional_1_conv_2_ = test_model_v2.coder.ops.permuteOutputVar(functional_1_conv_2__, [2 3 4 1], 4);

            functional_1_conv_2 = dlarray(single(functional_1_conv_2_), 'SSCB');
        end

        function [functional_1_conv_2, functional_1_conv_2NumDims1001] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, Training)

            % Execute the operators:
            % Slice:
            [indices1000, functional_1_strid_3NumDims] = test_model_v2.coder.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__8, this.Vars.const_ends__9, this.Vars.const_axes__16, '', coder.const(feature_inputNumDims));
            functional_1_strid_3 = feature_input(indices1000{:});

            % Sub:
            functional_1_norm_1 = functional_1_strid_3 - this.Vars.functional_1_normali;
            functional_1_norm_1NumDims = max(coder.const(functional_1_strid_3NumDims), this.NumDims.functional_1_normali);

            % Slice:
            [indices1001, functional_1_strid_2NumDims] = test_model_v2.coder.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__11, this.Vars.const_ends__12, this.Vars.const_axes__16, '', coder.const(feature_inputNumDims));
            functional_1_strid_2 = feature_input(indices1001{:});

            % Sub:
            functional_1_norm_4 = functional_1_strid_2 - this.Vars.functional_1_norm_3;
            functional_1_norm_4NumDims = max(coder.const(functional_1_strid_2NumDims), this.NumDims.functional_1_norm_3);

            % Slice:
            [indices1002, functional_1_strid_1NumDims] = test_model_v2.coder.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__14, this.Vars.const_ends__15, this.Vars.const_axes__16, '', coder.const(feature_inputNumDims));
            functional_1_strid_1 = feature_input(indices1002{:});

            % Sub:
            functional_1_norm_7 = functional_1_strid_1 - this.Vars.functional_1_norm_6;
            functional_1_norm_7NumDims = max(coder.const(functional_1_strid_1NumDims), this.NumDims.functional_1_norm_6);

            % Slice:
            [indices1003, functional_1_stridedNumDims] = test_model_v2.coder.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__17, this.Vars.const_ends__18, this.Vars.const_axes__16, '', coder.const(feature_inputNumDims));
            functional_1_strided = feature_input(indices1003{:});

            % Sub:
            functional_1_norm_10 = functional_1_strided - this.Vars.functional_1_norm_9;
            functional_1_norm_10NumDims = max(coder.const(functional_1_stridedNumDims), this.NumDims.functional_1_norm_9);

            % Mul:
            functional_1_norm_11 = functional_1_norm_10 .* this.Vars.ConstantFolding_fu_3;
            functional_1_norm_11NumDims = max(coder.const(functional_1_norm_10NumDims), this.NumDims.ConstantFolding_fu_3);

            % Mul:
            functional_1_norm_8 = functional_1_norm_7 .* this.Vars.ConstantFolding_fu_2;
            functional_1_norm_8NumDims = max(coder.const(functional_1_norm_7NumDims), this.NumDims.ConstantFolding_fu_2);

            % Mul:
            functional_1_norm_5 = functional_1_norm_4 .* this.Vars.ConstantFolding_fu_1;
            functional_1_norm_5NumDims = max(coder.const(functional_1_norm_4NumDims), this.NumDims.ConstantFolding_fu_1);

            % Mul:
            functional_1_norm_2 = functional_1_norm_1 .* this.Vars.ConstantFolding_func;
            functional_1_norm_2NumDims = max(coder.const(functional_1_norm_1NumDims), this.NumDims.ConstantFolding_func);

            % Concat:
            [functional_1_concate, functional_1_concateNumDims] = test_model_v2.coder.ops.onnxConcat(2, {functional_1_norm_2, functional_1_norm_5, functional_1_norm_8, functional_1_norm_11}, [coder.const(functional_1_norm_2NumDims), coder.const(functional_1_norm_5NumDims), coder.const(functional_1_norm_8NumDims), coder.const(functional_1_norm_11NumDims)]);

            % Unsqueeze:
            [shape1004, functional_1_conv_2NumDims] = test_model_v2.coder.ops.prepareUnsqueezeArgs(functional_1_concate, this.Vars.const_fold_opt__117, coder.const(functional_1_concateNumDims));
            functional_1_conv_2 = reshape(functional_1_concate, shape1004);

            % Set graph output arguments
            functional_1_conv_2NumDims1001 = functional_1_conv_2NumDims;

        end

    end

end