
values = [0.01 0.03 0.1 0.3 1 3 10 30];

model_array = struct("X",[], "y", [], "kernelFunction", [], "b", [], "alphas", [], "w", []);

err_min = inf;

for i = 1:length(values)
    C = values(i);    
    
    for j = 1:length(values)
        sig = values(j);

        % train model with gaussian kernel determined by sig and C
        trained_model = svmTrain(X, y, C, @(x1, x2)gaussianKernel(x1, x2, sig));
       
    
        pred = svmPredict(trained_model, Xval);
        err = mean(double(pred ~= yval));
    
        if( err <= err_min )
            C_final = C;
            sigma_final = sig;
            err_min   = err;
            fprintf('new min found C, sigma = %f, %f with error = %f', C_final, sigma_final, err_min)
        end
         model_array(i, j) = trained_model;
    end

end


