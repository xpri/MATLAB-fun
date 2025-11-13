% Energy levels in eV
n = [1 2 3 4];
E = [7.49, 29.97, 67.4, 119.8];

% Create the plot
figure;
hold on;
for i = 1:length(n)
    % Draw horizontal line for each energy level
    plot([0.9 1.1], [E(i) E(i)], 'b', 'LineWidth', 2);
    % Add text label
    text(1.12, E(i), sprintf('n = %d\\n%.2f eV', n(i), E(i)), 'VerticalAlignment', 'middle');
end

% Formatting
xlim([0.8 1.5]);
ylim([0 130]);
set(gca, 'XTick', []);
ylabel('Energy (eV)');
title('Energy Levels of an Electron in a 1D Box (L = 0.562 nm)');
grid on;

hold off;
