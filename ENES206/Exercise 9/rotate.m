function Q = rotate(V,theta)
%Rotate is rotating a set a points by a giving angle (theta, in degrees)
%   Q = rotate(V,theta) takes a point V = [x,y] and rotates it by theta degrees.
%   The rotated coordinates are then stored in matrix Q
%   We are given these set of formulas for rotation.

%newX = cos(theta)*x - sin(theta)*y
%newY = sin(theta)*x - cos(theta)*x
%combining these we get
%[X;Y] = [cos(theta) - sin(theta); sin(theta) - cos(theta)]*[x;y]
%V(1) is x
%V(2) is y
%V is [x,y]
% [new] = [cosd(theta), -sind(theta);
         % sind(theta), -cosd(theta)]*[V(1);V(2)];
R = [cosd(theta), -sind(theta);
     sind(theta), cosd(theta)];
%using V' to transpose V from a row vector to a column vector
Q = R * V';
%using Q' to transpose Q from a column vector to a row vector
Q = Q';
end

