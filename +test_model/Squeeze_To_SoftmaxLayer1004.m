classdef Squeeze_To_SoftmaxLayer1004 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

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
        % Specify the path to the class that will be used for codegen
        function name = matlabCodegenRedirect(~)
            name = 'test_model.coder.Squeeze_To_SoftmaxLayer1004';
        end
    end


    methods
        function this = Squeeze_To_SoftmaxLayer1004(name)
            this.Name = name;
            this.OutputNames = {'type'};
        end

        function [type] = predict(this, functional_1_conv_22)
            if isdlarray(functional_1_conv_22)
                functional_1_conv_22 = stripdims(functional_1_conv_22);
            end
            functional_1_conv_22NumDims = 4;
            functional_1_conv_22 = test_model.ops.permuteInputVar(functional_1_conv_22, [4 3 1 2], 4);

            [type, typeNumDims] = Squeeze_To_SoftmaxGraph1008(this, functional_1_conv_22, functional_1_conv_22NumDims, false);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
        end

        function [type] = forward(this, functional_1_conv_22)
            if isdlarray(functional_1_conv_22)
                functional_1_conv_22 = stripdims(functional_1_conv_22);
            end
            functional_1_conv_22NumDims = 4;
            functional_1_conv_22 = test_model.ops.permuteInputVar(functional_1_conv_22, [4 3 1 2], 4);

            [type, typeNumDims] = Squeeze_To_SoftmaxGraph1008(this, functional_1_conv_22, functional_1_conv_22NumDims, true);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
        end

        function [type, typeNumDims1009] = Squeeze_To_SoftmaxGraph1008(this, functional_1_conv_22, functional_1_conv_22NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_21, functional_1_conv_21NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_22, this.Vars.const_fold_opt__24_1, functional_1_conv_22NumDims);

            % Add:
            functional_1_conv_17 = functional_1_conv_21 + this.Vars.const_fold_opt__2391;
            functional_1_conv_17NumDims = max(functional_1_conv_21NumDims, this.NumDims.const_fold_opt__2391);

            % Relu:
            functional_1_conv_18 = relu(dlarray(functional_1_conv_17));
            functional_1_conv_18NumDims = functional_1_conv_17NumDims;

            % GlobalAveragePool:
            [poolsize, dataFormat, functional_1_global_NumDims] = test_model.ops.prepareGlobalAveragePoolArgs(functional_1_conv_18, functional_1_conv_18NumDims);
            functional_1_global_ = avgpool(functional_1_conv_18, poolsize, 'DataFormat', dataFormat);

            % Squeeze:
            [functional_1_globa_1, functional_1_globa_1NumDims] = test_model.ops.onnxSqueeze(functional_1_global_, this.Vars.const_fold_opt__24_1, functional_1_global_NumDims);

            % MatMul:
            [functional_1_dens_3, functional_1_dens_3NumDims] = test_model.ops.onnxMatMul(functional_1_globa_1, this.functional_1_dens_2, functional_1_globa_1NumDims, this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_3 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(functional_1_dens_3NumDims, this.NumDims.functional_1_dense_1);

            % Relu:
            functional_1_dens_4 = relu(dlarray(functional_1_dens_1));
            functional_1_dens_4NumDims = functional_1_dens_1NumDims;

            % MatMul:
            [functional_1_dens_8, functional_1_dens_8NumDims] = test_model.ops.onnxMatMul(functional_1_dens_4, this.functional_1_dens_7, functional_1_dens_4NumDims, this.NumDims.functional_1_dens_7);

            % Add:
            functional_1_dens_6 = functional_1_dens_8 + this.Vars.functional_1_dens_5;
            functional_1_dens_6NumDims = max(functional_1_dens_8NumDims, this.NumDims.functional_1_dens_5);

            % Relu:
            functional_1_dens_9 = relu(dlarray(functional_1_dens_6));
            functional_1_dens_9NumDims = functional_1_dens_6NumDims;

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model.ops.onnxMatMul(functional_1_dens_9, this.functional_1_type__2, functional_1_dens_9NumDims, this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(functional_1_type__3NumDims, this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model.ops.onnxSoftmax13(functional_1_type__1, -1, functional_1_type__1NumDims);

            % Set graph output arguments
            typeNumDims1009 = typeNumDims;

        end

    end

end