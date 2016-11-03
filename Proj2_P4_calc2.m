%% Project 2, Part 4
% Parameter Calculation File for Part 4
% This file is same to Proj2_P4_calc.m
% EXCEPT FOR that
%    This file assumes that
%      all Initial Values are based on Actual Parameters;
%      all Parameters for Controllers are based on Actual parameters.
%
% Run this file before simulation
clc; clear;

%% Load Parameters for Studied Induction Machine Model
Proj2_IM_parameters;

%% Load Initial Values for Actual Motor Model
Proj2_IM_IC_rated;

%% Load Parameters for Estimated Motor Model
Proj2_P4_S2;

% Load Accurate Initial Values
% For Estimated Motor Model
fl_rd_0_est2 = fl_rd_0;             % Initial Value
theta_da_0_est2 = theta_da_0;       % Initial Value
% For Voltage Compensation Model
Vsd_prime_0_est2 = Vsd_prime_0;     % Initial Value
Vsq_prime_0_est2 = Vsq_prime_0;     % Initial Value
% For Controllers
Isq_0_est2 = Isq_0;                 % Initial Value
% Load Accurate Controllers
Isd_rated_est2  = Isd_rated;        % Reference Value
Ki_s_est2 = Ki_s;                   % Parameter
Kp_s_est2 = Kp_s;                   % Parameter

Proj2_P4_S3;
% Load Accurate Initial Values
% For Estimated Motor Model
fl_rd_0_est3 = fl_rd_0;             % Initial Value
theta_da_0_est3 = theta_da_0;       % Initial Value
% For Voltage Compensation Model
Vsd_prime_0_est3 = Vsd_prime_0;     % Initial Value
Vsq_prime_0_est3 = Vsq_prime_0;     % Initial Value
% For Controllers
Isq_0_est3 = Isq_0;                 % Initial Value
% Load Accurate Controllers
Isd_rated_est3  = Isd_rated;        % Reference Value
Ki_s_est3 = Ki_s;                   % Parameter
Kp_s_est3 = Kp_s;                   % Parameter
Ki_i_est3 = Ki_i;                   % Parameter
Kp_i_est3 = Kp_i;                   % Parameter

