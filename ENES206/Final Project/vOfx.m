function [out] = vOfx(x,L,a,b,W,P)
%VOFX V(x) shear force function for shear moment equations.
%   x is displacement along the length of the beam
%   L is length of beam
%   a is length of the uniformly distributed load which W acts upon
%   b is the length from the origion to the point load, P
%   W is the uniformly distributed load in kN/m
%   P is the magnitude of the point load in kN

R_B = [P*(b+a) + W*(a^2)/(2)]/[L];
R_A = W*a + P - R_B;

for i = 1:length(x)
    if 0 <= x(i) && x(i) < b
        out(i) = R_A;
    elseif b <= x(i) && x(i) < (b + a)
        out(i) = R_A - P;
    elseif (b + a) <= x(i) && x(i) <= L
        out(i) = R_A - P - W.*(x(i)-b);
    end
end
end

