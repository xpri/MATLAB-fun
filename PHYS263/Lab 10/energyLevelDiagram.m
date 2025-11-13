%% Input parameters
Z = 1;                      % Atomic number (1 for H, 2 for He+, etc.)
n_levels = 5;               % Number of energy levels to compute (n=1 to n_levels)
R = 1.097e7;                % Rydberg constant (m^-1)
hc = 1240;                  % h*c (eV*nm) for wavelength conversion

%% Compute energy levels (E_n)
n = 1:n_levels;
En = -13.6 * Z^2 ./ (n.^2); % Energy levels in eV

%% Display energy levels
fprintf('Energy Levels (Z = %d):\n', Z);
fprintf('n\tE_n (eV)\n');
for i = 1:n_levels
    fprintf('%d\t%.2f\n', n(i), En(i));
end

%% Plot energy level diagram
figure;
for i = 1:n_levels
    % Horizontal lines for levels
    line([0 1], [En(i) En(i)], 'Color', 'b', 'LineWidth', 2); 
    text(1.05, En(i), sprintf('n=%d', n(i)), 'FontSize', 10);
end
xlim([0 1.5]);
ylim([min(En)-5, 0]);
xlabel('Quantum State');
ylabel('Energy (eV)');
title(sprintf('Energy Level Diagram (Z = %d)', Z));
grid on;

%% Calculate transition wavelengths (Balmer series example: n_i = 2)
n_i = 2; % Lower level (Balmer series)
n_u = 3:n_levels; % Upper levels
lambda = 1 ./ (R * Z^2 * (1/n_i^2 - 1./n_u.^2)) * 1e9; % Wavelengths in nm

%% Display transitions
fprintf('\nBalmer Series Transitions (n_i = 2):\n');
fprintf('n_u → n_i\tλ (nm)\t\tΔE (eV)\n');
for i = 1:length(n_u)
    deltaE = En(n_u(i)) - En(n_i);
    fprintf('%d → %d\t\t%.1f\t\t%.2f\n', n_u(i), n_i, lambda(i), deltaE);
end