function xdot = f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: Doble Tanque
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: f.m
%
% Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% flow map: xdot=f(x,u,parameters);
% Constants:
global c;
global h0;
global hmax;
global A;
global grav;
global Q;
global u1;
global u2;
global u3;
global up1;
global d1;
global d2;

% State
xi1 = x(1); % Tank level h1
xi2 = x(2); % Tank level h2
xi3 = x(3); % q

% flow map
%xdot=f(x,u);

Q12_V2 = c*sign(xi1 - xi2)*sqrt(2*grav*abs(xi1 - xi2))*u2;
QN_V3 = c*sqrt(2*grav*xi2)*u3;
QL_V1L = c*sqrt(2*grav*xi1)*d1;
QL_V2L = c*sqrt(2*grav*xi2)*d2;

if xi3 == 1
    Q12_V1 = 0;
elseif xi3 == 2
    Q12_V1 = c*sign(xi1 - h0)*sqrt(2*grav*abs(xi1 - h0))*u1;
elseif xi3 == 3
    Q12_V1 = c*sign(h0 - xi2)*sqrt(2*grav*abs(h0 - xi2))*u1;
elseif  xi3 == 4
    Q12_V1 = c*sign(xi1 - xi2)*sqrt(2*grav*abs(xi1 - xi2))*u1;
end
    
x1dot = (up1*Q - Q12_V1 - Q12_V2 - QL_V1L) / A;

x2dot = (Q12_V1 + Q12_V2 - QL_V2L - QN_V3) / A;

x3dot = 0;


xdot = [x1dot; x2dot; x3dot];

