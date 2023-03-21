function [x] = cosins(a)
x = [a(1)/norm(a)*180/pi a(2)/norm(a)*180/pi a(3)/norm(a)*180/pi];
end