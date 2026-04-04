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
            this.OutputNames = {'functional_4_1_co_2'};
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

        function [functional_4_1_co_2] = predict(this, feature_input__, feature_inputNumDims__)
            if isdlarray(feature_input__)
                feature_input_ = stripdims(feature_input__);
            else
                feature_input_ = feature_input__;
            end
            feature_inputNumDims = numel(feature_inputNumDims__);
            feature_input = test_model_v2.coder.ops.permuteInputVar(feature_input_, ['as-is'], 3);

            [functional_4_1_co_2__, functional_4_1_co_2NumDims__] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, false);
            functional_4_1_co_2_ = test_model_v2.coder.ops.permuteOutputVar(functional_4_1_co_2__, [2 3 4 1], 4);

            functional_4_1_co_2 = dlarray(single(functional_4_1_co_2_), 'SSCB');
        end

        function [functional_4_1_co_2, functional_4_1_co_2NumDims1001] = Slice_To_UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, Training)

            % Execute the operators:
            % Slice:
            [indices1000, functional_4_1_str_3NumDims] = test_model_v2.coder.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__119, this.Vars.const_ends__120, this.Vars.const_axes__127, '', coder.const(feature_inputNumDims));
            functional_4_1_str_3 = feature_input(indices1000{:});

            % Sub:
            functional_4_1_no_1 = functional_4_1_str_3 - this.Vars.functional_4_1_norma;
            functional_4_1_no_1NumDims = max(coder.const(functional_4_1_str_3NumDims), this.NumDims.functional_4_1_norma);

            % Slice:
            [indices1001, functional_4_1_str_2NumDims] = test_model_v2.coder.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__122, this.Vars.const_ends__123, this.Vars.const_axes__127, '', coder.const(feature_inputNumDims));
            functional_4_1_str_2 = feature_input(indices1001{:});

            % Sub:
            functional_4_1_no_4 = functional_4_1_str_2 - this.Vars.functional_4_1_no_3;
            functional_4_1_no_4NumDims = max(coder.const(functional_4_1_str_2NumDims), this.NumDims.functional_4_1_no_3);

            % Slice:
            [indices1002, functional_4_1_str_1NumDims] = test_model_v2.coder.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__125, this.Vars.const_ends__126, this.Vars.const_axes__127, '', coder.const(feature_inputNumDims));
            functional_4_1_str_1 = feature_input(indices1002{:});

            % Sub:
            functional_4_1_no_7 = functional_4_1_str_1 - this.Vars.functional_4_1_no_6;
            functional_4_1_no_7NumDims = max(coder.const(functional_4_1_str_1NumDims), this.NumDims.functional_4_1_no_6);

            % Slice:
            [indices1003, functional_4_1_stridNumDims] = test_model_v2.coder.ops.prepareSliceArgs(feature_input, this.Vars.const_starts__128, this.Vars.const_ends__129, this.Vars.const_axes__127, '', coder.const(feature_inputNumDims));
            functional_4_1_strid = feature_input(indices1003{:});

            % Sub:
            functional_4_1_no_10 = functional_4_1_strid - this.Vars.functional_4_1_no_9;
            functional_4_1_no_10NumDims = max(coder.const(functional_4_1_stridNumDims), this.NumDims.functional_4_1_no_9);

            % Mul:
            functional_4_1_no_11 = functional_4_1_no_10 .* this.Vars.ConstantFolding_fu_3;
            functional_4_1_no_11NumDims = max(coder.const(functional_4_1_no_10NumDims), this.NumDims.ConstantFolding_fu_3);

            % Mul:
            functional_4_1_no_8 = functional_4_1_no_7 .* this.Vars.ConstantFolding_fu_2;
            functional_4_1_no_8NumDims = max(coder.const(functional_4_1_no_7NumDims), this.NumDims.ConstantFolding_fu_2);

            % Mul:
            functional_4_1_no_5 = functional_4_1_no_4 .* this.Vars.ConstantFolding_fu_1;
            functional_4_1_no_5NumDims = max(coder.const(functional_4_1_no_4NumDims), this.NumDims.ConstantFolding_fu_1);

            % Mul:
            functional_4_1_no_2 = functional_4_1_no_1 .* this.Vars.ConstantFolding_func;
            functional_4_1_no_2NumDims = max(coder.const(functional_4_1_no_1NumDims), this.NumDims.ConstantFolding_func);

            % Concat:
            [functional_4_1_conca, functional_4_1_concaNumDims] = test_model_v2.coder.ops.onnxConcat(2, {functional_4_1_no_2, functional_4_1_no_5, functional_4_1_no_8, functional_4_1_no_11}, [coder.const(functional_4_1_no_2NumDims), coder.const(functional_4_1_no_5NumDims), coder.const(functional_4_1_no_8NumDims), coder.const(functional_4_1_no_11NumDims)]);

            % Unsqueeze:
            [shape1004, functional_4_1_co_2NumDims] = test_model_v2.coder.ops.prepareUnsqueezeArgs(functional_4_1_conca, this.Vars.const_fold_opt__213, coder.const(functional_4_1_concaNumDims));
            functional_4_1_co_2 = reshape(functional_4_1_conca, shape1004);

            % Set graph output arguments
            functional_4_1_co_2NumDims1001 = functional_4_1_co_2NumDims;

        end

    end

end