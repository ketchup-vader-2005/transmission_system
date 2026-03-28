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
            this.OutputNames = {'functional_3_1_co_2'};
        end

        function [functional_3_1_co_2] = predict(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_3_1_co_2, functional_3_1_co_2NumDims] = UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, false);
            functional_3_1_co_2 = test_model.ops.permuteOutputVar(functional_3_1_co_2, [2 3 4 1], 4);

            functional_3_1_co_2 = dlarray(single(functional_3_1_co_2), 'SSCB');
        end

        function [functional_3_1_co_2] = forward(this, feature_input, feature_inputNumDims)
            if isdlarray(feature_input)
                feature_input = stripdims(feature_input);
            end
            feature_inputNumDims = numel(feature_inputNumDims);
            feature_input = test_model.ops.permuteInputVar(feature_input, ['as-is'], 3);

            [functional_3_1_co_2, functional_3_1_co_2NumDims] = UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, true);
            functional_3_1_co_2 = test_model.ops.permuteOutputVar(functional_3_1_co_2, [2 3 4 1], 4);

            functional_3_1_co_2 = dlarray(single(functional_3_1_co_2), 'SSCB');
        end

        function [functional_3_1_co_2, functional_3_1_co_2NumDims1001] = UnsqueezeGraph1000(this, feature_input, feature_inputNumDims, Training)

            % Execute the operators:
            % Unsqueeze:
            [shape, functional_3_1_co_2NumDims] = test_model.ops.prepareUnsqueezeArgs(feature_input, this.Vars.const_fold_opt__2715, feature_inputNumDims);
            functional_3_1_co_2 = reshape(feature_input, shape);

            % Set graph output arguments
            functional_3_1_co_2NumDims1001 = functional_3_1_co_2NumDims;

        end

    end

end