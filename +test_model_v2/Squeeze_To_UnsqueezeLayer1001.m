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
            this.OutputNames = {'functional_4_1_max_p'};
        end

        function [functional_4_1_max_p] = predict(this, functional_4_1_co_5)
            if isdlarray(functional_4_1_co_5)
                functional_4_1_co_5 = stripdims(functional_4_1_co_5);
            end
            functional_4_1_co_5NumDims = 4;
            functional_4_1_co_5 = test_model_v2.ops.permuteInputVar(functional_4_1_co_5, [4 3 1 2], 4);

            [functional_4_1_max_p, functional_4_1_max_pNumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_4_1_co_5, functional_4_1_co_5NumDims, false);
            functional_4_1_max_p = test_model_v2.ops.permuteOutputVar(functional_4_1_max_p, [3 4 2 1], 4);

            functional_4_1_max_p = dlarray(single(functional_4_1_max_p), 'SSCB');
        end

        function [functional_4_1_max_p] = forward(this, functional_4_1_co_5)
            if isdlarray(functional_4_1_co_5)
                functional_4_1_co_5 = stripdims(functional_4_1_co_5);
            end
            functional_4_1_co_5NumDims = 4;
            functional_4_1_co_5 = test_model_v2.ops.permuteInputVar(functional_4_1_co_5, [4 3 1 2], 4);

            [functional_4_1_max_p, functional_4_1_max_pNumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_4_1_co_5, functional_4_1_co_5NumDims, true);
            functional_4_1_max_p = test_model_v2.ops.permuteOutputVar(functional_4_1_max_p, [3 4 2 1], 4);

            functional_4_1_max_p = dlarray(single(functional_4_1_max_p), 'SSCB');
        end

        function [functional_4_1_max_p, functional_4_1_max_pNumDims1003] = Squeeze_To_UnsqueezeGraph1002(this, functional_4_1_co_5, functional_4_1_co_5NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_4_1_co_4, functional_4_1_co_4NumDims] = test_model_v2.ops.onnxSqueeze(functional_4_1_co_5, this.Vars.const_fold_opt__213_, functional_4_1_co_5NumDims);

            % Add:
            functional_4_1_conv1 = functional_4_1_co_4 + this.Vars.const_fold_opt__210;
            functional_4_1_conv1NumDims = max(functional_4_1_co_4NumDims, this.NumDims.const_fold_opt__210);

            % LeakyRelu:
            functional_4_1_co_1 = leakyrelu(functional_4_1_conv1, 0.200000);
            functional_4_1_co_1NumDims = functional_4_1_conv1NumDims;

            % Unsqueeze:
            [shape, functional_4_1_max_pNumDims] = test_model_v2.ops.prepareUnsqueezeArgs(functional_4_1_co_1, this.Vars.const_fold_opt__213_, functional_4_1_co_1NumDims);
            functional_4_1_max_p = reshape(functional_4_1_co_1, shape);

            % Set graph output arguments
            functional_4_1_max_pNumDims1003 = functional_4_1_max_pNumDims;

        end

    end

end