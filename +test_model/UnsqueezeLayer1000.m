classdef UnsqueezeLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'test_model.coder.UnsqueezeLayer1000';
        end
    end


    methods
        function this = UnsqueezeLayer1000(name)
            this.Name = name;
            this.NumInputs = 2;
            this.OutputNames = {'functional_1_conv_2'};
        end

        function [functional_1_conv_2] = predict(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_1_conv_2, functional_1_conv_2NumDims] = UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, false);
            functional_1_conv_2 = test_model.ops.permuteOutputVar(functional_1_conv_2, [2 3 4 1], 4);

            functional_1_conv_2 = dlarray(single(functional_1_conv_2), 'SSCB');
        end

        function [functional_1_conv_2] = forward(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_1_conv_2, functional_1_conv_2NumDims] = UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, true);
            functional_1_conv_2 = test_model.ops.permuteOutputVar(functional_1_conv_2, [2 3 4 1], 4);

            functional_1_conv_2 = dlarray(single(functional_1_conv_2), 'SSCB');
        end

        function [functional_1_conv_2, functional_1_conv_2NumDims1001] = UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, Training)

            % Execute the operators:
            % Unsqueeze:
            [shape, functional_1_conv_2NumDims] = test_model.ops.prepareUnsqueezeArgs(feature_input, this.Vars.const_fold_opt__2095, feature_inputNumDims);
            functional_1_conv_2 = reshape(feature_input, shape);

            % Set graph output arguments
            functional_1_conv_2NumDims1001 = functional_1_conv_2NumDims;

        end

    end

end