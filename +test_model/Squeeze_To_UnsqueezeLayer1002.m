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
            this.OutputNames = {'functional_3_1_max_p'};
        end

        function [functional_3_1_max_p] = predict(this, functional_3_1_co_11)
            if isdlarray(functional_3_1_co_11)
                functional_3_1_co_11 = stripdims(functional_3_1_co_11);
            end
            functional_3_1_co_11NumDims = 4;
            functional_3_1_co_11 = test_model.ops.permuteInputVar(functional_3_1_co_11, [4 3 1 2], 4);

            [functional_3_1_max_p, functional_3_1_max_pNumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_3_1_co_11, functional_3_1_co_11NumDims, false);
            functional_3_1_max_p = test_model.ops.permuteOutputVar(functional_3_1_max_p, [3 4 2 1], 4);

            functional_3_1_max_p = dlarray(single(functional_3_1_max_p), 'SSCB');
        end

        function [functional_3_1_max_p] = forward(this, functional_3_1_co_11)
            if isdlarray(functional_3_1_co_11)
                functional_3_1_co_11 = stripdims(functional_3_1_co_11);
            end
            functional_3_1_co_11NumDims = 4;
            functional_3_1_co_11 = test_model.ops.permuteInputVar(functional_3_1_co_11, [4 3 1 2], 4);

            [functional_3_1_max_p, functional_3_1_max_pNumDims] = Squeeze_To_UnsqueezeGraph1004(this, functional_3_1_co_11, functional_3_1_co_11NumDims, true);
            functional_3_1_max_p = test_model.ops.permuteOutputVar(functional_3_1_max_p, [3 4 2 1], 4);

            functional_3_1_max_p = dlarray(single(functional_3_1_max_p), 'SSCB');
        end

        function [functional_3_1_max_p, functional_3_1_max_pNumDims1005] = Squeeze_To_UnsqueezeGraph1004(this, functional_3_1_co_11, functional_3_1_co_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_10, functional_3_1_co_10NumDims] = test_model.ops.onnxSqueeze(functional_3_1_co_11, this.Vars.const_fold_opt__2711, functional_3_1_co_11NumDims);

            % Add:
            functional_3_1_co_7 = functional_3_1_co_10 + this.Vars.const_fold_opt__2714;
            functional_3_1_co_7NumDims = max(functional_3_1_co_10NumDims, this.NumDims.const_fold_opt__2714);

            % Relu:
            functional_3_1_co_8 = relu(dlarray(functional_3_1_co_7));
            functional_3_1_co_8NumDims = functional_3_1_co_7NumDims;

            % Unsqueeze:
            [shape, functional_3_1_max_pNumDims] = test_model.ops.prepareUnsqueezeArgs(functional_3_1_co_8, this.Vars.const_fold_opt__2711, functional_3_1_co_8NumDims);
            functional_3_1_max_p = reshape(functional_3_1_co_8, shape);

            % Set graph output arguments
            functional_3_1_max_pNumDims1005 = functional_3_1_max_pNumDims;

        end

    end

end