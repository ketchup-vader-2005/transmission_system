classdef Squeeze_To_AddLayer1006 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_3_1_de_12
        functional_3_1_de_17
        functional_3_1_de_22
        functional_3_1_dis_1
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
            name = 'test_model.coder.Squeeze_To_AddLayer1006';
        end
    end


    methods
        function this = Squeeze_To_AddLayer1006(name)
            this.Name = name;
            this.OutputNames = {'distance'};
        end

        function [distance] = predict(this, functional_3_1_co_32)
            if isdlarray(functional_3_1_co_32)
                functional_3_1_co_32 = stripdims(functional_3_1_co_32);
            end
            functional_3_1_co_32NumDims = 4;
            functional_3_1_co_32 = test_model.ops.permuteInputVar(functional_3_1_co_32, [4 3 1 2], 4);

            [distance, distanceNumDims] = Squeeze_To_AddGraph1012(this, functional_3_1_co_32, functional_3_1_co_32NumDims, false);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [distance] = forward(this, functional_3_1_co_32)
            if isdlarray(functional_3_1_co_32)
                functional_3_1_co_32 = stripdims(functional_3_1_co_32);
            end
            functional_3_1_co_32NumDims = 4;
            functional_3_1_co_32 = test_model.ops.permuteInputVar(functional_3_1_co_32, [4 3 1 2], 4);

            [distance, distanceNumDims] = Squeeze_To_AddGraph1012(this, functional_3_1_co_32, functional_3_1_co_32NumDims, true);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [distance, distanceNumDims1013] = Squeeze_To_AddGraph1012(this, functional_3_1_co_32, functional_3_1_co_32NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_31, functional_3_1_co_31NumDims] = test_model.ops.onnxSqueeze(functional_3_1_co_32, this.Vars.const_fold_opt__2711, functional_3_1_co_32NumDims);

            % Add:
            functional_3_1_co_27 = functional_3_1_co_31 + this.Vars.const_fold_opt__2706;
            functional_3_1_co_27NumDims = max(functional_3_1_co_31NumDims, this.NumDims.const_fold_opt__2706);

            % Relu:
            functional_3_1_co_28 = relu(dlarray(functional_3_1_co_27));
            functional_3_1_co_28NumDims = functional_3_1_co_27NumDims;

            % GlobalMaxPool:
            [poolsize, dataFormat, functional_3_1_glo_2NumDims] = test_model.ops.prepareGlobalMaxPoolArgs(functional_3_1_co_28, functional_3_1_co_28NumDims);
            functional_3_1_glo_2 = maxpool(functional_3_1_co_28, poolsize, 'DataFormat', dataFormat);

            % Squeeze:
            [functional_3_1_glo_3, functional_3_1_glo_3NumDims] = test_model.ops.onnxSqueeze(functional_3_1_glo_2, this.Vars.const_fold_opt__2711, functional_3_1_glo_2NumDims);

            % MatMul:
            [functional_3_1_de_14, functional_3_1_de_14NumDims] = test_model.ops.onnxMatMul(functional_3_1_glo_3, this.functional_3_1_de_12, functional_3_1_glo_3NumDims, this.NumDims.functional_3_1_de_12);

            % Add:
            functional_3_1_de_11 = functional_3_1_de_14 + this.Vars.functional_3_1_de_10;
            functional_3_1_de_11NumDims = max(functional_3_1_de_14NumDims, this.NumDims.functional_3_1_de_10);

            % LeakyRelu:
            functional_3_1_de_13 = leakyrelu(functional_3_1_de_11, 0.200000);
            functional_3_1_de_13NumDims = functional_3_1_de_11NumDims;

            % MatMul:
            [functional_3_1_de_19, functional_3_1_de_19NumDims] = test_model.ops.onnxMatMul(functional_3_1_de_13, this.functional_3_1_de_17, functional_3_1_de_13NumDims, this.NumDims.functional_3_1_de_17);

            % Add:
            functional_3_1_de_16 = functional_3_1_de_19 + this.Vars.functional_3_1_de_15;
            functional_3_1_de_16NumDims = max(functional_3_1_de_19NumDims, this.NumDims.functional_3_1_de_15);

            % LeakyRelu:
            functional_3_1_de_18 = leakyrelu(functional_3_1_de_16, 0.200000);
            functional_3_1_de_18NumDims = functional_3_1_de_16NumDims;

            % MatMul:
            [functional_3_1_de_24, functional_3_1_de_24NumDims] = test_model.ops.onnxMatMul(functional_3_1_de_18, this.functional_3_1_de_22, functional_3_1_de_18NumDims, this.NumDims.functional_3_1_de_22);

            % Add:
            functional_3_1_de_21 = functional_3_1_de_24 + this.Vars.functional_3_1_de_20;
            functional_3_1_de_21NumDims = max(functional_3_1_de_24NumDims, this.NumDims.functional_3_1_de_20);

            % LeakyRelu:
            functional_3_1_de_23 = leakyrelu(functional_3_1_de_21, 0.200000);
            functional_3_1_de_23NumDims = functional_3_1_de_21NumDims;

            % MatMul:
            [functional_3_1_dis_2, functional_3_1_dis_2NumDims] = test_model.ops.onnxMatMul(functional_3_1_de_23, this.functional_3_1_dis_1, functional_3_1_de_23NumDims, this.NumDims.functional_3_1_dis_1);

            % Add:
            distance = functional_3_1_dis_2 + this.Vars.functional_3_1_dista;
            distanceNumDims = max(functional_3_1_dis_2NumDims, this.NumDims.functional_3_1_dista);

            % Set graph output arguments
            distanceNumDims1013 = distanceNumDims;

        end

    end

end