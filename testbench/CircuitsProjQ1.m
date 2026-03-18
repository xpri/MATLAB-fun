clear

clc

fprintf('Starting on MESH analysis on circuits project! \n')

% Initializing all variables used:
syms V I R V1 V2 V3 V4 RL R1 R2 R3 R4 R5 R6 R7 R8 R9 R10;

% Declaring voltages
V1=12; V2=20; V3=14; V4=48;

R1 = 4; R2 = 8; R3 = 4.5; R4 = 10; R5 = 4; R6 = 7; R7 = 12; R8 = 9; R9 = 5;
R10 = 9;

RL = 7;

% Making voltage vector using the loops

V_loop1 = V3 - V1;

V_loop2 = -V2;

V_loop3 = V4 - V3;

V_loop4 = 0;

V = [V_loop1; V_loop2; V_loop3; V_loop4];

R = [R1 + R2 + RL + R6, -RL, -R6, 0; 
     -RL, R3 + R4 + R5 + RL, 0, -R5; 
     -R6, 0, R6 + R8 + R7, -R8; 
     0, -R5, -R8, R5 + R8 + R9 + R10];

% Now we need to do V = I*R and solve for I

R_inv = R^(-1);

[I] = R_inv * V;

fprintf('The power is calculated with P = (I^2) * R \n')

% Calculate values for power across each resistor
P_RL = ((I(1)-I(2))^2) * RL;
P_R1 = ((I(1))^2) * R1;
P_R2 = ((I(1))^2) * R2;
P_R3 = ((I(2))^2) * R3;
P_R4 = I(2)^2 * R4;
P_R5 = (I(2) - I(4))^2 * R5;
P_R6 = (I(3) - I(1))^2 * R6;
P_R7 = I(3)^2 * R7;
P_R8 = (I(4) - I(3))^2* R8;
P_R9 = I(4)^2 * R9;
P_R10 = I(4)^2 * R10;

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
fprintf('Power across R10: %.2f W\n', P_R10);

clear I V % Starting nodal
fprintf('Now onto using nodal analysis! \n');

% Initializing current sources
syms I_source1 I_source2 I_source3 I_source4 I_node1 I_node2 I_node3 I_node4

I_source1 = V1 / (R1 + R2);

I_source2 = V2 / (R3 + R4);

I_source3 = V3 / R6;

I_source4 = V4 / R7;

I_node1 = I_source1 + I_source3 + I_source4;
I_node2 = I_source2 - I_source1;
I_node3 = -I_source2;
I_node4 = -I_source3;
I_node5 = -I_source4;

I = [I_node1; I_node2; I_node3; I_node4 ; I_node5];

% Now starting conductance matrix
G = [1/(R1+R2) + 1/R6 + 1/R7, -1/(R1+R2), 0, -1/R6, -1/R7; 
     -1/(R1+R2), 1/(R1+R2) + 1/(R3+R4) + 1/RL, -1/(R3+R4), -1/RL, 0; 
     0, -1/(R3+R4), 1/(R3+R4) + 1/R5 + 1/(R9), -1/R5, 0; 
     -1/R6, -1/RL, -1/R5, 1/R6 + 1/RL + 1/R8 + 1/R5, -1/R8; 
     -1/R7, 0, 0, -1/R8, 1/R10 + 1/R8 + 1/R7];


% Solving for V
G_inverse = G^(-1);

[V] = G_inverse * I;

% Calculate Power purely using P = V^2 / R and Voltage Division

% RL, R5, and R8 are solitary resistors between nodes, so they are straightforward:
P_RL = (V(2) - V(4))^2 / RL;
P_R5 = (V(4) - V(3))^2 / R5;
P_R8 = (V(4) - V(5))^2 / R8;

% R1 and R2 are in series with V1. 
% Total voltage for the resistors is (V(1) - V(2) - V1). 
% We use a voltage divider to find the voltage strictly across R1, then square it and divide by R1.
P_R1 = ((V(1) - V(2) - V1) * (R1 / (R1 + R2)))^2 / R1;
P_R2 = ((V(1) - V(2) - V1) * (R2 / (R1 + R2)))^2 / R2;

% R3 and R4 are in series with V2.
P_R3 = ((V(2) - V(3) - V2) * (R3 / (R3 + R4)))^2 / R3;
P_R4 = ((V(2) - V(3) - V2) * (R4 / (R3 + R4)))^2 / R4;

% R6 and R7 are solitary resistors, but they share branches with V3 and V4.
% The voltage across the resistor is the node difference minus the source.
P_R6 = (V(1) - V(4) - V3)^2 / R6;
P_R7 = (V(1) - V(5) - V4)^2 / R7;

% R9 and R10 are in series with each other, but have no voltage source.
P_R9  = ((V(3) - V(5)) * (R9 / (R9 + R10)))^2 / R9;
P_R10 = ((V(3) - V(5)) * (R10 / (R9 + R10)))^2 / R10;

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
fprintf('Power across R10: %.2f W\n', P_R10);
