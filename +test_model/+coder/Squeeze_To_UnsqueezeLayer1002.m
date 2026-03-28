classdef Squeeze_To_UnsqueezeLayer1002 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = test_model.coder.Squeeze_To_UnsqueezeLayer1002(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_UnsqueezeLayer1002(cgInstance.Name);
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
        function this = Squeeze_To_UnsqueezeLayer1002(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'functional_3_1_max_p'};
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

        function [functional_3_1_max_p] = predict(this, functional_3_1_co_11__)
            if isdlarray(functional_3_1_co_11__)
                functional_3_1_co_11_ = stripdims(functional_3_1_co_11__);
            else
                functional_3_1_co_11_ = functional_3_1_co_11__;
            end
            functional_3_1_co_11NumDims = 4;
            functional_3_1_co_11 = test_model.coder.ops.permuteInputVar(functional_3_1_co_11_, [4 3 1 2], 4);

            [functional_3_1_max_p__, functional_3_1_max_pNumDims__] = Squeeze_To_UnsqueezeGraph1004(this, functional_3_1_co_11, functional_3_1_co_11NumDims, false);
            functional_3_1_max_p_ = test_model.coder.ops.permuteOutputVar(functional_3_1_max_p__, [3 4 2 1], 4);

            functional_3_1_max_p = dlarray(single(functional_3_1_max_p_), 'SSCB');
        end

        function [functional_3_1_max_p, functional_3_1_max_pNumDims1005] = Squeeze_To_UnsqueezeGraph1004(this, functional_3_1_co_11, functional_3_1_co_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_10, functional_3_1_co_10NumDims] = test_model.coder.ops.onnxSqueeze(functional_3_1_co_11, this.Vars.const_fold_opt__2711, coder.const(functional_3_1_co_11NumDims));

            % Add:
            functional_3_1_co_7 = functional_3_1_co_10 + this.Vars.const_fold_opt__2714;
            functional_3_1_co_7NumDims = max(coder.const(functional_3_1_co_10NumDims), this.NumDims.const_fold_opt__2714);

            % Relu:
            X1004 = dlarray(test_model.coder.ops.extractIfDlarray(functional_3_1_co_7));
            Y1005 = relu(X1004);
            functional_3_1_co_8 = test_model.coder.ops.extractIfDlarray(Y1005);
            functional_3_1_co_8NumDims = coder.const(functional_3_1_co_7NumDims);

            % Unsqueeze:
            [shape1006, functional_3_1_max_pNumDims] = test_model.coder.ops.prepareUnsqueezeArgs(functional_3_1_co_8, this.Vars.const_fold_opt__2711, coder.const(functional_3_1_co_8NumDims));
            functional_3_1_max_p = reshape(functional_3_1_co_8, shape1006);

            % Set graph output arguments
            functional_3_1_max_pNumDims1005 = functional_3_1_max_pNumDims;

        end

    end

end