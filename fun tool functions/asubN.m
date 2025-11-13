function [out] = asubN(r)
%ASUBN FINDS THE ACCERELATION NORMAL FOR THE POSITION VECTOR
%   After deriving the acceleration normal, a_n = curvature times speed ^2
kappa = curvatureMV(r);
s = mag(diff(r));
out = kappa .* s.^2;
end

