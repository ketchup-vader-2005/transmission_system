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
            this.OutputNames = {'functional_3_1_ma_4'};
        end

        function [functional_3_1_ma_4] = predict(this, functional_3_1_co_5)
            if isdlarray(functional_3_1_co_5)
                functional_3_1_co_5 = stripdims(functional_3_1_co_5);
            end
            functional_3_1_co_5NumDims = 4;
            functional_3_1_co_5 = test_model.ops.permuteInputVar(functional_3_1_co_5, [4 3 1 2], 4);

            [functional_3_1_ma_4, functional_3_1_ma_4NumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_3_1_co_5, functional_3_1_co_5NumDims, false);
            functional_3_1_ma_4 = test_model.ops.permuteOutputVar(functional_3_1_ma_4, [3 4 2 1], 4);

            functional_3_1_ma_4 = dlarray(single(functional_3_1_ma_4), 'SSCB');
        end

        function [functional_3_1_ma_4] = forward(this, functional_3_1_co_5)
            if isdlarray(functional_3_1_co_5)
                functional_3_1_co_5 = stripdims(functional_3_1_co_5);
            end
            functional_3_1_co_5NumDims = 4;
            functional_3_1_co_5 = test_model.ops.permuteInputVar(functional_3_1_co_5, [4 3 1 2], 4);

            [functional_3_1_ma_4, functional_3_1_ma_4NumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_3_1_co_5, functional_3_1_co_5NumDims, true);
            functional_3_1_ma_4 = test_model.ops.permuteOutputVar(functional_3_1_ma_4, [3 4 2 1], 4);

            functional_3_1_ma_4 = dlarray(single(functional_3_1_ma_4), 'SSCB');
        end

        function [functional_3_1_ma_4, functional_3_1_ma_4NumDims1003] = Squeeze_To_UnsqueezeGraph1002(this, functional_3_1_co_5, functional_3_1_co_5NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_4, functional_3_1_co_4NumDims] = test_model.ops.onnxSqueeze(functional_3_1_co_5, this.Vars.const_fold_opt__2711, functional_3_1_co_5NumDims);

            % Add:
            functional_3_1_conv1 = functional_3_1_co_4 + this.Vars.const_fold_opt__2697;
            functional_3_1_conv1NumDims = max(functional_3_1_co_4NumDims, this.NumDims.const_fold_opt__2697);

            % Relu:
            functional_3_1_co_1 = relu(dlarray(functional_3_1_conv1));
            functional_3_1_co_1NumDims = functional_3_1_conv1NumDims;

            % Unsqueeze:
            [shape, functional_3_1_ma_4NumDims] = test_model.ops.prepareUnsqueezeArgs(functional_3_1_co_1, this.Vars.const_fold_opt__2711, functional_3_1_co_1NumDims);
            functional_3_1_ma_4 = reshape(functional_3_1_co_1, shape);

            % Set graph output arguments
            functional_3_1_ma_4NumDims1003 = functional_3_1_ma_4NumDims;

        end

    end

end