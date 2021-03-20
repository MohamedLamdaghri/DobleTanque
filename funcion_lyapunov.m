function funcion_lyapunov(x)

x1 = x(:,1);
x2 = x(:,2);
tiempo = [0:(100/length(x1)):100];
tiempo(end) = [];
ly = [];
ly_dot = [];

for i = 1 : length(x1)
    lya = 0.5*x1(i)^2 + 0.5*x2(i)^2;
    lya_dot = x1(i) + x2(i);
    ly = [ly, lya];
    ly_dot = [ly_dot, lya_dot];
end

length(ly)
length(tiempo)
plot(tiempo , ly, 'r', tiempo, ly_dot, 'b')
legend('W', 'Wdot')
