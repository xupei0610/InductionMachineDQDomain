%% Project 2, Part 4
% This file calculates parameters and initial Values under Rated Condition 
%   for Estimated Motor, Voltage Compensation and Controller Model
%   in Scheme 2.
%
% Scheme 2, the estimated Rotor Resistance is the half of the actual value
% 
% Run this file after Proj2_IM_IC_rated.m

j = sqrt(-1);

%% Inaccurate Paramters
R_r_est2 = R_r/2;
tau_r_est2 = L_r/R_r_est2;

%% Calculate Rated Value According to the Inaccurate Parameters
I_a_rated_est2 = V_a_rated / (R_s + j*X_ls + 1/(1/(j*X_m)+1/(j*X_lr+R_r_est2/s)));    % RMS Value
I_A_rated_est2 = (V_a_rated - I_a_rated_est2 * (R_s + j*X_ls)) / (j*X_m) - I_a_rated_est2; % RMS Value
% Calculate Initial Conditions (Rated Steady State) using the estimated parameters
%
% d-axis is aligned to a-axis
Isd_rated_a_est2 = sqrt(3)*real(I_a_rated_est2);
Isq_rated_a_est2 = sqrt(3)*imag(I_a_rated_est2);
Ird_rated_a_est2 = sqrt(3)*real(I_A_rated_est2);
Irq_rated_a_est2 = sqrt(3)*imag(I_A_rated_est2);
fl_rd_rated_a_est2 = L_m*Isd_rated_a_est2 + L_r*Ird_rated_a_est2;
fl_rq_rated_a_est2 = L_m*Isq_rated_a_est2 + L_r*Irq_rated_a_est2;
theta_fl_rated_a_est2 = atan2(fl_rq_rated_a_est2, fl_rd_rated_a_est2);
% Align d-axis to Rotor Flux from a-axis
Is_rated_est2 = (Isd_rated_a_est2 + j*Isq_rated_a_est2) * exp(j*(-theta_fl_rated_a_est2));
Isd_rated_est2 = real(Is_rated_est2);
Isq_rated_est2 = imag(Is_rated_est2);
fl_rd_rated_est2 = sqrt(fl_rd_rated_a_est2^2 + fl_rq_rated_a_est2^2);
% Assign Values
theta_da_0_est2 = theta_fl_rated_a_est2;
fl_rd_0_est2    = fl_rd_rated_est2;
Isd_0_est2      = Isd_rated_est2;
Isq_0_est2      = Isq_rated_est2;

%% Parameters for Controllers, Scheme 2
% Calculation based on the estimated motor parameters

% Speed Controller
k_est2 = (p/2) * (L_m^2/L_r) * Isd_rated_est2;
Ki_s_est2 = w_c_s^2*J_eq/(k_est2*sqrt(1+tan(PM_s)^2));
Kp_s_est2 = Ki_s_est2 * wc_Kp_by_Ki_for_s / w_c_s;

% Current Controller
% No influence on Current Controller, thereby nothing to do

% Initial Value for Integrators used for voltage compensation
d_fl_rd_0_by_dt_est2 = L_m*Isd_0_est2-fl_rd_0_est2/tau_r_est2;
Vsd_prime_0_est2 = Vsd_0 - L_m/L_r*d_fl_rd_0_by_dt_est2 + w_syn*sigma*L_s*Isq_0_est2;
Vsq_prime_0_est2 = Vsq_0 - w_syn*(L_m/L_r)*fl_rd_0_est2 - w_syn*sigma*L_s*Isd_0_est2;

disp('Parameters and Initial Conditions for Estimated Motor Model Scheme 2 have been loaded.')
