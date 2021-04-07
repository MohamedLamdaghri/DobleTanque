%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: Doble Tanque
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: run.m
%
% Version 1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all

%constants
c = 3.6e-5;
h0 = 0.3;
hmax = 0.5;
hmin = 0.2;
A = 0.0154;
grav = 9.81;
Q = 0.1e-3;
control = 0;

global c h0 hmax hmin A grav Q control;

control = menu('Tipo de Control', 'Forzar a estado 3', 'Control de Nivel');
display(control);
% initial conditions
x0 = [0.25;0.25;1;1;1;1;0;0;0];
 
% simulation horizon
TSPAN = [0 1000];
JSPAN = [0 1000];

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
x4 = x(:,4);
x5 = x(:,5);
x6 = x(:,6);
x7 = x(:,7);
x8 = x(:,8);
x9 = x(:,9);

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

