classdef Squeeze_To_UnsqueezeLayer1005 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = test_model.coder.Squeeze_To_UnsqueezeLayer1005(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_UnsqueezeLayer1005(cgInstance.Name);
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
        function this = Squeeze_To_UnsqueezeLayer1005(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'functional_5_1_co_29'};
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

        function [functional_5_1_co_29] = predict(this, functional_5_1_co_26__)
            if isdlarray(functional_5_1_co_26__)
                functional_5_1_co_26_ = stripdims(functional_5_1_co_26__);
            else
                functional_5_1_co_26_ = functional_5_1_co_26__;
            end
            functional_5_1_co_26NumDims = 4;
            functional_5_1_co_26 = test_model.coder.ops.permuteInputVar(functional_5_1_co_26_, [4 3 1 2], 4);

            [functional_5_1_co_29__, functional_5_1_co_29NumDims__] = Squeeze_To_UnsqueezeGraph1010(this, functional_5_1_co_26, functional_5_1_co_26NumDims, false);
            functional_5_1_co_29_ = test_model.coder.ops.permuteOutputVar(functional_5_1_co_29__, [3 4 2 1], 4);

            functional_5_1_co_29 = dlarray(single(functional_5_1_co_29_), 'SSCB');
        end

        function [functional_5_1_co_29, functional_5_1_co_29NumDims1011] = Squeeze_To_UnsqueezeGraph1010(this, functional_5_1_co_26, functional_5_1_co_26NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_5_1_co_25, functional_5_1_co_25NumDims] = test_model.coder.ops.onnxSqueeze(functional_5_1_co_26, this.Vars.const_fold_opt__341_, coder.const(functional_5_1_co_26NumDims));

            % Add:
            functional_5_1_co_22 = functional_5_1_co_25 + this.Vars.const_fold_opt__350;
            functional_5_1_co_22NumDims = max(coder.const(functional_5_1_co_25NumDims), this.NumDims.const_fold_opt__350);

            % Relu:
            X1020 = dlarray(test_model.coder.ops.extractIfDlarray(functional_5_1_co_22));
            Y1021 = relu(X1020);
            functional_5_1_co_23 = test_model.coder.ops.extractIfDlarray(Y1021);
            functional_5_1_co_23NumDims = coder.const(functional_5_1_co_22NumDims);

            % Unsqueeze:
            [shape1022, functional_5_1_co_29NumDims] = test_model.coder.ops.prepareUnsqueezeArgs(functional_5_1_co_23, this.Vars.const_fold_opt__341_, coder.const(functional_5_1_co_23NumDims));
            functional_5_1_co_29 = reshape(functional_5_1_co_23, shape1022);

            % Set graph output arguments
            functional_5_1_co_29NumDims1011 = functional_5_1_co_29NumDims;

        end

    end

end