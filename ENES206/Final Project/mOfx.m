function [out] = mOfx(x,L,a,b,W,P)
%MOFX M(x) bend moment function in shear moment equations.
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
        out(i) = R_A.*x(i);
    elseif b <= x(i) && x(i) < (b + a)
        out(i) = R_A.*x(i) - P.*(x(i)-b);
    elseif (b + a) <= x(i) && x(i) <= L
        out(i) = R_A.*x(i) - P.*(x(i)-b) - [W.*(x(i)-b).^2]/[2];
    end
end
end

