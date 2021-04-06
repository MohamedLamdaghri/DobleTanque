function xplus = g(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: Doble Tanque
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: g.m
%
% Version 1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% jump map: xplus = g(x,u,parameters);

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

xi1plus = xi1;
xi2plus = xi2;
if ((xi3 == 1) && (xi1 >= h0))
    xi3plus = 2;
elseif ((xi3 == 1) && (xi2 >= h0))
    xi3plus = 3;
elseif ((xi3 == 2) && (xi1 < h0))
    xi3plus = 1;
elseif ((xi3 == 2) && (xi2 >= h0))
    xi3plus = 4;
elseif ((xi3 == 3) && (xi2 < h0))
    xi3plus = 1;
elseif ((xi3 == 3) && (xi1 >= h0))
    xi3plus = 4;
elseif ((xi3 == 4) && (xi2 < h0))
    xi3plus = 2;
elseif ((xi3 == 4) && (xi1 < h0))
    xi3plus = 3;
end

if (xi2 > h0)
    xi4plus = 0;
    xi5plus = 0;
    xi6plus = 0;
    xi7plus = 0;
    xi8plus = 1;
else
    xi4plus = xi4;
    xi5plus = xi5;
    xi6plus = xi6;
    xi7plus = xi7;
    xi8plus = xi8;
end

xi9plus = xi9;

xplus = [xi1plus; xi2plus; xi3plus; xi4plus; xi5plus; xi6plus; xi7plus; xi8plus; xi9plus];