function [uR] = UnitVector(r)
%UNITVECTOR Calculates the unit vector of vector r
%   Take the magnitude of vector r and then divide
%   it by 1. 1/magnitude. Then scaler multiply that
%   by r again. And the output is the unit vector
%   uR.
    tot = 0;
    for i = 1:length(r)
        tot = tot + r(i).^2;
    end
    Magnitude = sym([tot].^(1/2));
    uR = simplify(sym([1]/[Magnitude].*r));
end

