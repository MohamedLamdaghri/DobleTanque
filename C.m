function v  = C(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: Doble Tanque
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: C.m
%
% Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
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

if ((xi3 == 1) && (xi1 < h0) && (xi2 < h0))
    v = 1;
elseif ((xi3 == 2) && (xi1 >= h0) && (xi2 < h0))
    v = 1;
elseif ((xi3 == 3) && (xi1 < h0) && (xi2 >= h0))
    v = 1;
elseif ((xi3 == 4) && (xi1 >= h0) && (xi2 >= h0))
    v = 1;
else 
    v = 0;
end