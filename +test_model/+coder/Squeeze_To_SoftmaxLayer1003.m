classdef Squeeze_To_SoftmaxLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

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
            this_cg = test_model.coder.Squeeze_To_SoftmaxLayer1003(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_SoftmaxLayer1003(cgInstance.Name);
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
            this_ml.functional_3_1_de_2 = cgInstance.functional_3_1_de_2;
            this_ml.functional_3_1_de_7 = cgInstance.functional_3_1_de_7;
            this_ml.functional_3_1_typ_2 = cgInstance.functional_3_1_typ_2;
        end
    end

    methods
        function this = Squeeze_To_SoftmaxLayer1003(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'type'};
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
            this.functional_3_1_de_2 = mlInstance.functional_3_1_de_2;
            this.functional_3_1_de_7 = mlInstance.functional_3_1_de_7;
            this.functional_3_1_typ_2 = mlInstance.functional_3_1_typ_2;
        end

        function [type] = predict(this, functional_3_1_co_16__)
            if isdlarray(functional_3_1_co_16__)
                functional_3_1_co_16_ = stripdims(functional_3_1_co_16__);
            else
                functional_3_1_co_16_ = functional_3_1_co_16__;
            end
            functional_3_1_co_16NumDims = 4;
            functional_3_1_co_16 = test_model.coder.ops.permuteInputVar(functional_3_1_co_16_, [4 3 1 2], 4);

            [type__, typeNumDims__] = Squeeze_To_SoftmaxGraph1006(this, functional_3_1_co_16, functional_3_1_co_16NumDims, false);
            type_ = test_model.coder.ops.permuteOutputVar(type__, ['as-is'], 2);

            type = dlarray(single(type_), repmat('U', 1, max(2, coder.const(typeNumDims__))));
        end

        function [type, typeNumDims1007] = Squeeze_To_SoftmaxGraph1006(this, functional_3_1_co_16, functional_3_1_co_16NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_3_1_co_15, functional_3_1_co_15NumDims] = test_model.coder.ops.onnxSqueeze(functional_3_1_co_16, this.Vars.const_fold_opt__2711, coder.const(functional_3_1_co_16NumDims));

            % Add:
            functional_3_1_co_12 = functional_3_1_co_15 + this.Vars.const_fold_opt__2704;
            functional_3_1_co_12NumDims = max(coder.const(functional_3_1_co_15NumDims), this.NumDims.const_fold_opt__2704);

            % Relu:
            X1007 = dlarray(test_model.coder.ops.extractIfDlarray(functional_3_1_co_12));
            Y1008 = relu(X1007);
            functional_3_1_co_13 = test_model.coder.ops.extractIfDlarray(Y1008);
            functional_3_1_co_13NumDims = coder.const(functional_3_1_co_12NumDims);

            % GlobalAveragePool:
            [poolsize1009, dataFormat1010, functional_3_1_globaNumDims] = test_model.coder.ops.prepareGlobalAveragePoolArgs(functional_3_1_co_13, coder.const(functional_3_1_co_13NumDims));
            X1011 = dlarray(single(test_model.coder.ops.extractIfDlarray(functional_3_1_co_13)));
            Y1012 = avgpool(X1011, poolsize1009, 'DataFormat', dataFormat1010);
            functional_3_1_globa = test_model.coder.ops.extractIfDlarray(Y1012);

            % Squeeze:
            [functional_3_1_glo_1, functional_3_1_glo_1NumDims] = test_model.coder.ops.onnxSqueeze(functional_3_1_globa, this.Vars.const_fold_opt__2711, coder.const(functional_3_1_globaNumDims));

            % MatMul:
            [functional_3_1_de_3, functional_3_1_de_3NumDims] = test_model.coder.ops.onnxMatMul(functional_3_1_glo_1, this.functional_3_1_de_2, coder.const(functional_3_1_glo_1NumDims), this.NumDims.functional_3_1_de_2);

            % Add:
            functional_3_1_de_1 = functional_3_1_de_3 + this.Vars.functional_3_1_dense;
            functional_3_1_de_1NumDims = max(coder.const(functional_3_1_de_3NumDims), this.NumDims.functional_3_1_dense);

            % Relu:
            X1013 = dlarray(test_model.coder.ops.extractIfDlarray(functional_3_1_de_1));
            Y1014 = relu(X1013);
            functional_3_1_de_4 = test_model.coder.ops.extractIfDlarray(Y1014);
            functional_3_1_de_4NumDims = coder.const(functional_3_1_de_1NumDims);

            % MatMul:
            [functional_3_1_de_8, functional_3_1_de_8NumDims] = test_model.coder.ops.onnxMatMul(functional_3_1_de_4, this.functional_3_1_de_7, coder.const(functional_3_1_de_4NumDims), this.NumDims.functional_3_1_de_7);

            % Add:
            functional_3_1_de_6 = functional_3_1_de_8 + this.Vars.functional_3_1_de_5;
            functional_3_1_de_6NumDims = max(coder.const(functional_3_1_de_8NumDims), this.NumDims.functional_3_1_de_5);

            % Relu:
            X1015 = dlarray(test_model.coder.ops.extractIfDlarray(functional_3_1_de_6));
            Y1016 = relu(X1015);
            functional_3_1_de_9 = test_model.coder.ops.extractIfDlarray(Y1016);
            functional_3_1_de_9NumDims = coder.const(functional_3_1_de_6NumDims);

            % MatMul:
            [functional_3_1_typ_3, functional_3_1_typ_3NumDims] = test_model.coder.ops.onnxMatMul(functional_3_1_de_9, this.functional_3_1_typ_2, coder.const(functional_3_1_de_9NumDims), this.NumDims.functional_3_1_typ_2);

            % Add:
            functional_3_1_typ_1 = functional_3_1_typ_3 + this.Vars.functional_3_1_type_;
            functional_3_1_typ_1NumDims = max(coder.const(functional_3_1_typ_3NumDims), this.NumDims.functional_3_1_type_);

            % Softmax:
            [type, typeNumDims] = test_model.coder.ops.onnxSoftmax13(functional_3_1_typ_1, -1, coder.const(functional_3_1_typ_1NumDims));

            % Set graph output arguments
            typeNumDims1007 = typeNumDims;

        end

    end

end