% 1. Generate the discrete time signal
delta_t = 0.05;                 % Time interval in seconds
t = 0:delta_t:5;                % Time vector (simulating for 5 seconds)
y = sin(5*t) + cos(11*t);       % The discrete signal y(t)

% 2. Define the window sizes
window_4 = 4;
window_30 = 30;

% Initialize arrays to store the moving averages
% The output length will be shorter than the input by (window_size - 1)
y_avg_4 = zeros(1, length(y) - window_4 + 1);
y_avg_30 = zeros(1, length(y) - window_30 + 1);

% 3. Algorithm for 4-point moving average
for i = 1:(length(y) - window_4 + 1)
    % Extract the 4-point window
    window_data = y(i : i + window_4 - 1);
    % Calculate the average and store it
    y_avg_4(i) = sum(window_data) / window_4;
end

% 4. Algorithm for 30-point moving average
for i = 1:(length(y) - window_30 + 1)
    % Extract the 30-point window
    window_data = y(i : i + window_30 - 1);
    % Calculate the average and store it
    y_avg_30(i) = sum(window_data) / window_30;
end

% 5. Plot the results to examine the effects
figure;

% Original Signal
subplot(3,1,1);
plot(t, y, 'k.-');
title('Original Signal: y(t) = sin(5t) + cos(11t)');
xlabel('Time (s)'); ylabel('y(t)');
grid on;

% 4-Point Moving Average
% Note: Creating a shifted time vector so the plots align correctly
t_4 = t(window_4 : end); 
subplot(3,1,2);
plot(t_4, y_avg_4, 'b.-');
title('4-Point Moving Average (0.2s Window)');
xlabel('Time (s)'); ylabel('Average');
grid on;

% 30-Point Moving Average
t_30 = t(window_30 : end);
subplot(3,1,3);
plot(t_30, y_avg_30, 'r.-');
title('30-Point Moving Average (1.5s Window)');
xlabel('Time (s)'); ylabel('Average');
grid on;