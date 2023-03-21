function [y] = runge_kutta_1(u_0, x, h, n)
y = zeros(1, n);
y(1) = u_0;
for i = 1:n - 1
    k1 = h * func(y(i), x(i));
    y(i + 1) = y(i) + k1;
end
end


