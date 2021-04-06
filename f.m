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
% Version 1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% flow map: xdot=f(x,u,parameters);
% Constants:
global c;
global h0;
global hmax;
global A;
global grav;
global Q;

% State
xi1 = x(1); % Tank level h1
xi2 = x(2); % Tank level h2
xi3 = x(3); % q
xi4 = x(4); % u1
xi5 = x(5); % u2
xi6 = x(6); % u3
xi7 = x(7); % up1
xi8 = x(8); % d1
xi9 = x(9); % d2

% flow map
%xdot=f(x,u);

Q12_V2 = c*sign(xi1 - xi2)*sqrt(2*grav*abs(xi1 - xi2))*xi5;
QN_V3 = c*sqrt(2*grav*xi2)*xi6;
QL_V1L = c*sqrt(2*grav*xi1)*xi8;
QL_V2L = c*sqrt(2*grav*xi2)*xi9;

if xi3 == 1
    Q12_V1 = 0;
elseif xi3 == 2
    Q12_V1 = c*sign(xi1 - h0)*sqrt(2*grav*abs(xi1 - h0))*xi4;
elseif xi3 == 3
    Q12_V1 = c*sign(h0 - xi2)*sqrt(2*grav*abs(h0 - xi2))*xi4;
elseif  xi3 == 4
    Q12_V1 = c*sign(xi1 - xi2)*sqrt(2*grav*abs(xi1 - xi2))*xi4;
end
    
x1dot = (xi7*Q - Q12_V1 - Q12_V2 - QL_V1L) / A;
x2dot = (Q12_V1 + Q12_V2 - QL_V2L - QN_V3) / A;
x3dot = 0;
x4dot = 0;
x5dot = 0;
x6dot = 0;
x7dot = 0;
x8dot = 0;
x9dot = 0;

xdot = [x1dot; x2dot; x3dot; x4dot; x5dot; x6dot; x7dot; x8dot; x9dot];

