% FILEPATH: /Users/mauro/Library/CloudStorage/OneDrive-ThePennsylvaniaStateUniversity/AERSP 566/simulatiom.m
% This script simulates the motion of a particle in a gravitational field.
% It solves the differential equation using the ode45 function and plots the results.
% The function idk represents the differential equation that describes the motion.
% The script plots the position of the particle over time for different values of delta_u.
% The parameters k, g, G, M, and R are constants used in the calculation.
% The initial conditions x0 and the final time tfin can be adjusted.
% The script also includes documentation comments for the idk function.
% Author: Mauro Patimo

clear, clc
tfin=5;
x0=[0, 0, 10000];
[t, x] = ode45(@(t, x) idk(t, x, 10), [0, tfin], x0);
plot(t, x(:, 1))
hold on
[t, x] = ode45(@(t, x) idk(t, x, 100), [0, tfin], x0);
plot(t, x(:, 1))
hold on
[t, x] = ode45(@(t, x) idk(t, x, 300), [0, tfin], x0);
plot(t, x(:, 1))
xlabel('t')
hold on
[t, x] = ode45(@(t, x) idk2(t, x, 10), [0, tfin], x0);
plot(t, x(:, 1))
hold on
[t, x] = ode45(@(t, x) idk2(t, x, 100), [0, tfin], x0);
plot(t, x(:, 1))
hold on
[t, x] = ode45(@(t, x) idk2(t, x, 300), [0, tfin], x0);
plot(t, x(:, 1))
xlabel('t')
ylabel('x')
title('Altitude of the spacheship over time')
legend('Linear,\Deltau=10','Linear,\Deltau=100','Linear,\Deltau=300','Non-linear,\Deltau=10','Non-linear,\Deltau=100','Non-linear,\Deltau=300')
% Function: idk
% Description: Represents the differential equation that describes the motion of the particle.
% Inputs:
%   - t: Time
%   - x: State vector [position, velocity, mass]
%   - delta_u: Control input
% Outputs:
%   - dxdt: Derivative of the state vector
function dxdt = idk2(t, x, delta_u)
    k = 1000;
    g = 50;
    G = 6.673e-11;
    M = 5.98e24;
    R = 6.37e6;
    dxdt = [0; 0; 0];
    u=(G*M)/(k*R^2)*exp(-G*M*t/(k*R^2))*10000 + delta_u*abs(cos(t));
    u_int = u+delta_u*abs(cos(t));
    dxdt(1) = x(2);
    dxdt(2) = ((2*G*M)*x(1)/R^3)-((g/x(3))*x(2))+(-k*u)/x(3)+k*u_int/x(3);
    dxdt(3) = -u;
end

function dxdt = idk(t, x, delta_u)
    k = 1000;
    g = 50;
    G = 6.673e-11;
    M = 5.98e24;
    R = 6.37e6;
    dxdt = [0; 0; 0];
    u=(G*M)/(k*R^2)*exp(-G*M*t/(k*R^2))*10000 + delta_u*abs(cos(t));
    dxdt(1)=x(2);
    dxdt(2)=(k*u-g*x(2))/x(3)-(G*M)/((R+x(1))^2);
    dxdt(3)=-u;
end
