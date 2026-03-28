classdef Squeeze_To_SoftmaxLayer1005 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_1_dens_9
        functional_1_type__2
        functional_1_dens_2
        functional_1_dense_5
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
            this_cg = test_model.coder.Squeeze_To_SoftmaxLayer1005(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_SoftmaxLayer1005(cgInstance.Name);
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
            this_ml.functional_1_dens_9 = cgInstance.functional_1_dens_9;
            this_ml.functional_1_type__2 = cgInstance.functional_1_type__2;
            this_ml.functional_1_dens_2 = cgInstance.functional_1_dens_2;
            this_ml.functional_1_dense_5 = cgInstance.functional_1_dense_5;
            this_ml.functional_1_dista_1 = cgInstance.functional_1_dista_1;
        end
    end

    methods
        function this = Squeeze_To_SoftmaxLayer1005(mlInstance)
            this.Name = mlInstance.Name;
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
            this.functional_1_dens_9 = mlInstance.functional_1_dens_9;
            this.functional_1_type__2 = mlInstance.functional_1_type__2;
            this.functional_1_dens_2 = mlInstance.functional_1_dens_2;
            this.functional_1_dense_5 = mlInstance.functional_1_dense_5;
            this.functional_1_dista_1 = mlInstance.functional_1_dista_1;
        end

        function [type, distance] = predict(this, functional_1_conv_26__)
            if isdlarray(functional_1_conv_26__)
                functional_1_conv_26_ = stripdims(functional_1_conv_26__);
            else
                functional_1_conv_26_ = functional_1_conv_26__;
            end
            functional_1_conv_26NumDims = 4;
            functional_1_conv_26 = test_model.coder.ops.permuteInputVar(functional_1_conv_26_, [4 3 1 2], 4);

            [type__, distance__, typeNumDims__, distanceNumDims__] = Squeeze_To_SoftmaxGraph1010(this, functional_1_conv_26, functional_1_conv_26NumDims, false);
            type_ = test_model.coder.ops.permuteOutputVar(type__, ['as-is'], 2);
            distance_ = test_model.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [type, distance, typeNumDims1013, distanceNumDims1014] = Squeeze_To_SoftmaxGraph1010(this, functional_1_conv_26, functional_1_conv_26NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_25, functional_1_conv_25NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_conv_26, this.Vars.const_fold_opt__20_1, coder.const(functional_1_conv_26NumDims));

            % Add:
            functional_1_conv_22 = functional_1_conv_25 + this.Vars.const_fold_opt__2079;
            functional_1_conv_22NumDims = max(coder.const(functional_1_conv_25NumDims), this.NumDims.const_fold_opt__2079);

            % Relu:
            X1013 = dlarray(test_model.coder.ops.extractIfDlarray(functional_1_conv_22));
            Y1014 = relu(X1013);
            functional_1_conv_23 = test_model.coder.ops.extractIfDlarray(Y1014);
            functional_1_conv_23NumDims = coder.const(functional_1_conv_22NumDims);

            % Transpose:
            [perm1015, Transpose__2055_0NumDims] = test_model.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1011, coder.const(functional_1_conv_23NumDims));
            if isempty(perm1015)
                Transpose__2055_0 = functional_1_conv_23;
            else
                Transpose__2055_0 = permute(test_model.coder.ops.extractIfDlarray(functional_1_conv_23), perm1015);
            end

            % ReduceMean:
            dims1016 = test_model.coder.ops.prepareReduceArgs(this.Vars.ReduceMeanAxes1012, coder.const(Transpose__2055_0NumDims));
            xReduced1017 = mean(Transpose__2055_0, dims1016);
            [functional_1_global_, functional_1_global_NumDims] = test_model.coder.ops.onnxSqueeze(xReduced1017, this.Vars.ReduceMeanAxes1012, coder.const(Transpose__2055_0NumDims));

            % MatMul:
            [functional_1_dens_10, functional_1_dens_10NumDims] = test_model.coder.ops.onnxMatMul(functional_1_global_, this.functional_1_dens_9, coder.const(functional_1_global_NumDims), this.NumDims.functional_1_dens_9);

            % Add:
            functional_1_dens_8 = functional_1_dens_10 + this.Vars.functional_1_dense_3;
            functional_1_dens_8NumDims = max(coder.const(functional_1_dens_10NumDims), this.NumDims.functional_1_dense_3);

            % Relu:
            X1018 = dlarray(test_model.coder.ops.extractIfDlarray(functional_1_dens_8));
            Y1019 = relu(X1018);
            functional_1_dens_11 = test_model.coder.ops.extractIfDlarray(Y1019);
            functional_1_dens_11NumDims = coder.const(functional_1_dens_8NumDims);

            % MatMul:
            [functional_1_type__3, functional_1_type__3NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dens_11, this.functional_1_type__2, coder.const(functional_1_dens_11NumDims), this.NumDims.functional_1_type__2);

            % Add:
            functional_1_type__1 = functional_1_type__3 + this.Vars.functional_1_type_1_;
            functional_1_type__1NumDims = max(coder.const(functional_1_type__3NumDims), this.NumDims.functional_1_type_1_);

            % Softmax:
            [type, typeNumDims] = test_model.coder.ops.onnxSoftmax13(functional_1_type__1, -1, coder.const(functional_1_type__1NumDims));

            % Reshape:
            [shape1020, functional_1_flattenNumDims] = test_model.coder.ops.prepareReshapeArgs(Transpose__2055_0, this.Vars.functional_1_flatt_1, coder.const(Transpose__2055_0NumDims), 0);
            functional_1_flatten = reshape(Transpose__2055_0, shape1020{:});

            % MatMul:
            [functional_1_dens_4, functional_1_dens_4NumDims] = test_model.coder.ops.onnxMatMul(functional_1_flatten, this.functional_1_dens_2, coder.const(functional_1_flattenNumDims), this.NumDims.functional_1_dens_2);

            % Add:
            functional_1_dens_1 = functional_1_dens_4 + this.Vars.functional_1_dense_1;
            functional_1_dens_1NumDims = max(coder.const(functional_1_dens_4NumDims), this.NumDims.functional_1_dense_1);

            % LeakyRelu:
            functional_1_dens_3 = leakyrelu(dlarray(functional_1_dens_1), 0.200000);
            functional_1_dens_3NumDims = coder.const(functional_1_dens_1NumDims);

            % MatMul:
            [functional_1_dense_6, functional_1_dense_6NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dens_3, this.functional_1_dense_5, coder.const(functional_1_dens_3NumDims), this.NumDims.functional_1_dense_5);

            % Add:
            functional_1_dense_4 = functional_1_dense_6 + this.Vars.functional_1_dense_2;
            functional_1_dense_4NumDims = max(coder.const(functional_1_dense_6NumDims), this.NumDims.functional_1_dense_2);

            % MatMul:
            [functional_1_dista_2, functional_1_dista_2NumDims] = test_model.coder.ops.onnxMatMul(functional_1_dense_4, this.functional_1_dista_1, coder.const(functional_1_dense_4NumDims), this.NumDims.functional_1_dista_1);

            % Add:
            distance = functional_1_dista_2 + this.Vars.functional_1_distanc;
            distanceNumDims = max(coder.const(functional_1_dista_2NumDims), this.NumDims.functional_1_distanc);

            % Set graph output arguments
            typeNumDims1013 = typeNumDims;
            distanceNumDims1014 = distanceNumDims;

        end

    end

end