classdef Squeeze_To_UnsqueezeLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'test_model.coder.Squeeze_To_UnsqueezeLayer1003';
        end
    end


    methods
        function this = Squeeze_To_UnsqueezeLayer1003(name)
            this.Name = name;
            this.OutputNames = {'functional_1_conv_19'};
        end

        function [functional_1_conv_19] = predict(this, functional_1_conv_16)
            if isdlarray(functional_1_conv_16)
                functional_1_conv_16 = stripdims(functional_1_conv_16);
            end
            functional_1_conv_16NumDims = 4;
            functional_1_conv_16 = test_model.ops.permuteInputVar(functional_1_conv_16, [4 3 1 2], 4);

            [functional_1_conv_19, functional_1_conv_19NumDims] = Squeeze_To_UnsqueezeGraph1006(this, functional_1_conv_16, functional_1_conv_16NumDims, false);
            functional_1_conv_19 = test_model.ops.permuteOutputVar(functional_1_conv_19, [3 4 2 1], 4);

            functional_1_conv_19 = dlarray(single(functional_1_conv_19), 'SSCB');
        end

        function [functional_1_conv_19] = forward(this, functional_1_conv_16)
            if isdlarray(functional_1_conv_16)
                functional_1_conv_16 = stripdims(functional_1_conv_16);
            end
            functional_1_conv_16NumDims = 4;
            functional_1_conv_16 = test_model.ops.permuteInputVar(functional_1_conv_16, [4 3 1 2], 4);

            [functional_1_conv_19, functional_1_conv_19NumDims] = Squeeze_To_UnsqueezeGraph1006(this, functional_1_conv_16, functional_1_conv_16NumDims, true);
            functional_1_conv_19 = test_model.ops.permuteOutputVar(functional_1_conv_19, [3 4 2 1], 4);

            functional_1_conv_19 = dlarray(single(functional_1_conv_19), 'SSCB');
        end

        function [functional_1_conv_19, functional_1_conv_19NumDims1007] = Squeeze_To_UnsqueezeGraph1006(this, functional_1_conv_16, functional_1_conv_16NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_15, functional_1_conv_15NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_16, this.Vars.const_fold_opt__24_1, functional_1_conv_16NumDims);

            % Add:
            functional_1_conv_12 = functional_1_conv_15 + this.Vars.const_fold_opt__2404;
            functional_1_conv_12NumDims = max(functional_1_conv_15NumDims, this.NumDims.const_fold_opt__2404);

            % Relu:
            functional_1_conv_13 = relu(dlarray(functional_1_conv_12));
            functional_1_conv_13NumDims = functional_1_conv_12NumDims;

            % Unsqueeze:
            [shape, functional_1_conv_19NumDims] = test_model.ops.prepareUnsqueezeArgs(functional_1_conv_13, this.Vars.const_fold_opt__24_1, functional_1_conv_13NumDims);
            functional_1_conv_19 = reshape(functional_1_conv_13, shape);

            % Set graph output arguments
            functional_1_conv_19NumDims1007 = functional_1_conv_19NumDims;

        end

    end

end