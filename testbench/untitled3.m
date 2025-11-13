g = 9.8;
%theta = 0:0.1:80;
% Define both functions
syms theta;
q1 = 1.2 + 30*tand(theta) - g/2 * secd(theta).^2;
q2 = 1.2 + 30*tand(theta) - g/2 .* (1 + tand(theta).^2);

%plot(theta, q1(theta), 'b', theta, q2(theta), 'r--', theta, zeros(size(theta)), 'k-')
%legend('q1 (secd form)', 'q2 (tand form)', 'q=0')
%xlabel('Theta (degrees)')
%ylabel('q')

ans1 = solve(q1 == 0, theta);
fprintf('The answer using sec is')
cprintf('red',' %.4f\n',ans1)

ans2 = solve(q2 == 0, theta);
fprintf('The answer using tan is')
cprintf('red',' %.4f\n',ans2)