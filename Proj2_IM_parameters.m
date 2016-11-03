%% Parameters for Studied Induction Machine Model

j = sqrt(-1);

f_rated = 60;         % Rated Frequency; Unit: Hz
w_syn = 2*pi*f_rated; % Synchronous Electrical Rotation Speed; Unit: rad/s

V_ll_rated = 575;     % Rated Line Voltage; RMS Value; Unit: V

p = 6;                % # of Poles

s = 0.01;             % Slip at rated (full) load
w_mech_rated = (1-s)*w_syn/(p/2); % Rotor Rotation Speed at rated (full) load

J_eq = 75;            % Moment of Inertia; Unit: kg*m^2

R_s = 1.4*10^-3;      % Subscript s For stator; Unit: Ohm
R_r = 0.991*10^-3;    % Subscript r For rotor;  Unit: Ohm

X_ls = 34*10^-3;      % Subscript l For leakage; Unit: Ohm
X_lr = 31*10^-3;
X_m  = 576*10^-3;     % Subscript m For magnetizing; Unit: Ohm

L_ls = X_ls/w_syn;    % Unit: H
L_lr = X_lr/w_syn;
L_m  = X_m /w_syn;
L_s  = L_ls+L_m;
L_r  = L_lr+L_m;

tau_r = L_r/R_r;           % Time Constant referring to Rotor Winding
sigma = 1-L_m^2/(L_s*L_r); % Leakage Factor

% Calculate Rated Phase Voltage and Current; RMS Value
V_a_rated = V_ll_rated/sqrt(3);     % Phase Voltage for Phase a; RMS Value
I_a_rated = V_a_rated / (R_s + j*X_ls + 1/(1/(j*X_m)+1/(j*X_lr+R_r/s)));    % RMS Value
I_A_rated = (V_a_rated - I_a_rated * (R_s + j*X_ls)) / (j*X_m) - I_a_rated; % RMS Value

% Calculate Rated Electromagnetic Torque
% the electromagnetic torque in steady state under rated conditions
T_em_rated= 3*p/2*L_m*(...          % Rated Electromagnetic Torque; Unit: N*m
    imag(I_a_rated)*real(I_A_rated) - real(I_a_rated)*imag(I_A_rated)); 

T_L_rated = T_em_rated;  % Rated Load Torque; Unit N*m


disp('Parameters for Actual Motor Model have been loaded');
