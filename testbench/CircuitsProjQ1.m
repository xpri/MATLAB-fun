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

V_loop3 = V4 - V1;

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
G = [1/(R1+R2) + 1/R6, -1/(R1+R2), 0, -1/R6, -1/R7; 
     -1/(R1+R2), 1/(R1+R2) + 1/(R3+R4) + 1/RL, -1/(R3+R4), -1/RL, 0; 
     0, -1/(R3+R4), 1/(R3+R4) + 1/R5 + 1/(R9+R10), -1/R5, -1/(R9+R10); 
     -1/R6, -1/RL, -1/R5, 1/R6 + 1/RL + 1/R8 + 1/R5, -1/R8; 
     -1/R7, 0, -1/(R9 + R10), -1/R8, 1/(R9 + R10) + 1/R8 + 1/R7];

% with R1 & R2 in parallel
% G = [1/R1 + 1/R2 + 1/R6, -1/R1, 0, -1/R6, -1/R7; 
%      -1/R1, 1/R1 + 1/R3 + 1/R4 + 1/RL, -1/R3, -1/RL, 0; 
%      0, -1/R3, 1/R3 + 1/R5 + 1/R9 + 1/R10, -1/R5, -1/(R9 + R10); 
%      -1/R6, -1/RL, -1/R5, 1/R6 + 1/RL + 1/R8 + 1/R5, -1/R8; 
%      -1/R7, 0, -1/(R9 + R10), -1/R8, 1/(R9 + R10) + 1/R8 + 1/R7];


% Solving for V
G_inverse = G^(-1);

[V] = G_inverse * I;

% P = V^2/R
P_RL = (V(2) - V(4))^2/ RL;
P_R1 = [(V(1)-V(2))*(R1/(R1+R2))]^2 / R1;
P_R2 = [(V(1)-V(2))*(R2/(R1+R2))]^2 / R2;
% P_R3 = / R3
% P_R4 = / R4
P_R5 = (V(4) - V(3))^2 / R5;
P_R6 = (V(1) - V(4))^2/ R6;
P_R7 = (V(1) - V(5))^2/ R7;
P_R8 = (V(4) - V(5))^2 / R8;
P_R9 = V(3)^2 / R9;
P_R10 = V(5)^2 / R10;

fprintf('Power across RL: %.2f W\n', P_RL);
fprintf('Power across R1: %.2f W\n', P_R1);
fprintf('Power across R2: %.2f W\n', P_R2);
% fprintf('Power across R3: %.2f W\n', P_R3);
% fprintf('Power across R4: %.2f W\n', P_R4);
fprintf('Power across R5: %.2f W\n', P_R5);
fprintf('Power across R6: %.2f W\n', P_R6);
fprintf('Power across R7: %.2f W\n', P_R7);
fprintf('Power across R8: %.2f W\n', P_R8);
fprintf('Power across R9: %.2f W\n', P_R9);
fprintf('Power across R10: %.2f W\n', P_R10);



% G=[ 1/R12+1/R6+1/R7 ,-(1/R12) ,0 ,-1/R6 ,-1/R7 ;-(1/R12) ,1/R12 + 1/R34 + 1/Rl ,-(1/R34) ,-1/Rl ,0 ;0 ,-(1/R34), 1/R34 + 1/R5 + 1/R910, -1/R5, -1/(R910); -1/R6, -1/Rl, -1/R5, (1/R6 + 1/Rl + 1/R8 + 1/R5), -1/R8; -1/R7, 0, -1/(R910), -1/R8, 1/(R910) + 1/R8 + 1/R7 ]
% 
% 
% Gt=[ 1/((1/((1/r1)+(1/r2)))+r6+r7) ,-1/(1/((1/r1)+(1/r2))) ,0 ,-1/r6 ,-1/r7 ;-1/(1/((1/r1)+(1/r2))) ,1/( (1/((1/r1)+(1/r2)))+(1/(1/(r3)+1/(r4)))+rl) ,-1/(1/(1/(r3)+1/(r4))) ,-1/rl ,0 ;0 ,-1/(1/(1/(r3)+1/(r4))), 1/((1/(1/(r3)+1/(r4)))+r5+r9+r10), -1/r5, -1/(r9+r10); -1/r6, -1/rl, -1/r5, 1/(r6+rl+r8+r5), -1/r8; -1/r7, 0, -1/(r9+r10), -1/r8, 1/(r10+r9+r8+r7) ];
% 
% 
% I=[i1;i2;i3;i4;i5]
% 
% Gi=pinv(G)
% 
% Vdone=Gi*I
% 
% Vexp=Gi;
% 
% 
% Vn=Vdone;
% 
% "Nodal=P=(V^2)/R";
% 
% 
% v1=(Vn(1));
% 
% v2=(Vn(2));
% 
% v3=(Vn(3));
% 
% v4=(Vn(4));
% 
% v5=(Vn(5));
% 
% 
% pl=(v2-v4)^2 / Rl;
% 
% p1=((v2-v1)^2 * r1)/((r1+r2)^2);
% 
% p2=(v1-v2)^2 / r2;
% 
% p3=(v3-v2)^2 / r3;
% 
% p4=(v3-v2)^2 / r4;
% 
% p5=(v3-v4)^2 / r5;
% 
% p6=((v4-v1)^2)/r6;
% 
% p7=(v1-v5)^2 / r7;
% 
% p8=(v4-v5)^2 / r8;
% 
% p9=(v3-v5)^2 / r9;
% 
% p10=(v3-v5)^2 / r10;
% 
% 
% Pn=[pl,0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10];
% 
% 
% 
% 
% Pm
% 
% Pn
% 
% 
% 
% target=0.3139
% 
% got=p1
% 
% v1-v2
% 
% vdiff1=sqrt((target*(((r1+r2)^2)/r1)))
% 
% p1=((vdiff1)^2 * r1)/((r1+r2)^2)
% 
% 
% 'so Load, 5, and 8 are good?'