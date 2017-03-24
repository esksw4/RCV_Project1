function [q] = homog(n,x,y,xprime,yprime)
%n = n;
%x = x;
%y = y;
%xprime = xprime;
%yprime = yprime;
for i = 1:n
    matrixA(i*2-1,:) = [x(i) y(i) 1 0 0 0 -x(i)*xprime(i) -y(i)*xprime(i) -xprime(i)];
    matrixA(i*2, :) = [0 0 0 x(i) y(i) 1 -x(i)*yprime(i) -y(i)*yprime(i) -yprime(i)];
end;
[matrixArow, matrixAcolumn] = size(matrixA);
if matrixArow ~= n*2 || matrixAcolumn ~=9
    error('matrixA is wrong');
    return
end;
[U S V] = svd(matrixA);
q = V(:,9);