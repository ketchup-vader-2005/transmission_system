classdef Squeeze_To_SoftmaxLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dens_16
        functional_1_type__2
        functional_1_dens_2
        functional_1_dens_9
        functional_1_dista_1
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
            this_cg = test_model.coder.Squeeze_To_SoftmaxLayer1003(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_SoftmaxLayer1003(cgInstance.Name);
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
            this_ml.functional_1_dens_16 = cgInstance.functional_1_dens_16;
            this_ml.functional_1_type__2 = cgInstance.functional_1_type__2;
            this_ml.functional_1_dens_2 = cgInstance.functional_1_dens_2;
            this_ml.functional_1_dens_9 = cgInstance.functional_1_dens_9;
            this_ml.functional_1_dista_1 = cgInstance.functional_1_dista_1;
        end
    end

    methods
        function this = Squeeze_To_SoftmaxLayer1003(mlInstance)
            this.Name = mlInstance.Name;
            this.NumInputs = 3;
            this.NumOutputs = 2;
            this.OutputNames = {'type', 'distance'};
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
            this.functional_1_dens_16 = mlInstance.functional_1_dens_16;
            this.functional_1_type__2 = mlInstance.functional_1_type__2;
            this.functional_1_dens_2 = mlInstance.functional_1_dens_2;
            this.functional_1_dens_9 = mlInstance.functional_1_dens_9;
            this.functional_1_dista_1 = mlInstance.functional_1_dista_1;
        end

        function [type, distance] = predict(this, functional_1_conv_16__, functional_1_globa_3__, functional_1_globa_3NumDims__)
            if isdlarray(functional_1_conv_16__)
                functional_1_conv_16_ = stripdims(functional_1_conv_16__);
            else
                functional_1_conv_16_ = functional_1_conv_16__;
            end
            if isdlarray(functional_1_globa_3__)
                functional_1_globa_3_ = stripdims(functional_1_globa_3__);
            else
                functional_1_globa_3_ = functional_1_globa_3__;
            end
            functional_1_conv_16NumDims = 4;
            functional_1_globa_3NumDims = numel(functional_1_globa_3NumDims__);
            functional_1_conv_16 = test_model.coder.ops.permuteInputVar(functional_1_conv_16_, [4 3 1 2], 4);
            functional_1_globa_3 = test_model.coder.ops.permuteInputVar(functional_1_globa_3_, ['as-is'], 0);

            [type__, distance__, typeNumDims__, distanceNumDims__] = Squeeze_To_SoftmaxGraph1007(this, functional_1_conv_16, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_3NumDims, false);
            type_ = test_model.coder.ops.permuteOutputVar(type__, ['as-is'], 2);
            distance_ = test_model.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [type, distance, typeNumDims1008, distanceNumDims1009] = Squeeze_To_SoftmaxGraph1007(this, functional_1_conv_16, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_3NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_15, functional_1_conv_15NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_conv_16, this.Vars.const_axes__796, coder.const(functional_1_conv_16NumDims));

            % Add:
            functional_1_conv_12 = functional_1_conv_15 + this.Vars.const_fold_opt__788;
            functional_1_conv_12NumDims = max(coder.const(functional_1_conv_15NumDims), this.NumDims.const_fold_opt__788);

            % LeakyRelu:
            functional_1_conv_13 = leakyrelu(dlarray(functional_1_conv_12), 0.200000);
            functional_1_conv_13NumDims = coder.const(functional_1_conv_12NumDims);

            % GlobalAveragePool:
            [poolsize1007, dataFormat1008, functional_1_global_NumDims] = test_model.coder.ops.prepareGlobalAveragePoolArgs(functional_1_conv_13, coder.const(functional_1_conv_13NumDims));
            X1009 = dlarray(single(test_model.coder.ops.extractIfDlarray(functional_1_conv_13)));
            Y1010 = avgpool(X1009, poolsize1007, 'DataFormat', dataFormat1008);
            functional_1_global_ = test_model.coder.ops.extractIfDlarray(Y1010);

            % Squeeze:
            [functional_1_globa_1, functional_1_globa_1NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_global_, this.Vars.const_axes__796, coder.const(functional_1_global_NumDims));

            % MatMul:
            [functional_1_dens_18, functional_1_dens_18NumDims] = test_model.coder.ops.onnxMatMul(functional_1_globa_1, this.functional_1_dens_16, coder.const(functional_1_globa_1NumDims), this.NumDims.functional_1_dens_16);

            % Add:
            functional_1_dens_15 = functional_1_dens_18 + this.Vars.functional_1_dense_3;
            functional_1_dens_15NumDims = max(coder.const(functional_1_dens_18NumDims), this.NumDims.functional_1_dense_3);

            % LeakyRelu:
            functional_1_dens_17 = leakyrelu(dlarray(functional_1_dens_15), 0.200000);
            functional_1_dens_17NumDims = coder.const(functional_1_dens_15NumDims);

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dens_17, this.functional_1_type__2, coder.const(functional_1_dens_17NumDims), this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(coder.const(functional_1_type__3NumDims), this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model.coder.ops.onnxSoftmax13(functional_1_type__1, -1, coder.const(functional_1_type__1NumDims));

            % MatMul:
            [functional_1_dens_4, functional_1_dens_4NumDims] = test_model.coder.ops.onnxMatMul(functional_1_globa_1, this.functional_1_dens_2, coder.const(functional_1_globa_1NumDims), this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_4 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(coder.const(functional_1_dens_4NumDims), this.NumDims.functional_1_dense_1);

            % LeakyRelu:
            functional_1_dens_3 = leakyrelu(dlarray(functional_1_dens_1), 0.200000);
            functional_1_dens_3NumDims = coder.const(functional_1_dens_1NumDims);

            % Add:
            functional_1_add_1_A = functional_1_dens_3 + functional_1_globa_3;
            functional_1_add_1_ANumDims = max(coder.const(functional_1_dens_3NumDims), coder.const(functional_1_globa_3NumDims));

            % MatMul:
            [functional_1_dens_11, functional_1_dens_11NumDims] = test_model.coder.ops.onnxMatMul(functional_1_add_1_A, this.functional_1_dens_9, coder.const(functional_1_add_1_ANumDims), this.NumDims.functional_1_dens_9);

            % Add:
            functional_1_dens_8 = functional_1_dens_11 + this.Vars.functional_1_dense_2;
            functional_1_dens_8NumDims = max(coder.const(functional_1_dens_11NumDims), this.NumDims.functional_1_dense_2);

            % LeakyRelu:
            functional_1_dens_10 = leakyrelu(dlarray(functional_1_dens_8), 0.200000);
            functional_1_dens_10NumDims = coder.const(functional_1_dens_8NumDims);

            % MatMul:
            [functional_1_dista_2, functional_1_dista_2NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dens_10, this.functional_1_dista_1, coder.const(functional_1_dens_10NumDims), this.NumDims.functional_1_dista_1);

            % Add:
            distance = functional_1_dista_2 + this.Vars.functional_1_distanc;
            distanceNumDims = max(coder.const(functional_1_dista_2NumDims), this.NumDims.functional_1_distanc);

            % Set graph output arguments
            typeNumDims1008 = typeNumDims;
            distanceNumDims1009 = distanceNumDims;

        end

    end

end