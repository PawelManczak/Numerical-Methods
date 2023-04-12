function [value] = speed( t )

g = 9.81;
m = 150000;
q = 2700;
u = 2000;

value  = u *log(m/(m-q*t)) - g*t;
value = value - 750;

end

