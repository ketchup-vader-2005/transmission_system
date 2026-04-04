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
            this_cg = test_model_v2.coder.Squeeze_To_UnsqueezeLayer1002(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model_v2.Squeeze_To_UnsqueezeLayer1002(cgInstance.Name);
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
            this.NumOutputs = 5;
            this.OutputNames = {'functional_4_1_max_2', 'functional_4_1_globa', 'functional_4_1_glo_2', 'functional_4_1_globaNumDims', 'functional_4_1_glo_2NumDims'};
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

        function [functional_4_1_max_2, functional_4_1_globa, functional_4_1_glo_2, functional_4_1_globaNumDims, functional_4_1_glo_2NumDims] = predict(this, functional_4_1_co_11__)
            if isdlarray(functional_4_1_co_11__)
                functional_4_1_co_11_ = stripdims(functional_4_1_co_11__);
            else
                functional_4_1_co_11_ = functional_4_1_co_11__;
            end
            functional_4_1_co_11NumDims = 4;
            functional_4_1_co_11 = test_model_v2.coder.ops.permuteInputVar(functional_4_1_co_11_, [4 3 1 2], 4);

            [functional_4_1_max_2__, functional_4_1_globa__, functional_4_1_glo_2__, functional_4_1_max_2NumDims__, functional_4_1_globaNumDims__, functional_4_1_glo_2NumDims__] = Squeeze_To_UnsqueezeGraph1004(this, functional_4_1_co_11, functional_4_1_co_11NumDims, false);
            functional_4_1_max_2_ = test_model_v2.coder.ops.permuteOutputVar(functional_4_1_max_2__, [2 3 4 1], 4);
            functional_4_1_globa_ = test_model_v2.coder.ops.permuteOutputVar(functional_4_1_globa__, ['as-is'], 0);
            functional_4_1_glo_2_ = test_model_v2.coder.ops.permuteOutputVar(functional_4_1_glo_2__, ['as-is'], 0);

            functional_4_1_max_2 = dlarray(single(functional_4_1_max_2_), 'SSCB');
            functional_4_1_globa = dlarray(single(functional_4_1_globa_), repmat('U', 1, max(2, coder.const(functional_4_1_globaNumDims__))));
            functional_4_1_glo_2 = dlarray(single(functional_4_1_glo_2_), repmat('U', 1, max(2, coder.const(functional_4_1_glo_2NumDims__))));
            functional_4_1_globaNumDims = dlarray(ones(1,functional_4_1_globaNumDims__,'like',functional_4_1_max_2), 'UU');
            functional_4_1_glo_2NumDims = dlarray(ones(1,functional_4_1_glo_2NumDims__,'like',functional_4_1_max_2), 'UU');
        end

        function [functional_4_1_max_2, functional_4_1_globa, functional_4_1_glo_2, functional_4_1_max_2NumDims1008, functional_4_1_globaNumDims1009, functional_4_1_glo_2NumDims1010] = Squeeze_To_UnsqueezeGraph1004(this, functional_4_1_co_11, functional_4_1_co_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_4_1_co_10, functional_4_1_co_10NumDims] = test_model_v2.coder.ops.onnxSqueeze(functional_4_1_co_11, this.Vars.const_fold_opt__213_, coder.const(functional_4_1_co_11NumDims));

            % Add:
            functional_4_1_co_7 = functional_4_1_co_10 + this.Vars.const_fold_opt__206;
            functional_4_1_co_7NumDims = max(coder.const(functional_4_1_co_10NumDims), this.NumDims.const_fold_opt__206);

            % LeakyRelu:
            functional_4_1_co_8 = leakyrelu(dlarray(functional_4_1_co_7), 0.200000);
            functional_4_1_co_8NumDims = coder.const(functional_4_1_co_7NumDims);

            % Transpose:
            [perm1006, Transpose__188_0NumDims] = test_model_v2.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1005, coder.const(functional_4_1_co_8NumDims));
            if isempty(perm1006)
                Transpose__188_0 = functional_4_1_co_8;
            else
                Transpose__188_0 = permute(test_model_v2.coder.ops.extractIfDlarray(functional_4_1_co_8), perm1006);
            end

            % Unsqueeze:
            [shape1007, functional_4_1_max_2NumDims] = test_model_v2.coder.ops.prepareUnsqueezeArgs(Transpose__188_0, this.Vars.const_fold_opt__218, coder.const(Transpose__188_0NumDims));
            functional_4_1_max_2 = reshape(Transpose__188_0, shape1007);

            % ReduceMax:
            dims1008 = test_model_v2.coder.ops.prepareReduceArgs(this.Vars.ReduceMaxAxes1006, coder.const(Transpose__188_0NumDims));
            xReduced1009 = max(Transpose__188_0, [], dims1008);
            [functional_4_1_glo_2, functional_4_1_glo_2NumDims] = test_model_v2.coder.ops.onnxSqueeze(xReduced1009, this.Vars.ReduceMaxAxes1006, coder.const(Transpose__188_0NumDims));

            % ReduceMean:
            dims1010 = test_model_v2.coder.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1007, coder.const(Transpose__188_0NumDims));
            xReduced1011 = mean(Transpose__188_0, dims1010);
            [functional_4_1_globa, functional_4_1_globaNumDims] = test_model_v2.coder.ops.onnxSqueeze(xReduced1011, this.Vars.ReduceMeanAxes1007, coder.const(Transpose__188_0NumDims));

            % Set graph output arguments
            functional_4_1_max_2NumDims1008 = functional_4_1_max_2NumDims;
            functional_4_1_globaNumDims1009 = functional_4_1_globaNumDims;
            functional_4_1_glo_2NumDims1010 = functional_4_1_glo_2NumDims;

        end

    end

end