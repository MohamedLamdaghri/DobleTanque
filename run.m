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
plot(t, x(:,1),'r', t, x(:,2),'b')
grid on
xlabel('Tiempo (s)')
ylabel('Altura (m)')
legend('h1', 'h2')

figure(2)
clf
subplot(2,1,1),plotflows(t,j,x(:,3))
grid on
xlabel('Saltos (j)')
ylabel('Estados')
 
subplot(2,1,2),plotjumps(t,j,x(:,3))
grid on
ylabel('x3')


% plot hybrid arc
figure(3)
plotHybridArc(t,j,x(:,1))
xlabel('j')
ylabel('t')
zlabel('x1')

figure(4)
plotHybridArc(t,j,x(:,2))
xlabel('j')
ylabel('t')
zlabel('x2')

figure(5)
function_lyapunov(x)