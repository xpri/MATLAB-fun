function [q] = macaulay(x,a,n)
%Macaualey function
%   f_n(x) = <x-a>^n
%   if x <= a then the the output would be zero
%   if x >= a then the output would be (x-a)^n
%   x,a,n are all specified

for i = 1:length(x)
    if x(i) <= a
        q(i) = 0;
    elseif x(i) >= a
        q(i) = (x(i) - a)^n;
    end
end