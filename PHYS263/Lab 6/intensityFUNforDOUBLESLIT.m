clc;
clear;
d = 0.000279040404040404;
a = 0.000281186868686869;
% d = 0.1e-3; % Slit separation (0.1 mm)
% a = 0.02e-3; % Slit width (0.02 mm)
lambda = 650e-9;
power = 1e-3;
area = pi*(0.01)^2;
I_m = power/area;
% I_m = 1;
theta = linspace(-0.01, 0.01, 1000);
alpha = (pi * a / lambda) * sin(theta);
beta = (pi * d / lambda) * sin(theta);
% % all variables and expressions declared. Now time to find out what I_m is and I(theta).
% solve(0 == I_m*cos(beta).*cos(beta).*(sin(alpha)/alpha).^2,I_m)
% I = I_m*cos(beta).*cos(beta).*(sin(alpha)/alpha);
I = I_m * (cos(beta).^2) .* ((sin(alpha) ./ alpha).^2);
figure;
plot(theta,I);
xlabel('Angle \theta (radians)');
ylabel('Intensity I(\theta)');
title('Double-Slit Intensity Graph');
grid;