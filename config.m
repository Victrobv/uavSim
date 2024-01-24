% Config.m file for Simulink Aerosonde model

clearvars;

%%% Airframe Parameters %%%

% Physical Parameters

mass = 11;   % [kg]

Jx = 0.824;  % [kg-m^2]
Jy = 1.135;  % [kg-m^2]
Jz = 1.759;  % [kg-m^2]
Jxz = 0.120; % [kg-m^2]

I = [Jx 0 -Jxz; 
    0 Jy 0; 
    -Jxz 0 Jz]; % [kg-m^2]

S = 0.55;    % [m^2]
b = 2.9;     % [m]
c = 0.19;    % [m]
p = 1.268;   % [kg/m^3]
e = 0.9;

% Motor Parameters

V_max   = 44.4;       % [V]
D       = 0.508;      % [m] 
K_V     = 0.0659;     % [V-s/rad]
K_Q     = 0.0659;     % [N-m]
R_motor = 0.042;      % [ohm]
i_0     = 1.5;        % [A]
C_q2    = -0.01664;   % [-]
C_q1    =  0.00497;   % [-]
C_q0    =  0.005230;  % [-]
C_Q     = [C_q2, C_q1, C_q0];
C_t2    = -0.1079;    % [-]
C_t1    = -0.06044;   % [-]
C_t0    =  0.09357;   % [-] 
C_T     = [C_t2, C_t1, C_t0];

% Lat Coefs

C_Y = [0, -0.83, 0, 0, 0.075, 0.19]';
C_l = [0 , -0.13, -0.51, 0.25, 0.17, 0.0024]';
C_n = [0, 0.073, -0.069, -0.095, -0.011, -0.069]';

% legend: [0, beta, p, r, detla_a, delta_r]


% Long Coefs

C_L = [0.23, 5.61, 7.95, 0.13]';
C_D = [0.043, 0.030, 0, 0.0135]';
C_m = [0.0135, -2.74, -38.21, -0.99]';

% legend: [0, alpha, q, delta_e]

M = 50;
alpha_0 = 0.47;
epsilon = 0.16;
C_Dp = 0;

%%% Initial Conditions %%%

x_0     = [0 0 0];    %[m]
theta_0 = [0 0 0];    %[rad] - [roll pitch yaw]
v_0     = [10 0 0];    %[m/s]
w_0     = [0 0 0];    %[rad/s] - [p q r]

%%% Run Model %%%

open('uav_control.slx')
%sim('uav_control.slx')
% output_signal = yout.getElement('signal_name');
% time = output_signal.Values.Time;
% signal = output_signal.Values.Data(row, column);


% To Workspace - out data
% From Workspace - input data from named variable
