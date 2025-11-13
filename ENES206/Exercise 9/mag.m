function [Magnitude] = mag(x,y)
%Calculates the magnitude between 2 values.
%   from r^2 = x^2 + y^2
%   to r = (x^2+y^2)^(1/2)
Magnitude = [x^2 + y^2]^(1/2);
end

