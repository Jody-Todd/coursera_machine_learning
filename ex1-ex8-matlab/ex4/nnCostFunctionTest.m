load('ex4data1.mat');
m = size(X, 1);

%Load the weights into variables Theta1 and Theta2
load('ex4weights.mat');

num_labels = 10;

% Setup some useful variables
m = size(X, 1);

% add bias to X to create 5000x401 matrix
X = [ones(m, 1) X];
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


% initialize summing terms used in cost expression
sum_m = 0;
sum_i = 0.0;
a = [];
% loop through each sample to calculate the cost
for i = 1:m

    % logical vector output for 1 example
    y_i = zeros(num_labels, 1);
    class = y(i);
    y_i(class) = 1;
   
    
    % first layer just equals features in one example 1x401
    a1 = X(i, :);
    
    % compute z2, a 25x1 vector
    z2 = Theta1*a1';
    
    % add bias to a2 to create a 26x1 vector
    z2 = [1; z2];
    
    % compute activation of z2
    a2 = sigmoid(z2);
    
    % add bias to a2 to create a 26x1 vector
    %a2 = [1; a2];
    
    % compute z3, a 10x1 vector
    z3 = Theta2*a2;
    
    %compute activation of z3. returns output vector of size 10x1
    a3 = sigmoid(z3);
    h = a3;
    
    % create a boolean vector from a numeric label
    J = J + sum(-y_i .* log(h) - (1 - y_i) .* log(1 - h));   
   
        
end

J = J/m;



