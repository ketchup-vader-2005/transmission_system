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
            this.OutputNames = {'functional_5_1_ma_4'};
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

        function [functional_5_1_ma_4] = predict(this, functional_5_1_co_21__)
            if isdlarray(functional_5_1_co_21__)
                functional_5_1_co_21_ = stripdims(functional_5_1_co_21__);
            else
                functional_5_1_co_21_ = functional_5_1_co_21__;
            end
            functional_5_1_co_21NumDims = 4;
            functional_5_1_co_21 = test_model.coder.ops.permuteInputVar(functional_5_1_co_21_, [4 3 1 2], 4);

            [functional_5_1_ma_4__, functional_5_1_ma_4NumDims__] = Squeeze_To_UnsqueezeGraph1008(this, functional_5_1_co_21, functional_5_1_co_21NumDims, false);
            functional_5_1_ma_4_ = test_model.coder.ops.permuteOutputVar(functional_5_1_ma_4__, [3 4 2 1], 4);

            functional_5_1_ma_4 = dlarray(single(functional_5_1_ma_4_), 'SSCB');
        end

        function [functional_5_1_ma_4, functional_5_1_ma_4NumDims1009] = Squeeze_To_UnsqueezeGraph1008(this, functional_5_1_co_21, functional_5_1_co_21NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_5_1_co_20, functional_5_1_co_20NumDims] = test_model.coder.ops.onnxSqueeze(functional_5_1_co_21, this.Vars.const_fold_opt__341_, coder.const(functional_5_1_co_21NumDims));

            % Add:
            functional_5_1_co_17 = functional_5_1_co_20 + this.Vars.const_fold_opt__349;
            functional_5_1_co_17NumDims = max(coder.const(functional_5_1_co_20NumDims), this.NumDims.const_fold_opt__349);

            % Relu:
            X1017 = dlarray(test_model.coder.ops.extractIfDlarray(functional_5_1_co_17));
            Y1018 = relu(X1017);
            functional_5_1_co_18 = test_model.coder.ops.extractIfDlarray(Y1018);
            functional_5_1_co_18NumDims = coder.const(functional_5_1_co_17NumDims);

            % Unsqueeze:
            [shape1019, functional_5_1_ma_4NumDims] = test_model.coder.ops.prepareUnsqueezeArgs(functional_5_1_co_18, this.Vars.const_fold_opt__341_, coder.const(functional_5_1_co_18NumDims));
            functional_5_1_ma_4 = reshape(functional_5_1_co_18, shape1019);

            % Set graph output arguments
            functional_5_1_ma_4NumDims1009 = functional_5_1_ma_4NumDims;

        end

    end

end