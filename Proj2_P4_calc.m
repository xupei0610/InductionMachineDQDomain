%% Project 2, Part 4
% Parameter Calculation File for Part 4
% This file assumes that
%   All the parameters for Voltage Compensation and Controllers are based 
% on estimated parameters.
%
% Run this file before simulation
clc; clear;
j = sqrt(-1);

%% Load Parameters for Studied Induction Machine Model
Proj2_IM_parameters;

%% Load Initial Values for Actual Motor Model
Proj2_IM_IC_rated;

%% Parameters and Initial Values for Estimated Motor Model, Scheme 1
% under Rated Condition
% Scheme 1, the estimated motor is the same to the actual motor

% Nothing need to do

disp('Parameters and Initial Conditions for Estimated Motor Model Scheme 1 have been loaded.')

%% Parameters and Initial Values for Estimated Motor Model, Scheme 2
% under Rated Condition
% Scheme 2, the estimated Rotor Resistance is the half of the actual value
Proj2_P4_S2;

%% Parameters and Initial Values for Estimated Motor Model, Scheme 3
% under Rated Condition
% Scheme 3, the estimated Rotor Leakage is 2 times the actual value
Proj2_P4_S3;
