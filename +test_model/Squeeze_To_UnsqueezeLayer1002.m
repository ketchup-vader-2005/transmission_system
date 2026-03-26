classdef Squeeze_To_UnsqueezeLayer1002 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'test_model.coder.Squeeze_To_UnsqueezeLayer1002';
        end
    end


    methods
        function this = Squeeze_To_UnsqueezeLayer1002(name)
            this.Name = name;
            this.OutputNames = {'functional_1_max__2'};
        end

        function [functional_1_max__2] = predict(this, functional_1_conv_11)
            if isdlarray(functional_1_conv_11)
                functional_1_conv_11 = stripdims(functional_1_conv_11);
            end
            functional_1_conv_11NumDims = 4;
            functional_1_conv_11 = test_model.ops.permuteInputVar(functional_1_conv_11, [4 3 1 2], 4);

            [functional_1_max__2, functional_1_max__2NumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, false);
            functional_1_max__2 = test_model.ops.permuteOutputVar(functional_1_max__2, [3 4 2 1], 4);

            functional_1_max__2 = dlarray(single(functional_1_max__2), 'SSCB');
        end

        function [functional_1_max__2] = forward(this, functional_1_conv_11)
            if isdlarray(functional_1_conv_11)
                functional_1_conv_11 = stripdims(functional_1_conv_11);
            end
            functional_1_conv_11NumDims = 4;
            functional_1_conv_11 = test_model.ops.permuteInputVar(functional_1_conv_11, [4 3 1 2], 4);

            [functional_1_max__2, functional_1_max__2NumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, true);
            functional_1_max__2 = test_model.ops.permuteOutputVar(functional_1_max__2, [3 4 2 1], 4);

            functional_1_max__2 = dlarray(single(functional_1_max__2), 'SSCB');
        end

        function [functional_1_max__2, functional_1_max__2NumDims1005] = Squeeze_To_UnsqueezeGraph1004(this, functional_1_conv_11, functional_1_conv_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_10, functional_1_conv_10NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_11, this.Vars.const_fold_opt__122_, functional_1_conv_11NumDims);

            % Add:
            functional_1_conv_7 = functional_1_conv_10 + this.Vars.const_fold_opt__125;
            functional_1_conv_7NumDims = max(functional_1_conv_10NumDims, this.NumDims.const_fold_opt__125);

            % Relu:
            functional_1_conv_8 = relu(dlarray(functional_1_conv_7));
            functional_1_conv_8NumDims = functional_1_conv_7NumDims;

            % Unsqueeze:
            [shape, functional_1_max__2NumDims] = test_model.ops.prepareUnsqueezeArgs(functional_1_conv_8, this.Vars.const_fold_opt__122_, functional_1_conv_8NumDims);
            functional_1_max__2 = reshape(functional_1_conv_8, shape);

            % Set graph output arguments
            functional_1_max__2NumDims1005 = functional_1_max__2NumDims;

        end

    end

end