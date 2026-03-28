classdef Squeeze_To_UnsqueezeLayer1003 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
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
            this_cg = test_model.coder.Squeeze_To_UnsqueezeLayer1003(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = test_model.Squeeze_To_UnsqueezeLayer1003(cgInstance.Name);
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
        end
    end

    methods
        function this = Squeeze_To_UnsqueezeLayer1003(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'functional_1_conv_19'};
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
        end

        function [functional_1_conv_19] = predict(this, functional_1_conv_16__)
            if isdlarray(functional_1_conv_16__)
                functional_1_conv_16_ = stripdims(functional_1_conv_16__);
            else
                functional_1_conv_16_ = functional_1_conv_16__;
            end
            functional_1_conv_16NumDims = 4;
            functional_1_conv_16 = test_model.coder.ops.permuteInputVar(functional_1_conv_16_, [4 3 1 2], 4);

            [functional_1_conv_19__, functional_1_conv_19NumDims__] = Squeeze_To_UnsqueezeGraph1006(this, functional_1_conv_16, functional_1_conv_16NumDims, false);
            functional_1_conv_19_ = test_model.coder.ops.permuteOutputVar(functional_1_conv_19__, [3 4 2 1], 4);

            functional_1_conv_19 = dlarray(single(functional_1_conv_19_), 'SSCB');
        end

        function [functional_1_conv_19, functional_1_conv_19NumDims1007] = Squeeze_To_UnsqueezeGraph1006(this, functional_1_conv_16, functional_1_conv_16NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [functional_1_conv_15, functional_1_conv_15NumDims] = test_model.coder.ops.onnxSqueeze(functional_1_conv_16, this.Vars.const_fold_opt__24_1, coder.const(functional_1_conv_16NumDims));

            % Add:
            functional_1_conv_12 = functional_1_conv_15 + this.Vars.const_fold_opt__2404;
            functional_1_conv_12NumDims = max(coder.const(functional_1_conv_15NumDims), this.NumDims.const_fold_opt__2404);

            % Relu:
            X1007 = dlarray(test_model.coder.ops.extractIfDlarray(functional_1_conv_12));
            Y1008 = relu(X1007);
            functional_1_conv_13 = test_model.coder.ops.extractIfDlarray(Y1008);
            functional_1_conv_13NumDims = coder.const(functional_1_conv_12NumDims);

            % Unsqueeze:
            [shape1009, functional_1_conv_19NumDims] = test_model.coder.ops.prepareUnsqueezeArgs(functional_1_conv_13, this.Vars.const_fold_opt__24_1, coder.const(functional_1_conv_13NumDims));
            functional_1_conv_19 = reshape(functional_1_conv_13, shape1009);

            % Set graph output arguments
            functional_1_conv_19NumDims1007 = functional_1_conv_19NumDims;

        end

    end

end