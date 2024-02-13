% Startup file for Simulink Aerosonde model

clearvars;

%%% Initial Conditions %%%

x0     = [0, 0, -200];    %[m] - [pn pe pd]
theta0 = [0, 0, 0];       %[rad] - [roll pitch yaw]
v0     = [25, 0, 0];      %[m/s] - [u v w]
w0     = [0, 0, 0];       %[rad/s] - [p q r]

%%% Airframe Parameters %%%


% Physical Parameters %

g    = 9.81;             %[m/s^2]
mass = 11.0;             % [kg]
Jx   = 0.824;            % [kg-m^2]
Jy   = 1.135;            % [kg-m^2]
Jz   = 1.759;            % [kg-m^2]
Jxz  = 0.120;            % [kg-m^2]

I = [Jx,  0, -Jxz;
      0,  Jy,  0;
    -Jxz, 0,  Jz];

S_wing        = 0.55;    % [m^2]
b             = 2.90;    % [m]
c             = 0.19;    % [m]
S_prop        = 0.2027;  % [m^2]
rho           = 1.2682;  % [kg/m^3]
e             = 0.9;


% Aerodynamic Coefficients %

M             = 50;
alpha0        = 0.47;
epsilon       = 0.16;
C_D_p         = 0.0;

% Init Derivatives

C_L_0         = 0.23;
C_D_0         = 0.043;
C_m_0         = 0.0135;

C_Y_0         = 0.0;
C_ell_0       = 0.0;
C_n_0         = 0.0;

% Air Derivatives 

C_L_alpha     = 5.61;
C_D_alpha     = 0.030;
C_m_alpha     = -2.74;

C_Y_beta      = -0.98;
C_ell_beta    = -0.13;
C_n_beta      = 0.073;

% Actuator Deflection Derivatives

C_L_delta_e   = 0.13;
C_D_delta_e   = 0.0135;
C_m_delta_e   = -0.99;

C_Y_delta_a   = 0.075;
C_ell_delta_a = 0.17;
C_n_delta_a   = -0.011;

C_Y_delta_r   = 0.19;
C_ell_delta_r = 0.0024;
C_n_delta_r   = -0.069;

% Damping Derivatives

C_Y_p         = 0.0;
C_ell_p       = -0.51;
C_n_p         = -0.069;

C_L_q         = 7.95;
C_D_q         = 0.0;
C_m_q         = -38.21;

C_Y_r         = 0.0;
C_ell_r       = 0.25;
C_n_r         = -0.095;


% Motor Parameters %

D_prop = 0.508;            % [m]
KV = 0.0659;               % [V-s/rad]
KQ = 0.0659;               % [N-m]
R_motor = 0.042;           % [ohms]
i0 = 1.5;                  % [A]

ncells = 12;               % [-]
V_max = 3.7*ncells;        % [V]

% Coefficients from prop

C_Q2 = -0.01664;  % [-]
C_Q1 = 0.004970;  % [-]
C_Q0 = 0.005230;  % [-]

C_T2 = -0.1079;   % [-]
C_T1 = -0.06044;  % [-]
C_T0 = 0.09357;   % [-]
