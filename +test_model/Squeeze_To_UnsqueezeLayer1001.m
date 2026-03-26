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
            name = 'test_model.coder.Squeeze_To_UnsqueezeLayer1001';
        end
    end


    methods
        function this = Squeeze_To_UnsqueezeLayer1001(name)
            this.Name = name;
            this.OutputNames = {'functional_1_max_poo'};
        end

        function [functional_1_max_poo] = predict(this, functional_1_conv_5)
            if isdlarray(functional_1_conv_5)
                functional_1_conv_5 = stripdims(functional_1_conv_5);
            end
            functional_1_conv_5NumDims = 4;
            functional_1_conv_5 = test_model.ops.permuteInputVar(functional_1_conv_5, [4 3 1 2], 4);

            [functional_1_max_poo, functional_1_max_pooNumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_1_conv_5, functional_1_conv_5NumDims, false);
            functional_1_max_poo = test_model.ops.permuteOutputVar(functional_1_max_poo, [3 4 2 1], 4);

            functional_1_max_poo = dlarray(single(functional_1_max_poo), 'SSCB');
        end

        function [functional_1_max_poo] = forward(this, functional_1_conv_5)
            if isdlarray(functional_1_conv_5)
                functional_1_conv_5 = stripdims(functional_1_conv_5);
            end
            functional_1_conv_5NumDims = 4;
            functional_1_conv_5 = test_model.ops.permuteInputVar(functional_1_conv_5, [4 3 1 2], 4);

            [functional_1_max_poo, functional_1_max_pooNumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_1_conv_5, functional_1_conv_5NumDims, true);
            functional_1_max_poo = test_model.ops.permuteOutputVar(functional_1_max_poo, [3 4 2 1], 4);

            functional_1_max_poo = dlarray(single(functional_1_max_poo), 'SSCB');
        end

        function [functional_1_max_poo, functional_1_max_pooNumDims1003] = Squeeze_To_UnsqueezeGraph1002(this, functional_1_conv_5, functional_1_conv_5NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_4, functional_1_conv_4NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_5, this.Vars.const_fold_opt__122_, functional_1_conv_5NumDims);

            % Add:
            functional_1_conv1d_ = functional_1_conv_4 + this.Vars.const_fold_opt__126;
            functional_1_conv1d_NumDims = max(functional_1_conv_4NumDims, this.NumDims.const_fold_opt__126);

            % Relu:
            functional_1_conv_1 = relu(dlarray(functional_1_conv1d_));
            functional_1_conv_1NumDims = functional_1_conv1d_NumDims;

            % Unsqueeze:
            [shape, functional_1_max_pooNumDims] = test_model.ops.prepareUnsqueezeArgs(functional_1_conv_1, this.Vars.const_fold_opt__122_, functional_1_conv_1NumDims);
            functional_1_max_poo = reshape(functional_1_conv_1, shape);

            % Set graph output arguments
            functional_1_max_pooNumDims1003 = functional_1_max_pooNumDims;

        end

    end

end