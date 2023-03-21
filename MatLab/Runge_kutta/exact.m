function [u] = exact(x, n)
u = zeros(1, n);
for i=1:n
    u(i) = 3/4 * exp(-2 * x(i)) + 1/2*x(i)*x(i)-1/2*x(i)+1/4;
end
end
