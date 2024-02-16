clear
clc
close all
k=1000;
G=6.673*10^-11;
M=5.98*10^24;
g=50;
R=6.37*10^6;
tspan = [0 5];
x0 = [0; 0; 100000];
[t,x1] = ode45(@(t,x) Lin(t,x,G,M,R,k,g,10), tspan, x0);
plot(t,x1(:,1),"--")
hold on
xlabel("time")
ylabel("Altitude")
title('Altitude of the hovering rocket for 5 seconds')
[t,x2] = ode45(@(t,x) Lin(t,x,G,M,R,k,g,100), tspan, x0);
plot(t,x2(:,1),"--")
[t,x3] = ode45(@(t,x) Lin(t,x,G,M,R,k,g,300), tspan, x0);
plot(t,x3(:,1),"--")
[t,x4] = ode45(@(t,x) Non(t,x,G,M,R,k,g,10), tspan, x0);
plot(t,x4(:,1))
[t,x5] = ode45(@(t,x) Non(t,x,G,M,R,k,g,100), tspan, x0);
plot(t,x5(:,1))
[t,x6] = ode45(@(t,x) Non(t,x,G,M,R,k,g,300), tspan, x0);
plot(t,x6(:,1))
hold off

legend('Linear,\Deltau=10','Linear,\Deltau=100','Linear,\Deltau=300','Non-
linear,\Deltau=10','Non-linear,\Deltau=100','Non-linear,\Deltau=300')
function dxdt = Lin(t,x,G,M,R,k,g,d_u)
u0=((G*M)/(k*R^2))*exp((-G*M)*t/(k*R^2))*100000;
u = u0 + d_u*abs(cos(t));
dxdt = [0; 0; 0];
dxdt(1) = x(2);
dxdt(2) = ((2*G*M)*x(1)/R^3)-((g/x(3))*x(2))+(-k*u0)/x(3)+k*u/x(3);
dxdt(3) = -u;
end
% Linear System
function dxdt = Non(t,x,G,M,R,k,g,d_u)
u0=((G*M)/(k*R^2))*exp((-G*M)*t/(k*R^2))*100000;
u = u0 + d_u*abs(cos(t));
dxdt = [0; 0; 0];
dxdt(1) = x(2);
dxdt(2) = ((k*u-g*x(2))/x(3))-((G*M)/(R+x(1))^2);
dxdt(3) = -u;
end