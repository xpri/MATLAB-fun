function [kappa] = curvatureMV(r)
%MUST BE WITH LENGTH 3 Finds the curvature of the position vector (in multivariable).
%   theorem of curvature
%   |r' x r''| / |r'|^3
%   when doing a curvature of a single valued function
%   the position vector is always [x,f(x),0] where f(x) is the function
%   if you want to use this in single variable.
%   If you don't have a length of 3, substitude the missing component with 0.
rprime1 = diff(r);
rprime2 = diff(r,2);
crprimes = cross(rprime1,rprime2);
numer = mag(crprimes);
denomin = (mag(rprime1)).^3;

kappa = simplify(numer./denomin);
end

