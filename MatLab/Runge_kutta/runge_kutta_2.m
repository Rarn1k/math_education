function [y] = runge_kutta_2(u_0, x, h, n)

y = zeros(1, n);
y(1) = u_0;
for i = 1:n - 1
    k1 = func(y(i), x(i));
    k2 = func(y(i)+h*k1, x(i)+h);
    y(i + 1) = y(i) + h*(0.5*k1+0.5*k2);
end
end

