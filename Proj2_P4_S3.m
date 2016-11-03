%% Project 2, Part 4
% This file calculates parameters and initial Values under Rated Condition 
%   for Estimated Motor, Voltage Compensation and Controller Model
%   in Scheme 3.
%
% Scheme 3, the estimated Rotor Leakage is 2 times the actual value
%
% Run this file after Proj2_IM_IC_rated.m

j = sqrt(-1);

%% Inaccurate Paramters
L_lr_est3 = 2*L_lr;
X_lr_est3 = 2*X_lr;

L_r_est3 = L_lr_est3 + L_m;
tau_r_est3 = L_r_est3/R_r;
sigma_est3 = 1-L_m^2/(L_s*L_r_est3);

%% Calculate Rated Value According to the Inaccurate Parameters
I_a_rated_est3 = V_a_rated / (R_s + j*X_ls + 1/(1/(j*X_m)+1/(j*X_lr_est3+R_r/s)));    % RMS Value
I_A_rated_est3 = (V_a_rated - I_a_rated_est3 * (R_s + j*X_ls)) / (j*X_m) - I_a_rated_est3; % RMS Value
% Calculate Initial Conditions (Rated Steady State) using the estimated parameters
%
% d-axis is aligned to a-axis
Isd_rated_a_est3 = sqrt(3)*real(I_a_rated_est3);
Isq_rated_a_est3 = sqrt(3)*imag(I_a_rated_est3);
Ird_rated_a_est3 = sqrt(3)*real(I_A_rated_est3);
Irq_rated_a_est3 = sqrt(3)*imag(I_A_rated_est3);
fl_rd_rated_a_est3 = L_m*Isd_rated_a_est3 + L_r*Ird_rated_a_est3;
fl_rq_rated_a_est3 = L_m*Isq_rated_a_est3 + L_r*Irq_rated_a_est3;
theta_fl_rated_a_est3 = atan2(fl_rq_rated_a_est3, fl_rd_rated_a_est3);
% Align d-axis to Rotor Flux from a-axis
Is_rated_est3 = (Isd_rated_a_est3 + j*Isq_rated_a_est3) * exp(j*(-theta_fl_rated_a_est3));
Isd_rated_est3 = real(Is_rated_est3);
Isq_rated_est3 = imag(Is_rated_est3);
fl_rd_rated = sqrt(fl_rd_rated_a_est3^2 + fl_rq_rated_a_est3^2);
% Assign Values
theta_da_0_est3 = theta_fl_rated_a_est3;
fl_rd_0_est3    = fl_rd_rated;
Isd_0_est3      = Isd_rated_est3;
Isq_0_est3      = Isq_rated_est3;

%% Parameters for Controllers, Scheme 3
% Calculation based on the estimated motor parameters

% Speed Controller
k_est3 = (p/2) * (L_m^2/L_r) * Isd_rated_est3;
Ki_s_est3 = w_c_s^2*J_eq/(k_est3*sqrt(1+tan(PM_s)^2));
Kp_s_est3 = Ki_s_est3 * wc_Kp_by_Ki_for_s / w_c_s;

% Current Controller
wc_Kp_by_Ki_for_i_est3 = tan(PM_i-pi/2+atan(w_c_i*L_s*sigma_est3/R_s));
Ki_i_est3 = w_c_i*sqrt(R_s^2+(w_c_i*L_s*sigma_est3)^2) / sqrt(1+wc_Kp_by_Ki_for_i_est3^2);
Kp_i_est3 = Ki_i_est3 * wc_Kp_by_Ki_for_i_est3 / w_c_i;

% Initial Value for Integrators, i.e. Vsdq without compensation
d_fl_rd_0_by_dt_est3 = L_m*Isd_0_est3-fl_rd_0_est3/tau_r_est3;
Vsd_prime_0_est3 = Vsd_0 - L_m/L_r_est3*d_fl_rd_0_by_dt_est3 + w_syn*sigma_est3*L_s*Isq_0_est3;
Vsq_prime_0_est3 = Vsq_0 - w_syn*(L_m/L_r_est3)*fl_rd_0_est3 - w_syn*sigma_est3*L_s*Isd_0_est3;

disp('Parameters and Initial Conditions for Estimated Motor Model Scheme 3 have been loaded.')
