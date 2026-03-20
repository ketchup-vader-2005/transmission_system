classdef Squeeze_To_SoftmaxLayer1002 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        functional_58_1_de_2
        functional_58_1_ty_2
        functional_58_1_di_1
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
            name = 'test_model.coder.Squeeze_To_SoftmaxLayer1002';
        end
    end


    methods
        function this = Squeeze_To_SoftmaxLayer1002(name)
            this.Name = name;
            this.NumOutputs = 2;
            this.OutputNames = {'type', 'distance'};
        end

        function [type, distance] = predict(this, functional_58_1_c_11)
            if isdlarray(functional_58_1_c_11)
                functional_58_1_c_11 = stripdims(functional_58_1_c_11);
            end
            functional_58_1_c_11NumDims = 4;
            functional_58_1_c_11 = test_model.ops.permuteInputVar(functional_58_1_c_11, [4 3 1 2], 4);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SoftmaxGraph1004(this, functional_58_1_c_11, functional_58_1_c_11NumDims, false);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance] = forward(this, functional_58_1_c_11)
            if isdlarray(functional_58_1_c_11)
                functional_58_1_c_11 = stripdims(functional_58_1_c_11);
            end
            functional_58_1_c_11NumDims = 4;
            functional_58_1_c_11 = test_model.ops.permuteInputVar(functional_58_1_c_11, [4 3 1 2], 4);

            [type, distance, typeNumDims, distanceNumDims] = Squeeze_To_SoftmaxGraph1004(this, functional_58_1_c_11, functional_58_1_c_11NumDims, true);
            type = test_model.ops.permuteOutputVar(type, ['as-is'], 2);
            distance = test_model.ops.permuteOutputVar(distance, ['as-is'], 2);

            type = dlarray(single(type), repmat('U', 1, max(2, typeNumDims)));
            distance = dlarray(single(distance), repmat('U', 1, max(2, distanceNumDims)));
        end

        function [type, distance, typeNumDims1005, distanceNumDims1006] = Squeeze_To_SoftmaxGraph1004(this, functional_58_1_c_11, functional_58_1_c_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_58_1_c_10, functional_58_1_c_10NumDims] = test_model.ops.onnxSqueeze(functional_58_1_c_11, this.Vars.const_fold_opt__56__, functional_58_1_c_11NumDims);

            % Add:
            functional_58_1_c_7 = functional_58_1_c_10 + this.Vars.const_fold_opt__59;
            functional_58_1_c_7NumDims = max(functional_58_1_c_10NumDims, this.NumDims.const_fold_opt__59);

            % Relu:
            functional_58_1_c_8 = relu(dlarray(functional_58_1_c_7));
            functional_58_1_c_8NumDims = functional_58_1_c_7NumDims;

            % GlobalAveragePool:
            [poolsize, dataFormat, functional_58_1_globNumDims] = test_model.ops.prepareGlobalAveragePoolArgs(functional_58_1_c_8, functional_58_1_c_8NumDims);
            functional_58_1_glob = avgpool(functional_58_1_c_8, poolsize, 'DataFormat', dataFormat);

            % Squeeze:
            [functional_58_1_gl_1, functional_58_1_gl_1NumDims] = test_model.ops.onnxSqueeze(functional_58_1_glob, this.Vars.const_fold_opt__56__, functional_58_1_globNumDims);

            % MatMul:
            [functional_58_1_de_3, functional_58_1_de_3NumDims] = test_model.ops.onnxMatMul(functional_58_1_gl_1, this.functional_58_1_de_2, functional_58_1_gl_1NumDims, this.NumDims.functional_58_1_de_2);

            % Add:
            functional_58_1_de_1 = functional_58_1_de_3 + this.Vars.functional_58_1_dens;
            functional_58_1_de_1NumDims = max(functional_58_1_de_3NumDims, this.NumDims.functional_58_1_dens);

            % Relu:
            functional_58_1_de_4 = relu(dlarray(functional_58_1_de_1));
            functional_58_1_de_4NumDims = functional_58_1_de_1NumDims;

            % MatMul:
            [functional_58_1_ty_3, functional_58_1_ty_3NumDims] = test_model.ops.onnxMatMul(functional_58_1_de_4, this.functional_58_1_ty_2, functional_58_1_de_4NumDims, this.NumDims.functional_58_1_ty_2);

            % Add:
            functional_58_1_ty_1 = functional_58_1_ty_3 + this.Vars.functional_58_1_type;
            functional_58_1_ty_1NumDims = max(functional_58_1_ty_3NumDims, this.NumDims.functional_58_1_type);

            % Softmax:
            [type, typeNumDims] = test_model.ops.onnxSoftmax13(functional_58_1_ty_1, -1, functional_58_1_ty_1NumDims);

            % MatMul:
            [functional_58_1_di_2, functional_58_1_di_2NumDims] = test_model.ops.onnxMatMul(functional_58_1_de_4, this.functional_58_1_di_1, functional_58_1_de_4NumDims, this.NumDims.functional_58_1_di_1);

            % Add:
            distance = functional_58_1_di_2 + this.Vars.functional_58_1_dist;
            distanceNumDims = max(functional_58_1_di_2NumDims, this.NumDims.functional_58_1_dist);

            % Set graph output arguments
            typeNumDims1005 = typeNumDims;
            distanceNumDims1006 = distanceNumDims;

        end

    end

end