%%% This file is an example of how to use GPELab (FFT version)
%% Ground state of a Gross-Pitaevskii equation with quadratic potential and cubic nonlinearity in 1D


clear all;
addpath(genpath(pwd));
params_filename = 'gpe_params.csv';
params = readtable(params_filename).(2);
%-----------------------------------------------------------
% Setting the data
%-----------------------------------------------------------

%% Setting the method and geometry
Computation = 'Ground';
Ncomponents = 1;
Type = 'BESP';

Deltat = 1e-2;
Stop_time = [];
Stop_crit = {'Energy',1e-12};
Method = Method_Var1d(Computation, Ncomponents, Type, Deltat, Stop_time, Stop_crit);
%xmin = -16;
%xmax = 16;
%Nx = 2^10+1;
xmin = params(2);
xmax = params(3);
Nx = params(4);
Geometry1D = Geometry1D_Var1d(xmin,xmax,Nx);

%% Setting the physical problem
Delta = 0.5;
Beta = params(5);
%Beta = 250;
Physics1D = Physics1D_Var1d(Method, Delta, Beta);
Physics1D = Dispersion_Var1d(Method, Physics1D);
Physics1D = Potential_Var1d(Method, Physics1D, @potential1d);
Physics1D = Nonlinearity_Var1d(Method, Physics1D);

%% Setting the initial data
InitialData_Choice = 2;
Phi_0 = InitialData_Var1d(Method, Geometry1D, Physics1D, InitialData_Choice);

%% Setting informations and outputs
save = 0;
Outputs = OutputsINI_Var1d(Method, save);
Printing = 0;
Evo = 15;
Draw = 0;
Print = Print_Var1d(Printing,Evo,Draw);

%-----------------------------------------------------------
% Launching simulation
%-----------------------------------------------------------
[Phi, Outputs] = GPELab1d(Phi_0,Method,Geometry1D,Physics1D,Outputs,[],Print);
writecell(Phi, 'phi.csv')
%% 