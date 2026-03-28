classdef Squeeze_To_SoftmaxLayer1004 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dens_2
        functional_1_dens_7
        functional_1_type__2
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
            this_cg = test_model.coder.Squeeze_To_SoftmaxLayer1004(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_SoftmaxLayer1004(cgInstance.Name);
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
            this_ml.functional_1_dens_2 = cgInstance.functional_1_dens_2;
            this_ml.functional_1_dens_7 = cgInstance.functional_1_dens_7;
            this_ml.functional_1_type__2 = cgInstance.functional_1_type__2;
        end
    end

    methods
        function this = Squeeze_To_SoftmaxLayer1004(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'type'};
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
            this.functional_1_dens_2 = mlInstance.functional_1_dens_2;
            this.functional_1_dens_7 = mlInstance.functional_1_dens_7;
            this.functional_1_type__2 = mlInstance.functional_1_type__2;
        end

        function [type] = predict(this, functional_1_conv_22__)
            if isdlarray(functional_1_conv_22__)
                functional_1_conv_22_ = stripdims(functional_1_conv_22__);
            else
                functional_1_conv_22_ = functional_1_conv_22__;
            end
            functional_1_conv_22NumDims = 4;
            functional_1_conv_22 = test_model.coder.ops.permuteInputVar(functional_1_conv_22_, [4 3 1 2], 4);

            [type__, typeNumDims__] = Squeeze_To_SoftmaxGraph1008(this, functional_1_conv_22, functional_1_conv_22NumDims, false);
            type_ = test_model.coder.ops.permuteOutputVar(type__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
        end

        function [type, typeNumDims1009] = Squeeze_To_SoftmaxGraph1008(this, functional_1_conv_22, functional_1_conv_22NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_21, functional_1_conv_21NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_conv_22, this.Vars.const_fold_opt__24_1, coder.const(functional_1_conv_22NumDims));

            % Add:
            functional_1_conv_17 = functional_1_conv_21 + this.Vars.const_fold_opt__2391;
            functional_1_conv_17NumDims = max(coder.const(functional_1_conv_21NumDims), this.NumDims.const_fold_opt__2391);

            % Relu:
            X1010 = dlarray(test_model.coder.ops.extractIfDlarray(functional_1_conv_17));
            Y1011 = relu(X1010);
            functional_1_conv_18 = test_model.coder.ops.extractIfDlarray(Y1011);
            functional_1_conv_18NumDims = coder.const(functional_1_conv_17NumDims);

            % GlobalAveragePool:
            [poolsize1012, dataFormat1013, functional_1_global_NumDims] = test_model.coder.ops.prepareGlobalAveragePoolArgs(functional_1_conv_18, coder.const(functional_1_conv_18NumDims));
            X1014 = dlarray(single(test_model.coder.ops.extractIfDlarray(functional_1_conv_18)));
            Y1015 = avgpool(X1014, poolsize1012, 'DataFormat', dataFormat1013);
            functional_1_global_ = test_model.coder.ops.extractIfDlarray(Y1015);

            % Squeeze:
            [functional_1_globa_1, functional_1_globa_1NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_global_, this.Vars.const_fold_opt__24_1, coder.const(functional_1_global_NumDims));

            % MatMul:
            [functional_1_dens_3, functional_1_dens_3NumDims] = test_model.coder.ops.onnxMatMul(functional_1_globa_1, this.functional_1_dens_2, coder.const(functional_1_globa_1NumDims), this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_3 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(coder.const(functional_1_dens_3NumDims), this.NumDims.functional_1_dense_1);

            % Relu:
            X1016 = dlarray(test_model.coder.ops.extractIfDlarray(functional_1_dens_1));
            Y1017 = relu(X1016);
            functional_1_dens_4 = test_model.coder.ops.extractIfDlarray(Y1017);
            functional_1_dens_4NumDims = coder.const(functional_1_dens_1NumDims);

            % MatMul:
            [functional_1_dens_8, functional_1_dens_8NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dens_4, this.functional_1_dens_7, coder.const(functional_1_dens_4NumDims), this.NumDims.functional_1_dens_7);

            % Add:
            functional_1_dens_6 = functional_1_dens_8 + this.Vars.functional_1_dens_5;
            functional_1_dens_6NumDims = max(coder.const(functional_1_dens_8NumDims), this.NumDims.functional_1_dens_5);

            % Relu:
            X1018 = dlarray(test_model.coder.ops.extractIfDlarray(functional_1_dens_6));
            Y1019 = relu(X1018);
            functional_1_dens_9 = test_model.coder.ops.extractIfDlarray(Y1019);
            functional_1_dens_9NumDims = coder.const(functional_1_dens_6NumDims);

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dens_9, this.functional_1_type__2, coder.const(functional_1_dens_9NumDims), this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(coder.const(functional_1_type__3NumDims), this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model.coder.ops.onnxSoftmax13(functional_1_type__1, -1, coder.const(functional_1_type__1NumDims));

            % Set graph output arguments
            typeNumDims1009 = typeNumDims;

        end

    end

end