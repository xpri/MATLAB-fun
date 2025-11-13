function [out] = exp_1(x, tol,n)
%EXP_1 exponential function approximation using mclauren polynomial.
%   x is the e^x number that we are testing
%   tol is the tolerance, or relative error. e.g. take the value of the next term and that will be the maximum error.
%   n is the number of iterations in the mclauren polynomial

%relative error is [current error - previous error]/[current error]

out = 0; %initializing the sum of the series
previousOut = 0;

for k = 0:n
    term = (x^k)/[factorial(k)];
    out = out + term;
    relativeError = abs([out - previousOut]/[out]);

    if relativeError < tol/2
            break;
    end

    previousOut = out;
end
if k == n
    warning('Maximum iterations met before tolerance has been met.')
end