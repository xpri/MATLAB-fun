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
P_R3 = (I(2) - I_source1)^2 * R3;
P_R4 = I(4)^2 * R4;
P_R5 = (I(4) - I(2))^2 * R5;
P_R6 = (I(5) - I(4))^2 * R6;
P_R7 = (I(2) - I(5))^2 * R7;
P_R8 = (I(2)-I(3))^2 * R8;
P_R9 = I(3)^2 * R9;

%Calculate values for current across each resistor
I_RL = (I(1) - I(3));
I_R1 = I(1);
I_R2 = (I(2) - I(1));
I_R3 = (I_source1 - I(2));
I_R4 = -I(4);
I_R5 = (I(2) - I(4));
I_R6 = (I(5) - I(4));
I_R7 = (I(5) - I(2));
I_R8 = (I(2)-I(3));
I_R9 = -I(3);

% Calculate values for voltage across each resistor\
V_RL = (I(1) - I(3)) * R_Load;
V_R1 = I(1) * R1;
V_R2 = (I(2) - I(1)) * R2;
V_R3 = (I_source1 - I(2)) * R3;
V_R4 = -I(4) * R4;
V_R5 = (I(2) - I(4)) * R5;
V_R6 = (I(5) - I(4)) * R6;
V_R7 = (I(5) - I(2)) * R7;
V_R8 = (I(2)-I(3)) * R8;
V_R9 = -I(3) * R9;

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

% Displace calculated current values for each resistor
fprintf('Current:\n')
fprintf('Current across RL: %.2f A\n', I_RL);
fprintf('Current across R1: %.2f A\n', I_R1);
fprintf('Current across R2: %.2f A\n', I_R2);
fprintf('Current across R3: %.2f A\n', I_R3);
fprintf('Current across R4: %.2f A\n', I_R4);
fprintf('Current across R5: %.2f A\n', I_R5);
fprintf('Current across R6: %.2f A\n', I_R6);
fprintf('Current across R7: %.2f A\n', I_R7);
fprintf('Current across R8: %.2f A\n', I_R8);
fprintf('Current across R9: %.2f A\n', I_R9);

% Displace calculated voltage values for each resistor
fprintf('Voltage:\n')
fprintf('Voltage across RL: %.2f V\n', V_RL);
fprintf('Voltage across R1: %.2f V\n', V_R1);
fprintf('Voltage across R2: %.2f V\n', V_R2);
fprintf('Voltage across R3: %.2f V\n', V_R3);
fprintf('Voltage across R4: %.2f V\n', V_R4);
fprintf('Voltage across R5: %.2f V\n', V_R5);
fprintf('Voltage across R6: %.2f V\n', V_R6);
fprintf('Voltage across R7: %.2f V\n', V_R7);
fprintf('Voltage across R8: %.2f V\n', V_R8);
fprintf('Voltage across R9: %.2f V\n', V_R9);

% Starting superposition
clear V_R1 V_R2 V_R3 V_R4 V_R5 V_R6 V_R7 V_8 V_9 V_RL
% clear 

% For superposition keep the same R matrix but manipulate the V(source) matrix

% For case 1 (where everything is turned off except V_source1)

V_case1 = [V_source1; 0 - V_source1; 0; 0; 0];
[I_case1] = R_inv * V_case1;

V_case2 = [0; 0; 0 - V_source2; 0; 0];
[I_case2] = R_inv * V_case2;

V_case3 = [0; 0; V_source3; 0; -V_source3];
[I_case3] = R_inv * V_case3;

V_case4 = [0; V_source4; 0; 0; 0];
[I_case4] = R_inv * V_case4;

[I_tot] = I_case1 + I_case2 + I_case3 + I_case4;

% Now to get current across each resistor
I_tot_RL = (I_tot(1) - I_tot(3));
I_tot_R1 = I_tot(1);
I_tot_R2 = (I_tot(2) - I_tot(1));
I_tot_R3 = (I_source1 - I_tot(2));
I_tot_R4 = -I_tot(4);
I_tot_R5 = (I_tot(2) - I_tot(4));
I_tot_R6 = (I_tot(5) - I_tot(4));
I_tot_R7 = (I_tot(5) - I_tot(2));
I_tot_R8 = (I_tot(2) - I_tot(3));
I_tot_R9 = -I_tot(3);

% Now to get voltage across each resI_totstor
V_tot_RL = (I_tot(1) - I_tot(3)) * R_Load;
V_tot_R1 = I_tot(1) * R1;
V_tot_R2 = (I_tot(2) - I_tot(1)) * R2;
V_tot_R3 = (I_source1 - I_tot(2)) * R3;
V_tot_R4 = -I_tot(4) * R4;
V_tot_R5 = (I_tot(2) - I_tot(4)) * R5;
V_tot_R6 = (I_tot(5) - I_tot(4)) * R6;
V_tot_R7 = (I_tot(5) - I_tot(2)) * R7;
V_tot_R8 = (I_tot(2) - I_tot(3)) * R8;
V_tot_R9 = -I_tot(3) * R9;

% Displace calculated current values for each resistor
fprintf('Current:\n')
fprintf('Current across RL: %.2f A\n', I_tot_RL);
fprintf('Current across R1: %.2f A\n', I_tot_R1);
fprintf('Current across R2: %.2f A\n', I_tot_R2);
fprintf('Current across R3: %.2f A\n', I_tot_R3);
fprintf('Current across R4: %.2f A\n', I_tot_R4);
fprintf('Current across R5: %.2f A\n', I_tot_R5);
fprintf('Current across R6: %.2f A\n', I_tot_R6);
fprintf('Current across R7: %.2f A\n', I_tot_R7);
fprintf('Current across R8: %.2f A\n', I_tot_R8);
fprintf('Current across R9: %.2f A\n', I_tot_R9);

% Displace calculated voltage values for each resistor
fprintf('Voltage:\n')
fprintf('Voltage across RL: %.2f V\n', V_tot_RL);
fprintf('Voltage across R1: %.2f V\n', V_tot_R1);
fprintf('Voltage across R2: %.2f V\n', V_tot_R2);
fprintf('Voltage across R3: %.2f V\n', V_tot_R3);
fprintf('Voltage across R4: %.2f V\n', V_tot_R4);
fprintf('Voltage across R5: %.2f V\n', V_tot_R5);
fprintf('Voltage across R6: %.2f V\n', V_tot_R6);
fprintf('Voltage across R7: %.2f V\n', V_tot_R7);
fprintf('Voltage across R8: %.2f V\n', V_tot_R8);
fprintf('Voltage across R9: %.2f V\n', V_tot_R9);