clc
clear all
close all


a = 0;   
b = 50;

% 1 bisection
[xvect, xdif, fx, it_cnt] = bisection(@time,1,60000,10^-3);
semilogy(1:it_cnt, xvect)
title("1. Wartość kolejnego przybliżenia rozwiązania N w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Liczba parametrów wejściowych N");
xlabel("Numer iteracji");
saveas(gcf, 'ex1BisectionValues.png');

figure(2);
plot(1:it_cnt, xdif)
title("1. Zmiany wartości przybliżonego rozwiązania N dla kolejnych przy użyciu metody bisekcji");
ylabel("Różnica pomiędzy nową, a starą wartością N");
xlabel("Numer iteracji");
saveas(gcf, 'ex1BisectionDiff.png');