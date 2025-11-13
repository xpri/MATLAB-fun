function [r,theta] = polar(V)
%Converts vectors (V) from Cartesian coordinates to Polar coordinates
%   converting from rectangular to polar coordinates using magnitude
%   theta is in degrees
%   using atan2d for universal four quardant inputs
% x = r*cosd(theta)
% y = r*sind(theta)
% x^2 + y^2 = r^2, therefore, r = magnitude of x and y
% tand(theta) = y/x

r = mag(V(1),V(2));
theta = atan2d(V(2),V(1));
end

