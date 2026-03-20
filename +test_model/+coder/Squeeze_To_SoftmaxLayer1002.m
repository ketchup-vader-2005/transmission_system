classdef Squeeze_To_SoftmaxLayer1002 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

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
            this_cg = test_model.coder.Squeeze_To_SoftmaxLayer1002(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_SoftmaxLayer1002(cgInstance.Name);
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
            this_ml.functional_58_1_de_2 = cgInstance.functional_58_1_de_2;
            this_ml.functional_58_1_ty_2 = cgInstance.functional_58_1_ty_2;
            this_ml.functional_58_1_di_1 = cgInstance.functional_58_1_di_1;
        end
    end

    methods
        function this = Squeeze_To_SoftmaxLayer1002(mlInstance)
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
            this.functional_58_1_de_2 = mlInstance.functional_58_1_de_2;
            this.functional_58_1_ty_2 = mlInstance.functional_58_1_ty_2;
            this.functional_58_1_di_1 = mlInstance.functional_58_1_di_1;
        end

        function [type, distance] = predict(this, functional_58_1_c_11__)
            if isdlarray(functional_58_1_c_11__)
                functional_58_1_c_11_ = stripdims(functional_58_1_c_11__);
            else
                functional_58_1_c_11_ = functional_58_1_c_11__;
            end
            functional_58_1_c_11NumDims = 4;
            functional_58_1_c_11 = test_model.coder.ops.permuteInputVar(functional_58_1_c_11_, [4 3 1 2], 4);

            [type__, distance__, typeNumDims__, distanceNumDims__] = Squeeze_To_SoftmaxGraph1004(this, functional_58_1_c_11, functional_58_1_c_11NumDims, false);
            type_ = test_model.coder.ops.permuteOutputVar(type__, ['as-is'], 2);
            distance_ = test_model.coder.ops.permuteOutputVar(distance__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
            distance = dlarray(single(distance_), repmat('U', 1, max(2, coder.const(distanceNumDims__))));
        end

        function [type, distance, typeNumDims1005, distanceNumDims1006] = Squeeze_To_SoftmaxGraph1004(this, functional_58_1_c_11, functional_58_1_c_11NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_58_1_c_10, functional_58_1_c_10NumDims] = test_model.coder.ops.onnxSqueeze(functional_58_1_c_11, this.Vars.const_fold_opt__56__, coder.const(functional_58_1_c_11NumDims));

            % Add:
            functional_58_1_c_7 = functional_58_1_c_10 + this.Vars.const_fold_opt__59;
            functional_58_1_c_7NumDims = max(coder.const(functional_58_1_c_10NumDims), this.NumDims.const_fold_opt__59);

            % Relu:
            X1004 = dlarray(test_model.coder.ops.extractIfDlarray(functional_58_1_c_7));
            Y1005 = relu(X1004);
            functional_58_1_c_8 = test_model.coder.ops.extractIfDlarray(Y1005);
            functional_58_1_c_8NumDims = coder.const(functional_58_1_c_7NumDims);

            % GlobalAveragePool:
            [poolsize1006, dataFormat1007, functional_58_1_globNumDims] = test_model.coder.ops.prepareGlobalAveragePoolArgs(functional_58_1_c_8, coder.const(functional_58_1_c_8NumDims));
            X1008 = dlarray(single(test_model.coder.ops.extractIfDlarray(functional_58_1_c_8)));
            Y1009 = avgpool(X1008, poolsize1006, 'DataFormat', dataFormat1007);
            functional_58_1_glob = test_model.coder.ops.extractIfDlarray(Y1009);

            % Squeeze:
            [functional_58_1_gl_1, functional_58_1_gl_1NumDims] = test_model.coder.ops.onnxSqueeze(functional_58_1_glob, this.Vars.const_fold_opt__56__, coder.const(functional_58_1_globNumDims));

            % MatMul:
            [functional_58_1_de_3, functional_58_1_de_3NumDims] = test_model.coder.ops.onnxMatMul(functional_58_1_gl_1, this.functional_58_1_de_2, coder.const(functional_58_1_gl_1NumDims), this.NumDims.functional_58_1_de_2);

            % Add:
            functional_58_1_de_1 = functional_58_1_de_3 + this.Vars.functional_58_1_dens;
            functional_58_1_de_1NumDims = max(coder.const(functional_58_1_de_3NumDims), this.NumDims.functional_58_1_dens);

            % Relu:
            X1010 = dlarray(test_model.coder.ops.extractIfDlarray(functional_58_1_de_1));
            Y1011 = relu(X1010);
            functional_58_1_de_4 = test_model.coder.ops.extractIfDlarray(Y1011);
            functional_58_1_de_4NumDims = coder.const(functional_58_1_de_1NumDims);

            % MatMul:
            [functional_58_1_ty_3, functional_58_1_ty_3NumDims] = test_model.coder.ops.onnxMatMul(functional_58_1_de_4, this.functional_58_1_ty_2, coder.const(functional_58_1_de_4NumDims), this.NumDims.functional_58_1_ty_2);

            % Add:
            functional_58_1_ty_1 = functional_58_1_ty_3 + this.Vars.functional_58_1_type;
            functional_58_1_ty_1NumDims = max(coder.const(functional_58_1_ty_3NumDims), this.NumDims.functional_58_1_type);

            % Softmax:
            [type, typeNumDims] = test_model.coder.ops.onnxSoftmax13(functional_58_1_ty_1, -1, coder.const(functional_58_1_ty_1NumDims));

            % MatMul:
            [functional_58_1_di_2, functional_58_1_di_2NumDims] = test_model.coder.ops.onnxMatMul(functional_58_1_de_4, this.functional_58_1_di_1, coder.const(functional_58_1_de_4NumDims), this.NumDims.functional_58_1_di_1);

            % Add:
            distance = functional_58_1_di_2 + this.Vars.functional_58_1_dist;
            distanceNumDims = max(coder.const(functional_58_1_di_2NumDims), this.NumDims.functional_58_1_dist);

            % Set graph output arguments
            typeNumDims1005 = typeNumDims;
            distanceNumDims1006 = distanceNumDims;

        end

    end

end