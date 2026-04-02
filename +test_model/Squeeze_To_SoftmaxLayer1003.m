classdef Squeeze_To_SoftmaxLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

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
        % Specify the path to the class that will be used for codegen
        function name = matlabCodegenRedirect(~)
            name = 'test_model.coder.Squeeze_To_SoftmaxLayer1003';
        end
    end


    methods
        function this = Squeeze_To_SoftmaxLayer1003(name)
            this.Name = name;
            this.NumInputs = 3;
            this.NumOutputs = 2;
            this.OutputNames = {'type', 'distance'};
        end

        function [type, distance] = predict(this, functional_1_conv_16, functional_1_globa_3, functional_1_globa_3NumDims)
            if isdlarray(functional_1_conv_16)
                functional_1_conv_16 = stripdims(functional_1_conv_16);
            end
            if isdlarray(functional_1_globa_3)
                functional_1_globa_3 = stripdims(functional_1_globa_3);
            end
            functional_1_conv_16NumDims = 4;
            functional_1_globa_3NumDims = numel(functional_1_globa_3NumDims);
            functional_1_conv_16 = test_model.ops.permuteInputVar(functional_1_conv_16, [4 3 1 2], 4);
            functional_1_globa_3 = test_model.ops.permuteInputVar(functional_1_globa_3, ['as-is'], 0);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SoftmaxGraph1007(this, functional_1_conv_16, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_3NumDims, false);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance] = forward(this, functional_1_conv_16, functional_1_globa_3, functional_1_globa_3NumDims)
            if isdlarray(functional_1_conv_16)
                functional_1_conv_16 = stripdims(functional_1_conv_16);
            end
            if isdlarray(functional_1_globa_3)
                functional_1_globa_3 = stripdims(functional_1_globa_3);
            end
            functional_1_conv_16NumDims = 4;
            functional_1_globa_3NumDims = numel(functional_1_globa_3NumDims);
            functional_1_conv_16 = test_model.ops.permuteInputVar(functional_1_conv_16, [4 3 1 2], 4);
            functional_1_globa_3 = test_model.ops.permuteInputVar(functional_1_globa_3, ['as-is'], 0);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SoftmaxGraph1007(this, functional_1_conv_16, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_3NumDims, true);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance, typeNumDims1008, distanceNumDims1009] = Squeeze_To_SoftmaxGraph1007(this, functional_1_conv_16, functional_1_globa_3, functional_1_conv_16NumDims, functional_1_globa_3NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_15, functional_1_conv_15NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_16, this.Vars.const_axes__796, functional_1_conv_16NumDims);

            % Add:
            functional_1_conv_12 = functional_1_conv_15 + this.Vars.const_fold_opt__788;
            functional_1_conv_12NumDims = max(functional_1_conv_15NumDims, this.NumDims.const_fold_opt__788);

            % LeakyRelu:
            functional_1_conv_13 = leakyrelu(functional_1_conv_12, 0.200000);
            functional_1_conv_13NumDims = functional_1_conv_12NumDims;

            % GlobalAveragePool:
            [poolsize, dataFormat, functional_1_global_NumDims] = test_model.ops.prepareGlobalAveragePoolArgs(functional_1_conv_13, functional_1_conv_13NumDims);
            functional_1_global_ = avgpool(functional_1_conv_13, poolsize, 'DataFormat', dataFormat);

            % Squeeze:
            [functional_1_globa_1, functional_1_globa_1NumDims] = test_model.ops.onnxSqueeze(functional_1_global_, this.Vars.const_axes__796, functional_1_global_NumDims);

            % MatMul:
            [functional_1_dens_18, functional_1_dens_18NumDims] = test_model.ops.onnxMatMul(functional_1_globa_1, this.functional_1_dens_16, functional_1_globa_1NumDims, this.NumDims.functional_1_dens_16);

            % Add:
            functional_1_dens_15 = functional_1_dens_18 + this.Vars.functional_1_dense_3;
            functional_1_dens_15NumDims = max(functional_1_dens_18NumDims, this.NumDims.functional_1_dense_3);

            % LeakyRelu:
            functional_1_dens_17 = leakyrelu(functional_1_dens_15, 0.200000);
            functional_1_dens_17NumDims = functional_1_dens_15NumDims;

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model.ops.onnxMatMul(functional_1_dens_17, this.functional_1_type__2, functional_1_dens_17NumDims, this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(functional_1_type__3NumDims, this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model.ops.onnxSoftmax13(functional_1_type__1, -1, functional_1_type__1NumDims);

            % MatMul:
            [functional_1_dens_4, functional_1_dens_4NumDims] = test_model.ops.onnxMatMul(functional_1_globa_1, this.functional_1_dens_2, functional_1_globa_1NumDims, this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_4 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(functional_1_dens_4NumDims, this.NumDims.functional_1_dense_1);

            % LeakyRelu:
            functional_1_dens_3 = leakyrelu(functional_1_dens_1, 0.200000);
            functional_1_dens_3NumDims = functional_1_dens_1NumDims;

            % Add:
            functional_1_add_1_A = functional_1_dens_3 + functional_1_globa_3;
            functional_1_add_1_ANumDims = max(functional_1_dens_3NumDims, functional_1_globa_3NumDims);

            % MatMul:
            [functional_1_dens_11, functional_1_dens_11NumDims] = test_model.ops.onnxMatMul(functional_1_add_1_A, this.functional_1_dens_9, functional_1_add_1_ANumDims, this.NumDims.functional_1_dens_9);

            % Add:
            functional_1_dens_8 = functional_1_dens_11 + this.Vars.functional_1_dense_2;
            functional_1_dens_8NumDims = max(functional_1_dens_11NumDims, this.NumDims.functional_1_dense_2);

            % LeakyRelu:
            functional_1_dens_10 = leakyrelu(functional_1_dens_8, 0.200000);
            functional_1_dens_10NumDims = functional_1_dens_8NumDims;

            % MatMul:
            [functional_1_dista_2, functional_1_dista_2NumDims] = test_model.ops.onnxMatMul(functional_1_dens_10, this.functional_1_dista_1, functional_1_dens_10NumDims, this.NumDims.functional_1_dista_1);

            % Add:
            distance = functional_1_dista_2 + this.Vars.functional_1_distanc;
            distanceNumDims = max(functional_1_dista_2NumDims, this.NumDims.functional_1_distanc);

            % Set graph output arguments
            typeNumDims1008 = typeNumDims;
            distanceNumDims1009 = distanceNumDims;

        end

    end

end