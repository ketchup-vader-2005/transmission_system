classdef UnsqueezeLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = test_model.coder.UnsqueezeLayer1000(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.UnsqueezeLayer1000(cgInstance.Name);
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
        function this = UnsqueezeLayer1000(mlInstance)
            this.Name = mlInstance.Name;
            this.NumInputs = 2;
            this.OutputNames = {'functional_1_conv_2'};
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

        function [functional_1_conv_2] = predict(this, feature_input__, feature_inputNumDims__)
            if isdlarray(feature_input__)
                feature_input_ = stripdims(feature_input__);
            else
                feature_input_ = feature_input__;
            end
            feature_inputNumDims = numel(feature_inputNumDims__);
            feature_input = test_model.coder.ops.permuteInputVar(feature_input_, ['as-is'], 3);

            [functional_1_conv_2__, functional_1_conv_2NumDims__] = UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, false);
            functional_1_conv_2_ = test_model.coder.ops.permuteOutputVar(functional_1_conv_2__, [2 3 4 1], 4);

            functional_1_conv_2 = dlarray(single(functional_1_conv_2_), 'SSCB');
        end

        function [functional_1_conv_2, functional_1_conv_2NumDims1001] = UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, Training)

            % Execute the operators:
            % Unsqueeze:
            [shape1000, functional_1_conv_2NumDims] = test_model.coder.ops.prepareUnsqueezeArgs(feature_input, this.Vars.const_fold_opt__113, coder.const(feature_inputNumDims));
            functional_1_conv_2 = reshape(feature_input, shape1000);

            % Set graph output arguments
            functional_1_conv_2NumDims1001 = functional_1_conv_2NumDims;

        end

    end

end