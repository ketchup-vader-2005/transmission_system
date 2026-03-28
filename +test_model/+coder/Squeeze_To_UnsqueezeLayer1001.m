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
            this.OutputNames = {'functional_3_1_ma_4'};
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

        function [functional_3_1_ma_4] = predict(this, functional_3_1_co_5__)
            if isdlarray(functional_3_1_co_5__)
                functional_3_1_co_5_ = stripdims(functional_3_1_co_5__);
            else
                functional_3_1_co_5_ = functional_3_1_co_5__;
            end
            functional_3_1_co_5NumDims = 4;
            functional_3_1_co_5 = test_model.coder.ops.permuteInputVar(functional_3_1_co_5_, [4 3 1 2], 4);

            [functional_3_1_ma_4__, functional_3_1_ma_4NumDims__] = Squeeze_To_UnsqueezeGraph1002(this, functional_3_1_co_5, functional_3_1_co_5NumDims, false);
            functional_3_1_ma_4_ = test_model.coder.ops.permuteOutputVar(functional_3_1_ma_4__, [3 4 2 1], 4);

            functional_3_1_ma_4 = dlarray(single(functional_3_1_ma_4_), 'SSCB');
        end

        function [functional_3_1_ma_4, functional_3_1_ma_4NumDims1003] = Squeeze_To_UnsqueezeGraph1002(this, functional_3_1_co_5, functional_3_1_co_5NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_4, functional_3_1_co_4NumDims] = test_model.coder.ops.onnxSqueeze(functional_3_1_co_5, this.Vars.const_fold_opt__2711, coder.const(functional_3_1_co_5NumDims));

            % Add:
            functional_3_1_conv1 = functional_3_1_co_4 + this.Vars.const_fold_opt__2697;
            functional_3_1_conv1NumDims = max(coder.const(functional_3_1_co_4NumDims), this.NumDims.const_fold_opt__2697);

            % Relu:
            X1001 = dlarray(test_model.coder.ops.extractIfDlarray(functional_3_1_conv1));
            Y1002 = relu(X1001);
            functional_3_1_co_1 = test_model.coder.ops.extractIfDlarray(Y1002);
            functional_3_1_co_1NumDims = coder.const(functional_3_1_conv1NumDims);

            % Unsqueeze:
            [shape1003, functional_3_1_ma_4NumDims] = test_model.coder.ops.prepareUnsqueezeArgs(functional_3_1_co_1, this.Vars.const_fold_opt__2711, coder.const(functional_3_1_co_1NumDims));
            functional_3_1_ma_4 = reshape(functional_3_1_co_1, shape1003);

            % Set graph output arguments
            functional_3_1_ma_4NumDims1003 = functional_3_1_ma_4NumDims;

        end

    end

end