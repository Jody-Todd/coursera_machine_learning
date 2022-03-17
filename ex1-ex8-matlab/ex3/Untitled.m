% Xe = [ones(m, 1) X];
% 
% newRow = ones(1,size(Xe,1)); 
% ze2 = Theta1*Xe';
% ze2 = [newRow; ze2];
% ae2 = sigmoid(ze2);
% 
% ze3 = Theta2*ae2;
% ae3 = sigmoid(ze3);
% 
% [col_max, I] = max(ae3);
% max([1 5 4 9]);
% a = [1; 2; 3]
% 
% sigmoid(a);
% a == [1;5;7];
% b = zeros(10,1);
% b(3) = 1;
% b;
file_contents = readFile('emailSample1.txt');
%word_indices  = processEmail(file_contents);
[str, email_contents] = ...
       strtok(file_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
   