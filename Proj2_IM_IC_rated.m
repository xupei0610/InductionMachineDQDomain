%% Initial Values for Actual Motor Model
% under Rated Condition
% run Proj2_IM_parameters.m firstly
j = sqrt(-1);

% Voltage, Current and Flux in dq Model under Rated Steady State where d-axis is aligned to a-axis
Vsd_rated_a = V_ll_rated;
Vsq_rated_a = 0;
Isd_rated_a = sqrt(3)*real(I_a_rated);
Isq_rated_a = sqrt(3)*imag(I_a_rated);
Ird_rated_a = sqrt(3)*real(I_A_rated);
Irq_rated_a = sqrt(3)*imag(I_A_rated);
fl_sd_rated_a = L_s*Isd_rated_a + L_m*Ird_rated_a;
fl_sq_rated_a = L_s*Isq_rated_a + L_m*Irq_rated_a;
fl_rd_rated_a = L_m*Isd_rated_a + L_r*Ird_rated_a;
fl_rq_rated_a = L_m*Isq_rated_a + L_r*Irq_rated_a;
theta_fl_rated_a = atan2(fl_rq_rated_a, fl_rd_rated_a);

% Align d-axis to Rotor Flux from a-axis

Vs_rated = (Vsd_rated_a + j*Vsq_rated_a) * exp(j*(-theta_fl_rated_a));
Is_rated = (Isd_rated_a + j*Isq_rated_a) * exp(j*(-theta_fl_rated_a));
fl_s_rated = (fl_sd_rated_a + j*fl_sq_rated_a) * exp(j*(-theta_fl_rated_a));
%fl_r_rated = (fl_rd_rated_a + j*fl_rq_rated_a) * exp(j*(-theta_r_rated));
Vsd_rated = real(Vs_rated);
Vsq_rated = imag(Vs_rated);
Isd_rated = real(Is_rated);
Isq_rated = imag(Is_rated);
fl_sd_rated = real(fl_s_rated);
fl_sq_rated = imag(fl_s_rated);
%fl_rd_rated = real(fl_r_rated);
%fl_rq_rated = imag(fl_r_rated);
fl_rd_rated = sqrt(fl_rd_rated_a^2 + fl_rq_rated_a^2);
fl_rq_rated = 0;

% Set Initial Values while the Initial State is also Rated Steady State
T_L_0    = T_L_rated;
w_mech_0 = w_mech_rated;
Vsd_0    = Vsd_rated;
Vsq_0    = Vsq_rated;
Isd_0    = Isd_rated;
Isq_0    = Isq_rated;
fl_sd_0  = fl_sd_rated;
fl_sq_0  = fl_sq_rated;
fl_rd_0  = fl_rd_rated;
fl_rq_0  = fl_rq_rated;
theta_da_0 = theta_fl_rated_a;
theta_dA_0 = theta_fl_rated_a; % Assume theta_aA = 0 at time t = 0

disp('Initial Conditions under Rated Steady State for Actual Motor Model have been loaded.')

%% Parameters for Controllers
% Calculation based on Estimated Motor Parameters

% Speed Controller
w_c_s = 25;       % Crossover Frequency, Bandwidth; Unit: rad/s
PM_s = 60*pi/180; % Phase Margin
k = (p/2) * (L_m^2/L_r) * Isd_rated;
wc_Kp_by_Ki_for_s = tan(PM_s);
Ki_s = w_c_s^2*J_eq/(k*sqrt(1+tan(PM_s)^2));
Kp_s = Ki_s * wc_Kp_by_Ki_for_s / w_c_s;

% Current Controller
w_c_i = 250;       % Crossover Frequency, Bandwidth; Unit: rad/s
PM_i  = 60*pi/180; % Phase Margin
wc_Kp_by_Ki_for_i = tan(PM_i-pi/2+atan(w_c_i*L_s*sigma/R_s));
Ki_i = w_c_i*sqrt(R_s^2+(w_c_i*L_s*sigma)^2) / sqrt(1+wc_Kp_by_Ki_for_i^2);
Kp_i = Ki_i * wc_Kp_by_Ki_for_i / w_c_i;
% Initial Value for Integrators used for voltage compensation
d_fl_rd_0_by_dt = L_m*Isd_0-fl_rd_0/tau_r;
Vsd_prime_0 = Vsd_0 - L_m/L_r*d_fl_rd_0_by_dt + w_syn*sigma*L_s*Isq_0;
Vsq_prime_0 = Vsq_0 - w_syn*(L_m/L_r)*fl_rd_0 - w_syn*sigma*L_s*Isd_0;

disp('Parameters for Controllers have been loaded.')