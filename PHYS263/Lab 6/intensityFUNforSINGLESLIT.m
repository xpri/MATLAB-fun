clc;
clear;
a_1 = 0.000183771306818182;
a_2 = 0.0000753869649245949;
a_3 = 0.00011032576417485;
a_4 = 0.000229462938896664
lambda = 650e-9;
power = 1e-3;
area = pi*(0.01)^2;
I_m = power/area;
theta = linspace(-0.01, 0.01, 1000);
alpha_1 = (pi * a_1 / lambda) * sin(theta);
alpha_2 = (pi * a_2 / lambda) * sin(theta);
alpha_3 = (pi * a_3 / lambda) * sin(theta);
alpha_4 = (pi * a_4 / lambda) * sin(theta);

% % all variables and expressions declared. Now time to find out what I_m is and I(theta).
% solve(0 == I_m*cos(beta).*cos(beta).*(sin(alpha)/alpha).^2,I_m)
% I = I_m*cos(beta).*cos(beta).*(sin(alpha)/alpha);

I_1 = I_m .* (sin(alpha_1) ./ alpha_1).^2;
I_2 = I_m .* (sin(alpha_2) ./ alpha_2).^2;
I_3 = I_m .* (sin(alpha_3) ./ alpha_3).^2;
I_4 = I_m .* (sin(alpha_4) ./ alpha_4).^2;

% Plotting the stuff now.
figure;
hold;
plot(theta,I_1,'DisplayName','First slit','LineStyle','-');
plot(theta,I_2,'DisplayName','Second slit','LineStyle','--');
plot(theta,I_3,'DisplayName','Third slit','LineStyle','-.');
plot(theta,I_4,'DisplayName','Fourth slit','LineStyle',':');
xlabel('Angle \theta (radians)');
ylabel('Intensity I(\theta)');
title('Single-Slit Intensity Graph');
grid;
legend;