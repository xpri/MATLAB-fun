function [Magnitude] = DistanceBetweenTwoVectors(a,b)
%DISTANCEBETWEENTWOVECTORS Calculates the distance between two vectors.
%   Subtracts vectors a and b and then finds the magnitude of this sum.
%   This new vector is called newV and then we take the magnitude of newV.
%   This works in both 2D and 3D.
    newV = a - b;

    tot = 0;
    for i = 1:length(newV)
        tot = tot + newV(i).^2;
    end
    Magnitude = sym([tot].^(1/2));

end

