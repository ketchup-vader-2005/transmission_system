classdef Squeeze_To_UnsqueezeLayer1001 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

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
        % Specify the properties of the class that will not be modified
        % after the first assignment.
        function p = matlabCodegenNontunableProperties(~)
            p = {
                % Constants, i.e., Vars, NumDims and all learnables and states
                'Vars'
                'NumDims'
                };
        end
    end


    methods(Static, Hidden)
        % Instantiate a codegenable layer instance from a MATLAB layer instance
        function this_cg = matlabCodegenToRedirected(mlInstance)
            this_cg = test_model.coder.Squeeze_To_UnsqueezeLayer1001(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_UnsqueezeLayer1001(cgInstance.Name);
            if isstruct(cgInstance.Vars)
                names = fieldnames(cgInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this_ml.Vars.(fieldname) = dlarray(cgInstance.Vars.(fieldname));
                end
            else
                this_ml.Vars = [];
            end
            this_ml.NumDims = cgInstance.NumDims;
        end
    end

    methods
        function this = Squeeze_To_UnsqueezeLayer1001(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'functional_58_1_max_'};
            if isstruct(mlInstance.Vars)
                names = fieldnames(mlInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this.Vars.(fieldname) = test_model.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
                end
            else
                this.Vars = [];
            end

            this.NumDims = mlInstance.NumDims;
        end

        function [functional_58_1_max_] = predict(this, functional_58_1_c_5__)
            if isdlarray(functional_58_1_c_5__)
                functional_58_1_c_5_ = stripdims(functional_58_1_c_5__);
            else
                functional_58_1_c_5_ = functional_58_1_c_5__;
            end
            functional_58_1_c_5NumDims = 4;
            functional_58_1_c_5 = test_model.coder.ops.permuteInputVar(functional_58_1_c_5_, [4 3 1 2], 4);

            [functional_58_1_max___, functional_58_1_max_NumDims__] = Squeeze_To_UnsqueezeGraph1002(this, functional_58_1_c_5, functional_58_1_c_5NumDims, false);
            functional_58_1_max__ = test_model.coder.ops.permuteOutputVar(functional_58_1_max___, [3 4 2 1], 4);

            functional_58_1_max_ = dlarray(single(functional_58_1_max__), 'SSCB');
        end

        function [functional_58_1_max_, functional_58_1_max_NumDims1003] = Squeeze_To_UnsqueezeGraph1002(this, functional_58_1_c_5, functional_58_1_c_5NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_58_1_c_4, functional_58_1_c_4NumDims] = test_model.coder.ops.onnxSqueeze(functional_58_1_c_5, this.Vars.const_fold_opt__56__, coder.const(functional_58_1_c_5NumDims));

            % Add:
            functional_58_1_conv = functional_58_1_c_4 + this.Vars.const_fold_opt__57;
            functional_58_1_convNumDims = max(coder.const(functional_58_1_c_4NumDims), this.NumDims.const_fold_opt__57);

            % Relu:
            X1001 = dlarray(test_model.coder.ops.extractIfDlarray(functional_58_1_conv));
            Y1002 = relu(X1001);
            functional_58_1_c_1 = test_model.coder.ops.extractIfDlarray(Y1002);
            functional_58_1_c_1NumDims = coder.const(functional_58_1_convNumDims);

            % Unsqueeze:
            [shape1003, functional_58_1_max_NumDims] = test_model.coder.ops.prepareUnsqueezeArgs(functional_58_1_c_1, this.Vars.const_fold_opt__56__, coder.const(functional_58_1_c_1NumDims));
            functional_58_1_max_ = reshape(functional_58_1_c_1, shape1003);

            % Set graph output arguments
            functional_58_1_max_NumDims1003 = functional_58_1_max_NumDims;

        end

    end

end