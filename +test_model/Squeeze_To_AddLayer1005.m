classdef Squeeze_To_AddLayer1005 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dens_17
        functional_1_dens_24
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
            name = 'test_model.coder.Squeeze_To_AddLayer1005';
        end
    end


    methods
        function this = Squeeze_To_AddLayer1005(name)
            this.Name = name;
            this.OutputNames = {'distance'};
        end

        function [distance] = predict(this, functional_1_conv_27)
            if isdlarray(functional_1_conv_27)
                functional_1_conv_27 = stripdims(functional_1_conv_27);
            end
            functional_1_conv_27NumDims = 4;
            functional_1_conv_27 = test_model.ops.permuteInputVar(functional_1_conv_27, [4 3 1 2], 4);

            [distance, distanceNumDims] = Squeeze_To_AddGraph1010(this, functional_1_conv_27, functional_1_conv_27NumDims, false);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [distance] = forward(this, functional_1_conv_27)
            if isdlarray(functional_1_conv_27)
                functional_1_conv_27 = stripdims(functional_1_conv_27);
            end
            functional_1_conv_27NumDims = 4;
            functional_1_conv_27 = test_model.ops.permuteInputVar(functional_1_conv_27, [4 3 1 2], 4);

            [distance, distanceNumDims] = Squeeze_To_AddGraph1010(this, functional_1_conv_27, functional_1_conv_27NumDims, true);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [distance, distanceNumDims1011] = Squeeze_To_AddGraph1010(this, functional_1_conv_27, functional_1_conv_27NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_26, functional_1_conv_26NumDims] = test_model.ops.onnxSqueeze(functional_1_conv_27, this.Vars.const_fold_opt__24_1, functional_1_conv_27NumDims);

            % Add:
            functional_1_conv_23 = functional_1_conv_26 + this.Vars.const_fold_opt__2411;
            functional_1_conv_23NumDims = max(functional_1_conv_26NumDims, this.NumDims.const_fold_opt__2411);

            % Relu:
            functional_1_conv_24 = relu(dlarray(functional_1_conv_23));
            functional_1_conv_24NumDims = functional_1_conv_23NumDims;

            % GlobalMaxPool:
            [poolsize, dataFormat, functional_1_globa_2NumDims] = test_model.ops.prepareGlobalMaxPoolArgs(functional_1_conv_24, functional_1_conv_24NumDims);
            functional_1_globa_2 = maxpool(functional_1_conv_24, poolsize, 'DataFormat', dataFormat);

            % Squeeze:
            [functional_1_globa_3, functional_1_globa_3NumDims] = test_model.ops.onnxSqueeze(functional_1_globa_2, this.Vars.const_fold_opt__24_1, functional_1_globa_2NumDims);

            % MatMul:
            [functional_1_dens_19, functional_1_dens_19NumDims] = test_model.ops.onnxMatMul(functional_1_globa_3, this.functional_1_dens_17, functional_1_globa_3NumDims, this.NumDims.functional_1_dens_17);

            % Add:
            functional_1_dens_16 = functional_1_dens_19 + this.Vars.functional_1_dense_2;
            functional_1_dens_16NumDims = max(functional_1_dens_19NumDims, this.NumDims.functional_1_dense_2);

            % LeakyRelu:
            functional_1_dens_18 = leakyrelu(functional_1_dens_16, 0.200000);
            functional_1_dens_18NumDims = functional_1_dens_16NumDims;

            % MatMul:
            [functional_1_dens_26, functional_1_dens_26NumDims] = test_model.ops.onnxMatMul(functional_1_dens_18, this.functional_1_dens_24, functional_1_dens_18NumDims, this.NumDims.functional_1_dens_24);

            % Add:
            functional_1_dens_23 = functional_1_dens_26 + this.Vars.functional_1_dense_3;
            functional_1_dens_23NumDims = max(functional_1_dens_26NumDims, this.NumDims.functional_1_dense_3);

            % LeakyRelu:
            functional_1_dens_25 = leakyrelu(functional_1_dens_23, 0.200000);
            functional_1_dens_25NumDims = functional_1_dens_23NumDims;

            % MatMul:
            [functional_1_dista_2, functional_1_dista_2NumDims] = test_model.ops.onnxMatMul(functional_1_dens_25, this.functional_1_dista_1, functional_1_dens_25NumDims, this.NumDims.functional_1_dista_1);

            % Add:
            distance = functional_1_dista_2 + this.Vars.functional_1_distanc;
            distanceNumDims = max(functional_1_dista_2NumDims, this.NumDims.functional_1_distanc);

            % Set graph output arguments
            distanceNumDims1011 = distanceNumDims;

        end

    end

end