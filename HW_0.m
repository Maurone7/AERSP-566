clear, clc
syms k g G M R t x1 x2 x3 v1 v2
k = 1000;
g = 50;
G = 6.673e-11;
M = 5.98e24;
R = 6.37e6;

u=exp(-G*M/(k*R^2)*t);
f1=x2;
f2=(k*u-g*x2)/x3-(G*M)/((R+x1)^2);
f3=-u;

x0 = [x1 x2 x3];
a=jacobian([f1;f2;f3],[x1 x2 x3]);
b=jacobian([f1;f2;f3],[x1 x2]);
x1=0;
x2=0;
x3=100;

A=eval(a);
B=eval(b);

%syms a1 a2 a3 kc k1 k2 A1 A2 A3 y1 y2 g h1 h2 h3 v1 v2 ld1 ld2 c D
%f1 = (ld1*k1*v1)/A1+a3*sqrt(2*g*h3)/A1-a1*sqrt(2*g*h1)/A1;
%f2 = (ld2*k2*v2)/A2+*sqrt(2*g)/A2-a2*sqrt(2*g*h2)/A2;
%f3 = ((1-ld2)*k2*v2)/A3-a3*sqrt(2*g*h3)/A3;
%a=jacobian([f1;f2;f3],[h1 h2 h3]); % Calculating Jacobian at steady state points
%b=jacobian([f1;f2;f3],[v1 v2]);

%C = [0.5 0.5 0 0];
%A=eval(a); %linearized A matrix at steady state point
%B=eval(b); %linearized B matrix at steady state point
