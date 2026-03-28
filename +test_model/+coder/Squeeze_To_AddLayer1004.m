classdef Squeeze_To_AddLayer1004 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

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
            this_cg = test_model.coder.Squeeze_To_AddLayer1004(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_AddLayer1004(cgInstance.Name);
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
            this_ml.functional_1_dens_17 = cgInstance.functional_1_dens_17;
            this_ml.functional_1_dens_24 = cgInstance.functional_1_dens_24;
            this_ml.functional_1_dista_1 = cgInstance.functional_1_dista_1;
        end
    end

    methods
        function this = Squeeze_To_AddLayer1004(mlInstance)
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
            this.functional_1_dens_17 = mlInstance.functional_1_dens_17;
            this.functional_1_dens_24 = mlInstance.functional_1_dens_24;
            this.functional_1_dista_1 = mlInstance.functional_1_dista_1;
        end

        function [distance] = predict(this, functional_1_conv_21__)
            if isdlarray(functional_1_conv_21__)
                functional_1_conv_21_ = stripdims(functional_1_conv_21__);
            else
                functional_1_conv_21_ = functional_1_conv_21__;
            end
            functional_1_conv_21NumDims = 4;
            functional_1_conv_21 = test_model.coder.ops.permuteInputVar(functional_1_conv_21_, [4 3 1 2], 4);

            [distance__, distanceNumDims__] = Squeeze_To_AddGraph1008(this, functional_1_conv_21, functional_1_conv_21NumDims, false);
            distance_ = test_model.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [distance, distanceNumDims1009] = Squeeze_To_AddGraph1008(this, functional_1_conv_21, functional_1_conv_21NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_20, functional_1_conv_20NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_conv_21, this.Vars.const_fold_opt__2538, coder.const(functional_1_conv_21NumDims));

            % Add:
            functional_1_conv_17 = functional_1_conv_20 + this.Vars.const_fold_opt__2532;
            functional_1_conv_17NumDims = max(coder.const(functional_1_conv_20NumDims), this.NumDims.const_fold_opt__2532);

            % Relu:
            X1017 = dlarray(test_model.coder.ops.extractIfDlarray(functional_1_conv_17));
            Y1018 = relu(X1017);
            functional_1_conv_18 = test_model.coder.ops.extractIfDlarray(Y1018);
            functional_1_conv_18NumDims = coder.const(functional_1_conv_17NumDims);

            % GlobalMaxPool:
            [poolsize1019, dataFormat1020, functional_1_globa_2NumDims] = test_model.coder.ops.prepareGlobalMaxPoolArgs(functional_1_conv_18, coder.const(functional_1_conv_18NumDims));
            X1021 = dlarray(single(test_model.coder.ops.extractIfDlarray(functional_1_conv_18)));
            Y1022 = maxpool(X1021, poolsize1019, 'DataFormat', dataFormat1020);
            functional_1_globa_2 = test_model.coder.ops.extractIfDlarray(Y1022);

            % Squeeze:
            [functional_1_globa_3, functional_1_globa_3NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_globa_2, this.Vars.const_fold_opt__2538, coder.const(functional_1_globa_2NumDims));

            % MatMul:
            [functional_1_dens_19, functional_1_dens_19NumDims] = test_model.coder.ops.onnxMatMul(functional_1_globa_3, this.functional_1_dens_17, coder.const(functional_1_globa_3NumDims), this.NumDims.functional_1_dens_17);

            % Add:
            functional_1_dens_16 = functional_1_dens_19 + this.Vars.functional_1_dense_2;
            functional_1_dens_16NumDims = max(coder.const(functional_1_dens_19NumDims), this.NumDims.functional_1_dense_2);

            % LeakyRelu:
            functional_1_dens_18 = leakyrelu(dlarray(functional_1_dens_16), 0.200000);
            functional_1_dens_18NumDims = coder.const(functional_1_dens_16NumDims);

            % MatMul:
            [functional_1_dens_26, functional_1_dens_26NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dens_18, this.functional_1_dens_24, coder.const(functional_1_dens_18NumDims), this.NumDims.functional_1_dens_24);

            % Add:
            functional_1_dens_23 = functional_1_dens_26 + this.Vars.functional_1_dense_3;
            functional_1_dens_23NumDims = max(coder.const(functional_1_dens_26NumDims), this.NumDims.functional_1_dense_3);

            % LeakyRelu:
            functional_1_dens_25 = leakyrelu(dlarray(functional_1_dens_23), 0.200000);
            functional_1_dens_25NumDims = coder.const(functional_1_dens_23NumDims);

            % MatMul:
            [functional_1_dista_2, functional_1_dista_2NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dens_25, this.functional_1_dista_1, coder.const(functional_1_dens_25NumDims), this.NumDims.functional_1_dista_1);

            % Add:
            distance = functional_1_dista_2 + this.Vars.functional_1_distanc;
            distanceNumDims = max(coder.const(functional_1_dista_2NumDims), this.NumDims.functional_1_distanc);

            % Set graph output arguments
            distanceNumDims1009 = distanceNumDims;

        end

    end

end