function [y] = macauley(x,a,n)
%Macaualey function
%   f_n(x) = <x-a>^n
%   if x <= a then the the output would be zero
%   if x >= a then the output would be (x-a)^n
%   x,a,n are all specified
if x <= a
    y = 0;
elseif x >= a
    y = (x - a)^n;
end

