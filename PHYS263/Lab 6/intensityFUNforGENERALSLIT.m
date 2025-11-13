clc;
clear;
% beta_over_alpha = input('Enter the ratio beta/alpha: ');
% a_over_lambda = input('Enter the ratio a/lambda: ');
beta_over_alpha = 2;
a_over_lambda = 5;

N = 2; % Number of slits

% power = 1e-3;
% area = pi*(0.01)^2;
% I_m = power/area;
I_m = 1;

% theta = linspace(-1, 1, 1000);

% alpha = pi * a_over_lambda * sin(theta);
alpha = linspace(0,4*pi,1000);
% alpha = 0;
% alpha = 4*pi;
% alpha = pi/4;
beta = beta_over_alpha * alpha;

% I = I_m * (sin(alpha) ./ alpha).^2 .* (sin(N * beta) ./ sin(beta)).^2;
I_1 = I_m * (sin(alpha) ./ alpha).^2 .* (sin(1 * beta) ./ sin(beta)).^2;
I_2 = I_m * (sin(alpha) ./ alpha).^2 .* (sin(2 * beta) ./ sin(beta)).^2;
I_4 = I_m * (sin(alpha) ./ alpha).^2 .* (sin(4 * beta) ./ sin(beta)).^2;

figure;
hold;
% plot(theta, I, 'b-', 'LineWidth', 1.5);
%plotting different intensity functions
plot(alpha,I_1,'DisplayName','One slit','LineStyle','-');
plot(alpha,I_2,'DisplayName','Two slits','LineStyle','--');
% plot(theta,I_3,'DisplayName','Third slit','LineStyle','-.');
plot(alpha,I_4,'DisplayName','Four slits','LineStyle','-.');

xlabel('Angle \alpha (radians)');
ylabel('Relative Intensity I(\alpha) / I_m');
title('Intensity Pattern for N = 1, 2, 4');
legend;
grid on;