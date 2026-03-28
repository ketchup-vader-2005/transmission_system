classdef Squeeze_To_UnsqueezeLayer1004 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'test_model.coder.Squeeze_To_UnsqueezeLayer1004';
        end
    end


    methods
        function this = Squeeze_To_UnsqueezeLayer1004(name)
            this.Name = name;
            this.OutputNames = {'functional_3_1_ma_2'};
        end

        function [functional_3_1_ma_2] = predict(this, functional_3_1_co_21)
            if isdlarray(functional_3_1_co_21)
                functional_3_1_co_21 = stripdims(functional_3_1_co_21);
            end
            functional_3_1_co_21NumDims = 4;
            functional_3_1_co_21 = test_model.ops.permuteInputVar(functional_3_1_co_21, [4 3 1 2], 4);

            [functional_3_1_ma_2, functional_3_1_ma_2NumDims] = Squeeze_To_UnsqueezeGraph1008(this, functional_3_1_co_21, functional_3_1_co_21NumDims, false);
            functional_3_1_ma_2 = test_model.ops.permuteOutputVar(functional_3_1_ma_2, [3 4 2 1], 4);

            functional_3_1_ma_2 = dlarray(single(functional_3_1_ma_2), 'SSCB');
        end

        function [functional_3_1_ma_2] = forward(this, functional_3_1_co_21)
            if isdlarray(functional_3_1_co_21)
                functional_3_1_co_21 = stripdims(functional_3_1_co_21);
            end
            functional_3_1_co_21NumDims = 4;
            functional_3_1_co_21 = test_model.ops.permuteInputVar(functional_3_1_co_21, [4 3 1 2], 4);

            [functional_3_1_ma_2, functional_3_1_ma_2NumDims] = Squeeze_To_UnsqueezeGraph1008(this, functional_3_1_co_21, functional_3_1_co_21NumDims, true);
            functional_3_1_ma_2 = test_model.ops.permuteOutputVar(functional_3_1_ma_2, [3 4 2 1], 4);

            functional_3_1_ma_2 = dlarray(single(functional_3_1_ma_2), 'SSCB');
        end

        function [functional_3_1_ma_2, functional_3_1_ma_2NumDims1009] = Squeeze_To_UnsqueezeGraph1008(this, functional_3_1_co_21, functional_3_1_co_21NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_20, functional_3_1_co_20NumDims] = test_model.ops.onnxSqueeze(functional_3_1_co_21, this.Vars.const_fold_opt__2711, functional_3_1_co_21NumDims);

            % Add:
            functional_3_1_co_17 = functional_3_1_co_20 + this.Vars.const_fold_opt__2703;
            functional_3_1_co_17NumDims = max(functional_3_1_co_20NumDims, this.NumDims.const_fold_opt__2703);

            % Relu:
            functional_3_1_co_18 = relu(dlarray(functional_3_1_co_17));
            functional_3_1_co_18NumDims = functional_3_1_co_17NumDims;

            % Unsqueeze:
            [shape, functional_3_1_ma_2NumDims] = test_model.ops.prepareUnsqueezeArgs(functional_3_1_co_18, this.Vars.const_fold_opt__2711, functional_3_1_co_18NumDims);
            functional_3_1_ma_2 = reshape(functional_3_1_co_18, shape);

            % Set graph output arguments
            functional_3_1_ma_2NumDims1009 = functional_3_1_ma_2NumDims;

        end

    end

end