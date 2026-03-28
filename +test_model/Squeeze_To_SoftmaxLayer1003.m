classdef Squeeze_To_SoftmaxLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_3_1_de_2
        functional_3_1_de_7
        functional_3_1_typ_2
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
            this.OutputNames = {'type'};
        end

        function [type] = predict(this, functional_3_1_co_16)
            if isdlarray(functional_3_1_co_16)
                functional_3_1_co_16 = stripdims(functional_3_1_co_16);
            end
            functional_3_1_co_16NumDims = 4;
            functional_3_1_co_16 = test_model.ops.permuteInputVar(functional_3_1_co_16, [4 3 1 2], 4);

            [type, typeNumDims] = Squeeze_To_SoftmaxGraph1006(this, functional_3_1_co_16, functional_3_1_co_16NumDims, false);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
        end

        function [type] = forward(this, functional_3_1_co_16)
            if isdlarray(functional_3_1_co_16)
                functional_3_1_co_16 = stripdims(functional_3_1_co_16);
            end
            functional_3_1_co_16NumDims = 4;
            functional_3_1_co_16 = test_model.ops.permuteInputVar(functional_3_1_co_16, [4 3 1 2], 4);

            [type, typeNumDims] = Squeeze_To_SoftmaxGraph1006(this, functional_3_1_co_16, functional_3_1_co_16NumDims, true);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
        end

        function [type, typeNumDims1007] = Squeeze_To_SoftmaxGraph1006(this, functional_3_1_co_16, functional_3_1_co_16NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_15, functional_3_1_co_15NumDims] = test_model.ops.onnxSqueeze(functional_3_1_co_16, this.Vars.const_fold_opt__2711, functional_3_1_co_16NumDims);

            % Add:
            functional_3_1_co_12 = functional_3_1_co_15 + this.Vars.const_fold_opt__2704;
            functional_3_1_co_12NumDims = max(functional_3_1_co_15NumDims, this.NumDims.const_fold_opt__2704);

            % Relu:
            functional_3_1_co_13 = relu(dlarray(functional_3_1_co_12));
            functional_3_1_co_13NumDims = functional_3_1_co_12NumDims;

            % GlobalAveragePool:
            [poolsize, dataFormat, functional_3_1_globaNumDims] = test_model.ops.prepareGlobalAveragePoolArgs(functional_3_1_co_13, functional_3_1_co_13NumDims);
            functional_3_1_globa = avgpool(functional_3_1_co_13, poolsize, 'DataFormat', dataFormat);

            % Squeeze:
            [functional_3_1_glo_1, functional_3_1_glo_1NumDims] = test_model.ops.onnxSqueeze(functional_3_1_globa, this.Vars.const_fold_opt__2711, functional_3_1_globaNumDims);

            % MatMul:
            [functional_3_1_de_3, functional_3_1_de_3NumDims] = test_model.ops.onnxMatMul(functional_3_1_glo_1, this.functional_3_1_de_2, functional_3_1_glo_1NumDims, this.NumDims.functional_3_1_de_2);

            % Add:
            functional_3_1_de_1 = functional_3_1_de_3 + this.Vars.functional_3_1_dense;
            functional_3_1_de_1NumDims = max(functional_3_1_de_3NumDims, this.NumDims.functional_3_1_dense);

            % Relu:
            functional_3_1_de_4 = relu(dlarray(functional_3_1_de_1));
            functional_3_1_de_4NumDims = functional_3_1_de_1NumDims;

            % MatMul:
            [functional_3_1_de_8, functional_3_1_de_8NumDims] = test_model.ops.onnxMatMul(functional_3_1_de_4, this.functional_3_1_de_7, functional_3_1_de_4NumDims, this.NumDims.functional_3_1_de_7);

            % Add:
            functional_3_1_de_6 = functional_3_1_de_8 + this.Vars.functional_3_1_de_5;
            functional_3_1_de_6NumDims = max(functional_3_1_de_8NumDims, this.NumDims.functional_3_1_de_5);

            % Relu:
            functional_3_1_de_9 = relu(dlarray(functional_3_1_de_6));
            functional_3_1_de_9NumDims = functional_3_1_de_6NumDims;

            % MatMul:
            [functional_3_1_typ_3, functional_3_1_typ_3NumDims] = test_model.ops.onnxMatMul(functional_3_1_de_9, this.functional_3_1_typ_2, functional_3_1_de_9NumDims, this.NumDims.functional_3_1_typ_2);

            % Add:
            functional_3_1_typ_1 = functional_3_1_typ_3 + this.Vars.functional_3_1_type_;
            functional_3_1_typ_1NumDims = max(functional_3_1_typ_3NumDims, this.NumDims.functional_3_1_type_);

            % Softmax:
            [type, typeNumDims] = test_model.ops.onnxSoftmax13(functional_3_1_typ_1, -1, functional_3_1_typ_1NumDims);

            % Set graph output arguments
            typeNumDims1007 = typeNumDims;

        end

    end

end