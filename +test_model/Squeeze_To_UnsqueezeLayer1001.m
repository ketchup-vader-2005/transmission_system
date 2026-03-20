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
            this.OutputNames = {'functional_58_1_max_'};
        end

        function [functional_58_1_max_] = predict(this, functional_58_1_c_5)
            if isdlarray(functional_58_1_c_5)
                functional_58_1_c_5 = stripdims(functional_58_1_c_5);
            end
            functional_58_1_c_5NumDims = 4;
            functional_58_1_c_5 = test_model.ops.permuteInputVar(functional_58_1_c_5, [4 3 1 2], 4);

            [functional_58_1_max_, functional_58_1_max_NumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_58_1_c_5, functional_58_1_c_5NumDims, false);
            functional_58_1_max_ = test_model.ops.permuteOutputVar(functional_58_1_max_, [3 4 2 1], 4);

            functional_58_1_max_ = dlarray(single(functional_58_1_max_), 'SSCB');
        end

        function [functional_58_1_max_] = forward(this, functional_58_1_c_5)
            if isdlarray(functional_58_1_c_5)
                functional_58_1_c_5 = stripdims(functional_58_1_c_5);
            end
            functional_58_1_c_5NumDims = 4;
            functional_58_1_c_5 = test_model.ops.permuteInputVar(functional_58_1_c_5, [4 3 1 2], 4);

            [functional_58_1_max_, functional_58_1_max_NumDims] = Squeeze_To_UnsqueezeGraph1002(this, functional_58_1_c_5, functional_58_1_c_5NumDims, true);
            functional_58_1_max_ = test_model.ops.permuteOutputVar(functional_58_1_max_, [3 4 2 1], 4);

            functional_58_1_max_ = dlarray(single(functional_58_1_max_), 'SSCB');
        end

        function [functional_58_1_max_, functional_58_1_max_NumDims1003] = Squeeze_To_UnsqueezeGraph1002(this, functional_58_1_c_5, functional_58_1_c_5NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_58_1_c_4, functional_58_1_c_4NumDims] = test_model.ops.onnxSqueeze(functional_58_1_c_5, this.Vars.const_fold_opt__56__, functional_58_1_c_5NumDims);

            % Add:
            functional_58_1_conv = functional_58_1_c_4 + this.Vars.const_fold_opt__57;
            functional_58_1_convNumDims = max(functional_58_1_c_4NumDims, this.NumDims.const_fold_opt__57);

            % Relu:
            functional_58_1_c_1 = relu(dlarray(functional_58_1_conv));
            functional_58_1_c_1NumDims = functional_58_1_convNumDims;

            % Unsqueeze:
            [shape, functional_58_1_max_NumDims] = test_model.ops.prepareUnsqueezeArgs(functional_58_1_c_1, this.Vars.const_fold_opt__56__, functional_58_1_c_1NumDims);
            functional_58_1_max_ = reshape(functional_58_1_c_1, shape);

            % Set graph output arguments
            functional_58_1_max_NumDims1003 = functional_58_1_max_NumDims;

        end

    end

end