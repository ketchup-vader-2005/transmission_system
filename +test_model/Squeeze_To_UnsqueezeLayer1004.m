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
            this.OutputNames = {'functional_5_1_ma_4'};
        end

        function [functional_5_1_ma_4] = predict(this, functional_5_1_co_21)
            if isdlarray(functional_5_1_co_21)
                functional_5_1_co_21 = stripdims(functional_5_1_co_21);
            end
            functional_5_1_co_21NumDims = 4;
            functional_5_1_co_21 = test_model.ops.permuteInputVar(functional_5_1_co_21, [4 3 1 2], 4);

            [functional_5_1_ma_4, functional_5_1_ma_4NumDims] = Squeeze_To_UnsqueezeGraph1008(this, functional_5_1_co_21, functional_5_1_co_21NumDims, false);
            functional_5_1_ma_4 = test_model.ops.permuteOutputVar(functional_5_1_ma_4, [3 4 2 1], 4);

            functional_5_1_ma_4 = dlarray(single(functional_5_1_ma_4), 'SSCB');
        end

        function [functional_5_1_ma_4] = forward(this, functional_5_1_co_21)
            if isdlarray(functional_5_1_co_21)
                functional_5_1_co_21 = stripdims(functional_5_1_co_21);
            end
            functional_5_1_co_21NumDims = 4;
            functional_5_1_co_21 = test_model.ops.permuteInputVar(functional_5_1_co_21, [4 3 1 2], 4);

            [functional_5_1_ma_4, functional_5_1_ma_4NumDims] = Squeeze_To_UnsqueezeGraph1008(this, functional_5_1_co_21, functional_5_1_co_21NumDims, true);
            functional_5_1_ma_4 = test_model.ops.permuteOutputVar(functional_5_1_ma_4, [3 4 2 1], 4);

            functional_5_1_ma_4 = dlarray(single(functional_5_1_ma_4), 'SSCB');
        end

        function [functional_5_1_ma_4, functional_5_1_ma_4NumDims1009] = Squeeze_To_UnsqueezeGraph1008(this, functional_5_1_co_21, functional_5_1_co_21NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_5_1_co_20, functional_5_1_co_20NumDims] = test_model.ops.onnxSqueeze(functional_5_1_co_21, this.Vars.const_fold_opt__341_, functional_5_1_co_21NumDims);

            % Add:
            functional_5_1_co_17 = functional_5_1_co_20 + this.Vars.const_fold_opt__349;
            functional_5_1_co_17NumDims = max(functional_5_1_co_20NumDims, this.NumDims.const_fold_opt__349);

            % Relu:
            functional_5_1_co_18 = relu(dlarray(functional_5_1_co_17));
            functional_5_1_co_18NumDims = functional_5_1_co_17NumDims;

            % Unsqueeze:
            [shape, functional_5_1_ma_4NumDims] = test_model.ops.prepareUnsqueezeArgs(functional_5_1_co_18, this.Vars.const_fold_opt__341_, functional_5_1_co_18NumDims);
            functional_5_1_ma_4 = reshape(functional_5_1_co_18, shape);

            % Set graph output arguments
            functional_5_1_ma_4NumDims1009 = functional_5_1_ma_4NumDims;

        end

    end

end