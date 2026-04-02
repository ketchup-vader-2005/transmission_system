classdef Squeeze_To_UnsqueezeLayer1005 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'test_model.coder.Squeeze_To_UnsqueezeLayer1005';
        end
    end


    methods
        function this = Squeeze_To_UnsqueezeLayer1005(name)
            this.Name = name;
            this.OutputNames = {'functional_5_1_co_29'};
        end

        function [functional_5_1_co_29] = predict(this, functional_5_1_co_26)
            if isdlarray(functional_5_1_co_26)
                functional_5_1_co_26 = stripdims(functional_5_1_co_26);
            end
            functional_5_1_co_26NumDims = 4;
            functional_5_1_co_26 = test_model.ops.permuteInputVar(functional_5_1_co_26, [4 3 1 2], 4);

            [functional_5_1_co_29, functional_5_1_co_29NumDims] = Squeeze_To_UnsqueezeGraph1010(this, functional_5_1_co_26, functional_5_1_co_26NumDims, false);
            functional_5_1_co_29 = test_model.ops.permuteOutputVar(functional_5_1_co_29, [3 4 2 1], 4);

            functional_5_1_co_29 = dlarray(single(functional_5_1_co_29), 'SSCB');
        end

        function [functional_5_1_co_29] = forward(this, functional_5_1_co_26)
            if isdlarray(functional_5_1_co_26)
                functional_5_1_co_26 = stripdims(functional_5_1_co_26);
            end
            functional_5_1_co_26NumDims = 4;
            functional_5_1_co_26 = test_model.ops.permuteInputVar(functional_5_1_co_26, [4 3 1 2], 4);

            [functional_5_1_co_29, functional_5_1_co_29NumDims] = Squeeze_To_UnsqueezeGraph1010(this, functional_5_1_co_26, functional_5_1_co_26NumDims, true);
            functional_5_1_co_29 = test_model.ops.permuteOutputVar(functional_5_1_co_29, [3 4 2 1], 4);

            functional_5_1_co_29 = dlarray(single(functional_5_1_co_29), 'SSCB');
        end

        function [functional_5_1_co_29, functional_5_1_co_29NumDims1011] = Squeeze_To_UnsqueezeGraph1010(this, functional_5_1_co_26, functional_5_1_co_26NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_5_1_co_25, functional_5_1_co_25NumDims] = test_model.ops.onnxSqueeze(functional_5_1_co_26, this.Vars.const_fold_opt__341_, functional_5_1_co_26NumDims);

            % Add:
            functional_5_1_co_22 = functional_5_1_co_25 + this.Vars.const_fold_opt__350;
            functional_5_1_co_22NumDims = max(functional_5_1_co_25NumDims, this.NumDims.const_fold_opt__350);

            % Relu:
            functional_5_1_co_23 = relu(dlarray(functional_5_1_co_22));
            functional_5_1_co_23NumDims = functional_5_1_co_22NumDims;

            % Unsqueeze:
            [shape, functional_5_1_co_29NumDims] = test_model.ops.prepareUnsqueezeArgs(functional_5_1_co_23, this.Vars.const_fold_opt__341_, functional_5_1_co_23NumDims);
            functional_5_1_co_29 = reshape(functional_5_1_co_23, shape);

            % Set graph output arguments
            functional_5_1_co_29NumDims1011 = functional_5_1_co_29NumDims;

        end

    end

end