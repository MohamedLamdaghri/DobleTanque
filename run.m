%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: Doble Tanque
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: run.m
%
% Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all

%constants
c = 3.6e-5;
h0 = 0.3;
hmax = 0.6;
A = 0.0154;
grav = 9.81;
Q = 0.1e-3;
u1 = 1;
u2 = 1;
u3 = 1;
up1 = 0;
d1 = 0;
d2 = 0;

global c h0 hmax A grav Q u1 u2 u3 up1 d1 d2 ;

% initial conditions
x0 = [0.25;0.45;3];
 
% simulation horizon
TSPAN = [0 100];
JSPAN = [0 100];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

options = odeset('RelTol',1e-6,'MaxStep',.1);

% simulate
[t j x] = HyEQsolver( @f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);

% state
x1 = x(:,1);
x2 = x(:,2);
x3 = x(:,3);

% plot solutions
figure(1)
clf
subplot(2,1,1),plotflows(t,j,x(:,1))
grid on
ylabel('H1')
 
subplot(2,1,2),plotjumps(t,j,x(:,1))
grid on
ylabel('x1')
 
figure(2)
clf
subplot(2,1,1),plotflows(t,j,x(:,2))
grid on
ylabel('H2')
 
subplot(2,1,2),plotjumps(t,j,x(:,2))
grid on
ylabel('x2')

figure(3)
clf
subplot(2,1,1),plotflows(t,j,x(:,3))
grid on
ylabel('Estados')
 
subplot(2,1,2),plotjumps(t,j,x(:,3))
grid on
ylabel('x3')

save('x.mat', 'x')
