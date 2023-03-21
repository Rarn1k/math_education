function [y] = runge_kutta_4(u_0, x, h, n)
y = zeros(1, n);
y(1) = u_0;
for i = 1:n - 1
    k1 = func(y(i), x(i));
    k2 = func(y(i)+0.5*h*k1, x(i)+0.5*h);
    k3 = func(y(i)+0.5*h*k2, x(i)+0.5*h);
    k4 = func(y(i)+h*k3, x(i)+h);
    y(i + 1) = y(i)+h/6*(k1+2*k2+2*k3+k4);
end
end

