clear;

lambda_max = [0.000014489, 0.000009659, 0.000006439, 0.000002898, 0.000001656, 0.000001136,9.50E-07, 0.000000495, 0.000000356, 0.00000029];
Tempurature = [200, 300, 450, 1000, 1750, 2550, 3050, 5850, 8150, 10000];
TempuratureToPowerOfFour = Tempurature.^4;
Intensity =[9.07*10^1, 4.59*10^2, 2.33*10^3, 5.67*10^4, 5.32*10^5, 2.40*10^6, 4.91*10^6, 6.64*10^7, 2.50*10^8, 5.67*10^8];

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
figure;
plot(Tempurature, lambda_max, 'o-', 'DisplayName', 'Data', 'LineStyle', '-', 'MarkerFaceColor', 'b');  % 'o-' for points with line
% plot(Intensity, Tempurature, 'o-', 'DisplayName', 'Data', 'LineStyle', '-', 'MarkerFaceColor', 'b');  % 'o-' for points with line

% Adjust the y axis
yticks(linspace(min(lambda_max), max(lambda_max), 15));  % Creates 6 tick marks evenly spaced between min and max of lambda_max
ytickformat('%.6f');  % Sets the format for the y-axis ticks to show more decimals if necessary

xticks(linspace(min(Tempurature), max(Tempurature), 15));  % 6 evenly spaced ticks for Temperature
xtickformat('%.0f');

title('Lambda Max vs. Temperature');
ylabel('\lambda_{max} (m)');
xlabel('Temperature (K)');
legend;
grid;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
figure;
% lambda_max
InverseLambda = 1./lambda_max;
plot(Tempurature, InverseLambda, 'o-', 'DisplayName', 'Data', 'LineStyle', '-', 'MarkerFaceColor', 'b');  % 'o-' for points with line
% plot(Intensity, Tempurature, 'o-', 'DisplayName', 'Data', 'LineStyle', '-', 'MarkerFaceColor', 'b');  % 'o-' for points with line

% Adjust the y axis
yticks(linspace(min(InverseLambda), max(InverseLambda), 15));  % Creates 6 tick marks evenly spaced between min and max of lambda_max
ytickformat('%.6f');  % Sets the format for the y-axis ticks to show more decimals if necessary

xticks(linspace(min(Tempurature), max(Tempurature), 15));  % 6 evenly spaced ticks for Temperature
xtickformat('%.0f');

p = vpa(polyfit(Tempurature, InverseLambda, 1));
slope = p(1);
disp('Slope of the Inverse Lambda vs. Temperature graph:');
disp(slope);

title('Inverse Lambda Max vs. Temperature');
% ylabel('\frac{1}{\lambda_{max}} (m), 'Interpreter', 'latex');
ylabel('$\frac{1}{\lambda_{max}} (m)$', 'Interpreter', 'latex');
% ylabel('\frac{1}{2} (m)');
% ylabel('The value of \frac{1}{2}');
xlabel('Temperature (K)');
legend;
grid;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
figure;
plot(Tempurature, Intensity, 'o-', 'DisplayName', 'Data', 'LineStyle', '-', 'MarkerFaceColor', 'b');

% Adjust the y axis
yticks(linspace(min(Intensity), max(Intensity), 15));  % Creates 6 tick marks evenly spaced between min and max of lambda_max
ytickformat('%.6f');  % Sets the format for the y-axis ticks to show more decimals if necessary

xticks(linspace(min(Tempurature), max(Tempurature), 15));  % 6 evenly spaced ticks for Temperature
xtickformat('%.0f');

title('Intensity vs. Temperature');
ylabel('I (W/m^2)');
xlabel('Temperature (K)');
legend;
grid;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
figure;
plot(TempuratureToPowerOfFour, Intensity, 'o-', 'DisplayName', 'Data', 'LineStyle', '-', 'MarkerFaceColor', 'b');

% Adjust the y axis
yticks(linspace(min(Intensity), max(Intensity), 15));  % Creates 6 tick marks evenly spaced between min and max of lambda_max
ytickformat('%.6f');  % Sets the format for the y-axis ticks to show more decimals if necessary

xticks(linspace(min(TempuratureToPowerOfFour), max(TempuratureToPowerOfFour), 15));  % 6 evenly spaced ticks for Temperature
xtickformat('%.0f');

p = vpa(polyfit(TempuratureToPowerOfFour, Intensity, 1));
slope = p(1);
disp('Slope of the Intensity vs. Temperature^4 graph:');
disp(slope);

title('Intensity vs. Temperature^4');
ylabel('I (W/m^2)');
xlabel('Temperature (K)');
legend;
grid;