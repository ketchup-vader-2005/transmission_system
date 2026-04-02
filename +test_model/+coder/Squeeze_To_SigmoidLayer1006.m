classdef Squeeze_To_SigmoidLayer1006 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_5_1_de_12
        functional_5_1_de_17
        functional_5_1_de_22
        functional_5_1_dis_2
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
            this_cg = test_model.coder.Squeeze_To_SigmoidLayer1006(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_SigmoidLayer1006(cgInstance.Name);
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
            this_ml.functional_5_1_de_12 = cgInstance.functional_5_1_de_12;
            this_ml.functional_5_1_de_17 = cgInstance.functional_5_1_de_17;
            this_ml.functional_5_1_de_22 = cgInstance.functional_5_1_de_22;
            this_ml.functional_5_1_dis_2 = cgInstance.functional_5_1_dis_2;
        end
    end

    methods
        function this = Squeeze_To_SigmoidLayer1006(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'distance'};
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
            this.functional_5_1_de_12 = mlInstance.functional_5_1_de_12;
            this.functional_5_1_de_17 = mlInstance.functional_5_1_de_17;
            this.functional_5_1_de_22 = mlInstance.functional_5_1_de_22;
            this.functional_5_1_dis_2 = mlInstance.functional_5_1_dis_2;
        end

        function [distance] = predict(this, functional_5_1_co_32__)
            if isdlarray(functional_5_1_co_32__)
                functional_5_1_co_32_ = stripdims(functional_5_1_co_32__);
            else
                functional_5_1_co_32_ = functional_5_1_co_32__;
            end
            functional_5_1_co_32NumDims = 4;
            functional_5_1_co_32 = test_model.coder.ops.permuteInputVar(functional_5_1_co_32_, [4 3 1 2], 4);

            [distance__, distanceNumDims__] = Squeeze_To_SigmoidGraph1012(this, functional_5_1_co_32, functional_5_1_co_32NumDims, false);
            distance_ = test_model.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [distance, distanceNumDims1013] = Squeeze_To_SigmoidGraph1012(this, functional_5_1_co_32, functional_5_1_co_32NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_5_1_co_31, functional_5_1_co_31NumDims] = test_model.coder.ops.onnxSqueeze(functional_5_1_co_32, this.Vars.const_fold_opt__341_, coder.const(functional_5_1_co_32NumDims));

            % Add:
            functional_5_1_co_27 = functional_5_1_co_31 + this.Vars.const_fold_opt__348;
            functional_5_1_co_27NumDims = max(coder.const(functional_5_1_co_31NumDims), this.NumDims.const_fold_opt__348);

            % Relu:
            X1023 = dlarray(test_model.coder.ops.extractIfDlarray(functional_5_1_co_27));
            Y1024 = relu(X1023);
            functional_5_1_co_28 = test_model.coder.ops.extractIfDlarray(Y1024);
            functional_5_1_co_28NumDims = coder.const(functional_5_1_co_27NumDims);

            % GlobalAveragePool:
            [poolsize1025, dataFormat1026, functional_5_1_glo_2NumDims] = test_model.coder.ops.prepareGlobalAveragePoolArgs(functional_5_1_co_28, coder.const(functional_5_1_co_28NumDims));
            X1027 = dlarray(single(test_model.coder.ops.extractIfDlarray(functional_5_1_co_28)));
            Y1028 = avgpool(X1027, poolsize1025, 'DataFormat', dataFormat1026);
            functional_5_1_glo_2 = test_model.coder.ops.extractIfDlarray(Y1028);

            % Squeeze:
            [functional_5_1_glo_3, functional_5_1_glo_3NumDims] = test_model.coder.ops.onnxSqueeze(functional_5_1_glo_2, this.Vars.const_fold_opt__341_, coder.const(functional_5_1_glo_2NumDims));

            % MatMul:
            [functional_5_1_de_14, functional_5_1_de_14NumDims] = test_model.coder.ops.onnxMatMul(functional_5_1_glo_3, this.functional_5_1_de_12, coder.const(functional_5_1_glo_3NumDims), this.NumDims.functional_5_1_de_12);

            % Add:
            functional_5_1_de_11 = functional_5_1_de_14 + this.Vars.functional_5_1_de_10;
            functional_5_1_de_11NumDims = max(coder.const(functional_5_1_de_14NumDims), this.NumDims.functional_5_1_de_10);

            % LeakyRelu:
            functional_5_1_de_13 = leakyrelu(dlarray(functional_5_1_de_11), 0.200000);
            functional_5_1_de_13NumDims = coder.const(functional_5_1_de_11NumDims);

            % MatMul:
            [functional_5_1_de_19, functional_5_1_de_19NumDims] = test_model.coder.ops.onnxMatMul(functional_5_1_de_13, this.functional_5_1_de_17, coder.const(functional_5_1_de_13NumDims), this.NumDims.functional_5_1_de_17);

            % Add:
            functional_5_1_de_16 = functional_5_1_de_19 + this.Vars.functional_5_1_de_15;
            functional_5_1_de_16NumDims = max(coder.const(functional_5_1_de_19NumDims), this.NumDims.functional_5_1_de_15);

            % LeakyRelu:
            functional_5_1_de_18 = leakyrelu(dlarray(functional_5_1_de_16), 0.200000);
            functional_5_1_de_18NumDims = coder.const(functional_5_1_de_16NumDims);

            % MatMul:
            [functional_5_1_de_24, functional_5_1_de_24NumDims] = test_model.coder.ops.onnxMatMul(functional_5_1_de_18, this.functional_5_1_de_22, coder.const(functional_5_1_de_18NumDims), this.NumDims.functional_5_1_de_22);

            % Add:
            functional_5_1_de_21 = functional_5_1_de_24 + this.Vars.functional_5_1_de_20;
            functional_5_1_de_21NumDims = max(coder.const(functional_5_1_de_24NumDims), this.NumDims.functional_5_1_de_20);

            % LeakyRelu:
            functional_5_1_de_23 = leakyrelu(dlarray(functional_5_1_de_21), 0.200000);
            functional_5_1_de_23NumDims = coder.const(functional_5_1_de_21NumDims);

            % MatMul:
            [functional_5_1_dis_3, functional_5_1_dis_3NumDims] = test_model.coder.ops.onnxMatMul(functional_5_1_de_23, this.functional_5_1_dis_2, coder.const(functional_5_1_de_23NumDims), this.NumDims.functional_5_1_dis_2);

            % Add:
            functional_5_1_dis_1 = functional_5_1_dis_3 + this.Vars.functional_5_1_dista;
            functional_5_1_dis_1NumDims = max(coder.const(functional_5_1_dis_3NumDims), this.NumDims.functional_5_1_dista);

            % Sigmoid:
            X1029 = dlarray(test_model.coder.ops.extractIfDlarray(functional_5_1_dis_1));
            Y1030 = sigmoid(X1029);
            distance = test_model.coder.ops.extractIfDlarray(Y1030);
            distanceNumDims = coder.const(functional_5_1_dis_1NumDims);

            % Set graph output arguments
            distanceNumDims1013 = distanceNumDims;

        end

    end

end