%1. Define column vector
x = [-1; 0; 1; 4; 9; 2; 1; 4.5; 1.1; -0.9]
y = [1; 1; 2; 2; 3; 3; 4; 4; 5; NaN]

%2. Check vector lengths
size(x)
size(y)

%3. Perform logical operations
x < y
x < 0
x + 3 >= 0
y < 0

%4. Check a set of conditions, boolean &
all(x + 3 >= 0)
all(y > 0)
all(x + 3 >= 0) & all(y > 0)

%5. Check a set of conditions, booolean |
all(x + x >= 0) | all(y > 0)

%6. Any
any(y > 0)

%7. Basic operations
x + y
% x * y -- fails, shape doesn't agree
transpose(x)*y %inner product
x * transpose(y) %outer product
y / x %solve(y, x)
x / y

%8. Elementwise operators
x .* y
x ./ y

%9. Elementwise functions
log(x)
exp(x)

%10. More boolean
sqrt(x) >= 2

%11. Reductions
a = sum(x)
b = nansum(y.^2)

%12. Sum + functions
nansum(x .* y .^ 2)

%13. Counting Trues
sum(x > 0)

%14. More commands!
x .^ y %elementwise exp
x .^ (1/y) %elementwise x ^ y_inverse --> error! y_inverse is (1, 10)
log(exp(y)) % == y?
y * [-1, 1] %shape error? Nope -- broadcast elementwise multiplication!
x + [-1, 0, 1] %elementwise broadcast addition -- nope, shape error!
sum(y * [-1, 1], 1, 'omitnan') %array of zeros? Nope, remember matlab is 1-indexed. It's -25, 25

%15. Make a matrix, print some stuff
X = [1 4 7; 2 5 8; 3 6 9;]
display(transpose(X))
display(size(X))
display(det(X))

%16. Trace of X
trace(X)

%17. Change the diagonal
X(logical(eye(size(X)))) = [7, 8, 9] %Make a boolean mask for the diagonal elements

%18. Compute eigenvalues plus control flow
X_eig = eigs(X);

if all(X_eig >= 0)
    fprintf('X is positive definite')
elseif all(X_eig < 0)
    fprintf('X is negative definite')
end

%19. Invert X and compute eigs
X_inv = X / eye(size(X));
eigs(X)

%20. Linear algebra
a = [1; 3; 2]
transpose(a) * X
%transpose(a) .* X % This errors out
X * a

%21. Quadratic form
transpose(a) * X * a

%22. Make some matrices
I = eye(3, 3)
A =[ 1 4 7 ; 2 5 8; 3 6 9]
Y = [A I]
Z = [A;I]

%23. Generate vectors
x1 = 1:9 %left and right inclusive!
x2 = repmat([0 1], 1, 5)
x3 = ones(1, 10)
x4 = repmat([-1 1], 1, 5)
x5 = 1980:2010
x6 = linspace(0, 1, 100)

%24. More fun with linspace
linspace(-pi, pi, 500)

%25. Order of operations?
1:10+1 %goes from 1 to 11 (order: +, :)
(1:10)+1 %goes 2-11
1:(10+1) %same as the first one

%26. Define column vectors
x = [1 1.1 9  8  1  4  4  1]
y = [1; 2; 3; 4; 4; 3; 2; NaN]
z = logical([1; 1; 0; 0; 1; 0; 0; 0;])

%27. Predict and check!
x(2:5) %[1.1 9 8 1]
x(4:end-2) %[8 1 4]
x([1 5 8]) %[1 1 1]
x(repmat(1:3, 1, 4)) %1 1.1 9 1 1.1 9 1 1.1 9
y(z) %[1; 2; 4]
y(-z) %[3; 4; 3; 2; Nan] WRONG -- it errors, because -logical is undefined
y(x > 2) %shape error? NOPE, it flattens x. --> [3; 4; 3; 2]
y(x == 1) %[1; 4; NaN]
x(~isnan(y)) %everything but the last 1
y(~isnan(y)) %drops the nan

%28. Setting values with indexing
x2 = x
x2(x == 4) = -4 %remember we use round brackets in matlab D:

%29. Change values of 1 to NaN
x2(x ==1) = NaN

%30. A big experiment!
x2(z) = [] %This deletes elements from x2

%31. Make a specific matrix with range and reshape
M = [reshape(1:12, 4, 3) reshape(12:-1:1, 4, 3)]

%32. More guess and check!
M(1,3) %9
M(:, 5) %column 5
M(2, :) %row 2
M(2:3, 3:4) %[10 11; 11 10]
M(2:4, 4) %[11; 10; 9]
M(M > 5) %flat vector with elements > 5 (sort of true, it's a column)
M(:, M(1, :)<=5) %all rows, columns 1 2 6
M(M(:, 2) > 6, :) %I think this will error out because there are indices bigger than 4 in column 2
% Nope! You missed the logical. it's rows 3 and 4, all columns.
M(M(:,2) > 6, 4:6) % rows 3,4, columns 4-6

%33. Rows of M where column 5 is 3x column 6
M(M(:, 5) >= M(:, 6) .*3, :)

%34. Elements of M larger than 7
sum(sum(M > 7))

%35. Elements of M in row 2 that are smaller than their neighbors in row 1
M(2, M(2, :) < M(1, :))

%36. Elements of M that are larger than their left neighbor
M(:, 2:end) > M(:, 1:end-1)
