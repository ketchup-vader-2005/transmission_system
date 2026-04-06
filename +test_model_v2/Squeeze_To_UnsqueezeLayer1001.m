classdef Squeeze_To_UnsqueezeLayer1001 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'test_model_v2.coder.Squeeze_To_UnsqueezeLayer1001';
        end
    end


    methods
        function this = Squeeze_To_UnsqueezeLayer1001(name)
            this.Name = name;
            this.OutputNames = {'functional_2_1_max_p'};
        end

        function [functional_2_1_max_p] = predict(this, functional_2_1_co_5)
            if isdlarray(functional_2_1_co_5)
                functional_2_1_co_5 = stripdims(functional_2_1_co_5);
            end
            functional_2_1_co_5NumDims = 4;
            functional_2_1_co_5 = test_model_v2.ops.permuteInputVar(functional_2_1_co_5, [4 3 1 2], 4);

            [functional_2_1_max_p, functional_2_1_max_pNumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_2_1_co_5, functional_2_1_co_5NumDims, false);
            functional_2_1_max_p = test_model_v2.ops.permuteOutputVar(functional_2_1_max_p, [3 4 2 1], 4);

            functional_2_1_max_p = dlarray(single(functional_2_1_max_p), 'SSCB');
        end

        function [functional_2_1_max_p] = forward(this, functional_2_1_co_5)
            if isdlarray(functional_2_1_co_5)
                functional_2_1_co_5 = stripdims(functional_2_1_co_5);
            end
            functional_2_1_co_5NumDims = 4;
            functional_2_1_co_5 = test_model_v2.ops.permuteInputVar(functional_2_1_co_5, [4 3 1 2], 4);

            [functional_2_1_max_p, functional_2_1_max_pNumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_2_1_co_5, functional_2_1_co_5NumDims, true);
            functional_2_1_max_p = test_model_v2.ops.permuteOutputVar(functional_2_1_max_p, [3 4 2 1], 4);

            functional_2_1_max_p = dlarray(single(functional_2_1_max_p), 'SSCB');
        end

        function [functional_2_1_max_p, functional_2_1_max_pNumDims1003] = Squeeze_To_UnsqueezeGraph1002(this, functional_2_1_co_5, functional_2_1_co_5NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_2_1_co_4, functional_2_1_co_4NumDims] = test_model_v2.ops.onnxSqueeze(functional_2_1_co_5, this.Vars.const_fold_opt__104_, functional_2_1_co_5NumDims);

            % Add:
            functional_2_1_conv1 = functional_2_1_co_4 + this.Vars.const_fold_opt__105;
            functional_2_1_conv1NumDims = max(functional_2_1_co_4NumDims, this.NumDims.const_fold_opt__105);

            % LeakyRelu:
            functional_2_1_co_1 = leakyrelu(functional_2_1_conv1, 0.200000);
            functional_2_1_co_1NumDims = functional_2_1_conv1NumDims;

            % Unsqueeze:
            [shape, functional_2_1_max_pNumDims] = test_model_v2.ops.prepareUnsqueezeArgs(functional_2_1_co_1, this.Vars.const_fold_opt__104_, functional_2_1_co_1NumDims);
            functional_2_1_max_p = reshape(functional_2_1_co_1, shape);

            % Set graph output arguments
            functional_2_1_max_pNumDims1003 = functional_2_1_max_pNumDims;

        end

    end

end