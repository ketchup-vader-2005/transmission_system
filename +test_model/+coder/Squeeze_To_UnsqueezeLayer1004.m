classdef Squeeze_To_UnsqueezeLayer1004 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = test_model.coder.Squeeze_To_UnsqueezeLayer1004(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_UnsqueezeLayer1004(cgInstance.Name);
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
        function this = Squeeze_To_UnsqueezeLayer1004(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'functional_3_1_ma_2'};
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

        function [functional_3_1_ma_2] = predict(this, functional_3_1_co_21__)
            if isdlarray(functional_3_1_co_21__)
                functional_3_1_co_21_ = stripdims(functional_3_1_co_21__);
            else
                functional_3_1_co_21_ = functional_3_1_co_21__;
            end
            functional_3_1_co_21NumDims = 4;
            functional_3_1_co_21 = test_model.coder.ops.permuteInputVar(functional_3_1_co_21_, [4 3 1 2], 4);

            [functional_3_1_ma_2__, functional_3_1_ma_2NumDims__] = Squeeze_To_UnsqueezeGraph1008(this, functional_3_1_co_21, functional_3_1_co_21NumDims, false);
            functional_3_1_ma_2_ = test_model.coder.ops.permuteOutputVar(functional_3_1_ma_2__, [3 4 2 1], 4);

            functional_3_1_ma_2 = dlarray(single(functional_3_1_ma_2_), 'SSCB');
        end

        function [functional_3_1_ma_2, functional_3_1_ma_2NumDims1009] = Squeeze_To_UnsqueezeGraph1008(this, functional_3_1_co_21, functional_3_1_co_21NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_20, functional_3_1_co_20NumDims] = test_model.coder.ops.onnxSqueeze(functional_3_1_co_21, this.Vars.const_fold_opt__2711, coder.const(functional_3_1_co_21NumDims));

            % Add:
            functional_3_1_co_17 = functional_3_1_co_20 + this.Vars.const_fold_opt__2703;
            functional_3_1_co_17NumDims = max(coder.const(functional_3_1_co_20NumDims), this.NumDims.const_fold_opt__2703);

            % Relu:
            X1017 = dlarray(test_model.coder.ops.extractIfDlarray(functional_3_1_co_17));
            Y1018 = relu(X1017);
            functional_3_1_co_18 = test_model.coder.ops.extractIfDlarray(Y1018);
            functional_3_1_co_18NumDims = coder.const(functional_3_1_co_17NumDims);

            % Unsqueeze:
            [shape1019, functional_3_1_ma_2NumDims] = test_model.coder.ops.prepareUnsqueezeArgs(functional_3_1_co_18, this.Vars.const_fold_opt__2711, coder.const(functional_3_1_co_18NumDims));
            functional_3_1_ma_2 = reshape(functional_3_1_co_18, shape1019);

            % Set graph output arguments
            functional_3_1_ma_2NumDims1009 = functional_3_1_ma_2NumDims;

        end

    end

end