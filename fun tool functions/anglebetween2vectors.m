function [thetad] = anglebetween2vectors(r_1,r_2,x)
%ANGLEBETWEEN2VECTORS OUTPUT IN DEGREES!!
%   computes the angle between 2 parametric vectors. 
%   r'1 dot r'_2 = |r'1||r'2| cos(theta)
%   r is being substituted with t after taken the derivative of.
r1prime = diff(r_1,t);
r2prime = diff(r_2,t);
theta = acosd(dot(r1prime,r2prime)/(mag(subs({r1prime},{t},{x}))*mag(subs({r2prime},{t},{x}))));
thetad = simplify(theta);
end

