% Data
n_u = [3, 4, 5];                % Upper energy levels
lambda_nm = [636.840710772154, 475.0611310711, 420.108324232174]; % Wavelengths (nm)
lambda_m = lambda_nm * 1e-9;    % Convert to meters

% Linearized variables
x = 1 ./ (n_u.^2);              % x = 1/n_u^2
y = 1 ./ lambda_m;              % y = 1/λ

% Plot data points
scatter(x, y, 100, 'filled', 'MarkerFaceColor', 'b');
hold on;

% Linear fit (y = mx + b)
fit_coeff = polyfit(x, y, 1);   % fit_coeff(1) = slope (m), fit_coeff(2) = intercept (b)
R_exp = -fit_coeff(1);          % Slope = -R

% Best-fit line
x_fit = linspace(min(x), max(x), 100);
y_fit = polyval(fit_coeff, x_fit);
plot(x_fit, y_fit, 'r--', 'LineWidth', 1.5);

% Format equation for legend
equation = sprintf('y = %.3g x + %.3g\nR = %.4f × 10^7 m^{-1}', fit_coeff(1), fit_coeff(2), R_exp/1e7);

% Labels and legend
xlabel('1/n_u^2');
ylabel('1/\lambda (m^{-1})');
title('Determining Rydberg Constant (R)');
legend('Data', equation, 'Location', 'northwest');
grid on;
hold off;

% Compare to theoretical R
R_theory = 11289126.7509994;    %This value is taken from the excel spreadsheet.
error = abs(R_exp - R_theory) / R_theory * 100;
fprintf('Experimental R: %.8f × 10^7 m^-1\n', R_exp/1e7);
fprintf('Theoretical R:  %.4f × 10^7 m^-1\n', R_theory/1e7);
fprintf('Error: %.2f%%\n', error);  