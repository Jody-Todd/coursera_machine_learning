data = load('ex1data1.txt'); % read comma separated data

X = data(:, 1); 
y = data(:, 2);
m = length(X); % number of training examples
X = [ones(m,1),data(:,1)]; % Add a column of ones to X. X is a m x 2 matrix 
theta = zeros(2, 1); % initialize fitting parameters
iterations = 1500;
alpha = 0.01;

% Run gradient descent:
% Compute theta
[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

% Print theta to screen. theta0 and theta1 are the 2 parameters computed
% from the gradient descent algorithm and which are multiplied by our
% sample X data to get the predictions from our hypothesis.

% Display gradient descent's result
fprintf('Theta computed from gradient descent:\n%f,\n%f',theta(1),theta(2))
%fprintf('\nJ history: %g', J_history)

% Plot the linear fit
hold on; % keep previous plot visible (run plotDataCall.m first to see our 
% example data overlayed with a linear fit line from our gradient descent 
% computation.

plot(X(:,2), X*theta, '-') % (x, theta*x + theta*1)
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('\nFor population = 35,000, we predict a profit of %f\n', predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n', predict2*10000);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this is for visualizing the cost function

% Visualizing J(theta_0, theta_1):
% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';

% Surface plot
% Surface plot plots x, y, z where z is a matrix whose elements give the height
% above the x and y axes at x,y. This plot gives us the cost J for a range
% of theta0 and theta1 parametric values.

figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot. This plot shows each contour where the height z (cost) is
% the same. It is useful because it shows us the x and y coordinates of our
% paramters for each computed cost. It also gives the global minimum which
% is where the cost = 0.

figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
hold off;
