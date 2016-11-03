%% Project 2, Part 1
% Parameter Calculation File for Part 1
% Run this file before simulation
clc; clear;

%% Load Parameters for Studied Induction Machine Model
Proj2_IM_parameters;

%% Initial Value for Integrators
% under all Zero Condition

% For dq model
T_L_0    = 0;
w_mech_0 = 0;
fl_sd_0  = 0;
fl_sq_0  = 0;
fl_rd_0  = eps; % For Integrator; This would cause a little difference in Ir
fl_rq_0  = 0;
theta_da_0 = 0;
theta_dA_0 = 0;

% For ABC model
Va_0 = 0; Vb_0 = 0; Vc_0 = 0;
Ia_0 = 0; Ib_0 = 0; Ic_0 = 0;
IA_0 = 0; IB_0 = 0; IC_0 = 0;
theta_Aa_0 = 0;

disp('Initial Conditions for Part 1, Project 2, have been loaded.')
