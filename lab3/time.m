function [value] = time( N )

value = (N^1.43 * N^1.14)/1000;
value = value - 5000;
end

