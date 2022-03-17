function centroids = computeCentroids(X, idx, K)
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% find data points assigned to each centroid
% loop through K to get corresponding points from X
for i = 1:K
    % find all idx where idx = i
    index = find(idx == i);
    sum = zeros(1, size(X,2));
    for c = 1:length(index)
        sum = X(index(c), :) + sum;
    end
    div = 1/(length(index));
    avg = div .* sum;
    for n = 1:n  
        centroids(i, :) = avg;
    end
end

    









% =============================================================


end

