function [Magnitude] = mag(r)
%Calculates the magnitude of a given vector.
%   Finds the magnitude of a given vector and then uses a for loop
%   to calculate the squares of all the elements. Then it just takes
%   the square root of the total which gives magnitude.
tot = 0;
for i = 1:length(r)
    tot = tot + r(i)^2;
end
Magnitude = [tot]^(1/2);
end

