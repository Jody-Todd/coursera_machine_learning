function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);


% theta_0 = theta(1);
% theta_1 = theta(2);
% sums_0 = 0;
% sums_1 = 0;

%     for i = 1:m
%         x_0 = X(i,1);
%         x_1 = X(i,2);
% 
%         sum_i_0 = ((x_0 * theta_0) - y(i)) * x_0;
%         sums_0 = sum_i_0 + sums_0;
% 
%         sum_i_1 = ((x_1 * theta_1) - y(i)) * x_1;
%         sums_1 = sum_i_1 + sums_1;
% 
%     end


for iter = 1:num_iters

%     theta_0 = theta_0 - alpha * (1/m) * sums_0;
%     theta_1 = theta_1 - alpha * (1/m) * sums_1;
%     
%     theta = [theta_0; theta_1];
   

       Prediction =  X * theta;
       temp1 = alpha/m * sum((Prediction - y));
       temp2 = alpha/m * sum((Prediction - y) .* X(:,2));
       
       theta(1) = theta(1) - temp1;
       theta(2) = theta(2) - temp2;
    
       % Save the cost J in every iteration    
       J_history(iter) = computeCost(X, y, theta);
  
    
end    



