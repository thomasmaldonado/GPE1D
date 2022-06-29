function [v] = potential1d(X)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    params_filename = 'gpe_params.csv';
    params = readtable(params_filename).(2);
    xmin = params(2);
    xmax = params(3);
    Nx = params(4);
    potential_arr = params(6:end);
    potential_x = linspace(xmin, xmax, Nx);
    v = zeros(length(X), 1);
    for i = 1:(Nx-1)
        v = v + potential_arr(i) * (potential_x(i) <= X & X < potential_x(i+1));
    end
    %v = -10 * ((X >= -8 & X <= -0.3) | (X <= 8 & X >= 0.3));
end