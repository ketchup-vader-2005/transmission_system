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
            this_cg = test_model_v2.coder.Squeeze_To_UnsqueezeLayer1001(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model_v2.Squeeze_To_UnsqueezeLayer1001(cgInstance.Name);
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
            this.OutputNames = {'functional_4_1_max_p'};
            if isstruct(mlInstance.Vars)
                names = fieldnames(mlInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this.Vars.(fieldname) = test_model_v2.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
                end
            else
                this.Vars = [];
            end

            this.NumDims = mlInstance.NumDims;
        end

        function [functional_4_1_max_p] = predict(this, functional_4_1_co_5__)
            if isdlarray(functional_4_1_co_5__)
                functional_4_1_co_5_ = stripdims(functional_4_1_co_5__);
            else
                functional_4_1_co_5_ = functional_4_1_co_5__;
            end
            functional_4_1_co_5NumDims = 4;
            functional_4_1_co_5 = test_model_v2.coder.ops.permuteInputVar(functional_4_1_co_5_, [4 3 1 2], 4);

            [functional_4_1_max_p__, functional_4_1_max_pNumDims__] = Squeeze_To_UnsqueezeGraph1002(this, functional_4_1_co_5, functional_4_1_co_5NumDims, false);
            functional_4_1_max_p_ = test_model_v2.coder.ops.permuteOutputVar(functional_4_1_max_p__, [3 4 2 1], 4);

            functional_4_1_max_p = dlarray(single(functional_4_1_max_p_), 'SSCB');
        end

        function [functional_4_1_max_p, functional_4_1_max_pNumDims1003] = Squeeze_To_UnsqueezeGraph1002(this, functional_4_1_co_5, functional_4_1_co_5NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_4_1_co_4, functional_4_1_co_4NumDims] = test_model_v2.coder.ops.onnxSqueeze(functional_4_1_co_5, this.Vars.const_fold_opt__213_, coder.const(functional_4_1_co_5NumDims));

            % Add:
            functional_4_1_conv1 = functional_4_1_co_4 + this.Vars.const_fold_opt__210;
            functional_4_1_conv1NumDims = max(coder.const(functional_4_1_co_4NumDims), this.NumDims.const_fold_opt__210);

            % LeakyRelu:
            functional_4_1_co_1 = leakyrelu(dlarray(functional_4_1_conv1), 0.200000);
            functional_4_1_co_1NumDims = coder.const(functional_4_1_conv1NumDims);

            % Unsqueeze:
            [shape1005, functional_4_1_max_pNumDims] = test_model_v2.coder.ops.prepareUnsqueezeArgs(functional_4_1_co_1, this.Vars.const_fold_opt__213_, coder.const(functional_4_1_co_1NumDims));
            functional_4_1_max_p = reshape(functional_4_1_co_1, shape1005);

            % Set graph output arguments
            functional_4_1_max_pNumDims1003 = functional_4_1_max_pNumDims;

        end

    end

end