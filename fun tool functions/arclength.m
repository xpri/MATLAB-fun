function [arcl] = arclength(r,a,b)
%ARCLENGTH Finds the legnth of the arc in space
%   integral of the magnitude of the derivative of the position vector
%   lower bound is starting point and upper bound is ending point.
%   lower bound is usually zero and upper bound is the t value for which
%   the position vector is on.
magrprime = mag(diff(r));
arcl = int(magrprime,a,b);
end

