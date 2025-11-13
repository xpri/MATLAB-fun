function [velocity] = VelocityDynamics(r,theta)
%VELOCITYDYNAMICS Calculates the velocity vector from dynamics
%   Using the formula as v = rdot*e_r r*thetadot*e_theta

% velocity = linspace(1,2,2);

rdot = diff(r);
thetadot = diff(theta);



velocity = [rdot,r*thetadot];
% velocity(2) = r*thetadot;

end