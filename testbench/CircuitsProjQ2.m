clear
clc

% Initializing all resisters and voltage/current sources

R1 = 5; R2 = 2; R3 = 2; R4 = 4; R5 = 1; R6 = 3; R7 = 1; R8 = 4; R9 = 3;
R_Load = 2;

I_source1 = 5;

V_source1 = 4;

V_source2 = 12;

V_source3 = 6;

% Now starting calculation for mesh
% We NEED all sources to be voltage sources

% Convert current source to equivalent voltage source
V_source4 = I_source1 * R3;

% Makeing voltage vector into a single 5x1 vector (5 loops)

V = [V_source1; V_source4 - V_source1; V_source3 - V_source2; 0; -V_source3];

% Now onto the dreaded R matrix

R_loop1 = [R1 + R2 + R_Load, -R2, -R_Load, 0, 0];
R_loop2 = [-R2, R2 + R3 + R5 + R7 + R8, -R8, -R5, -R7];
R_loop3 = [-R_Load, -R8, R_Load + R9 + R8, 0, 0];
R_loop4 = [0, -R5, 0, R4 + R5 + R6, -R6];
R_loop5 = [0, -R7, 0, -R6, R7 + R6];

R = [R_loop1; R_loop2; R_loop3; R_loop4; R_loop5];

% Now we do V = I*R and solve for I => (R^-1)*V (5x5 5x1)

R_inv = R^(-1);

[I] = R_inv * V;

% Calculate values for power across each resistor
P_RL = (I(1) - I(3))^2 * R_Load;
P_R1 = I(1)^2 * R1;
P_R2 = (I(2) - I(1))^2 * R2;
P_R3 = I(2)^2 * R3;
P_R4 = I(4)^2 * R4;
P_R5 = (I(4) - I(2))^2* R5;
P_R6 = (I(5) - I(4))^2* R6;
P_R7 = (I(2) - I(5))^2* R7;
P_R8 = (I(2)-I(3))^2* R8;        % Need help on this
P_R9 = I(3)^2 * R9;

% Display calculated power values for each resistor
fprintf('Power across RL: %.2f W\n', P_RL);
fprintf('Power across R1: %.2f W\n', P_R1);
fprintf('Power across R2: %.2f W\n', P_R2);
fprintf('Power across R3: %.2f W\n', P_R3);
fprintf('Power across R4: %.2f W\n', P_R4);
fprintf('Power across R5: %.2f W\n', P_R5);
fprintf('Power across R6: %.2f W\n', P_R6);
fprintf('Power across R7: %.2f W\n', P_R7);
fprintf('Power across R8: %.2f W\n', P_R8);
fprintf('Power across R9: %.2f W\n', P_R9);