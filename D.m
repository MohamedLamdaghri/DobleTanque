function v  = D(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: Doble Tanque
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: D.m
%
% Version 1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
global c;
global h0;
global hmax;
global hmin;
global A;
global grav;
global Q;
global control;

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

if (((xi3 == 1) && (xi1 >= h0)) || ((xi3 == 1) && (xi2 >= h0)))
    v = 1;
elseif (((xi3 == 2) && (xi1 < h0)) || ((xi3 == 2) && (xi2 >= h0)))
    v = 1;
elseif (((xi3 == 3) && (xi1 >= h0)) || ((xi3 == 3) && (xi2 < h0)))
    v = 1;
elseif (((xi3 == 4) && (xi1 < h0)) || ((xi3 == 4) && (xi2 < h0)))
    v = 1;
else 
    v = 0;
end