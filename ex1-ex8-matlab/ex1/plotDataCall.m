data = load('ex1data1.txt'); % read comma separated data

X = data(:, 1); 
y = data(:, 2);

plotData(X, y)