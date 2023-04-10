function [value] = speed( t )

g = 11;
m = 1500000;
q = 2700;
u = 2000;

value  = u *log(m/(m-q*t)) - g*t;
value = value - 750;

end

