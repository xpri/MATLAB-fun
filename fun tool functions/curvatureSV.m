function [kappa] = curvatureSV(y)
%CURVATURESV Finds the curvature in single variable y = x
%   |f''|/(1 + (f')^2)^(3/2)
numer = mag(diff(y,2));
denomin = (1 + (diff(y)^2))^(3/2);
kappa = numer/denomin;
end

