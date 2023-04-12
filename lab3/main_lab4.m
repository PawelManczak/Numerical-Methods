clc
clear all
close all


a = 0;   
b = 50;

% 1 bisection
[xvect, xdif, fx, it_cnt] = bisection(@time,1,60000,10^-3);
plot(1:it_cnt, xvect)
title("1. Wartość kolejnego przybliżenia rozwiązania N w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Liczba parametrów wejściowych N");
xlabel("Numer iteracji");
saveas(gcf, 'ex1BisectionValues.png');

figure(2);
semilogy(1:it_cnt, xdif)
title("1. Zmiany wartości przybliżonego rozwiązania N  w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Różnica pomiędzy nową, a starą wartością N");
xlabel("Numer iteracji");
saveas(gcf, 'ex1BisectionDiff.png');

% 1 secant

figure(3);
[xvect, xdif, fx, it_cnt] = secant(@time,1,60000,10^-3);
plot(1:it_cnt, xvect)
title("1. Wartość kolejnego przybliżenia rozwiązania N w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Liczba parametrów wejściowych N");
xlabel("Numer iteracji");
saveas(gcf, 'ex1SecantValues.png');

figure(4);
semilogy(1:it_cnt, xdif)
title("1. Zmiany wartości przybliżonego rozwiązania N dla kolejnych przy użyciu metody siecznych");
ylabel("Różnica pomiędzy nową, a starą wartością N");
xlabel("Numer iteracji");
saveas(gcf, 'ex1SecantDiff.png');


% 2 bisection
[xvect,xdif,fx,it_cnt] = bisection(@compute_impedance, 0, 50, 10^-12);
figure(5);
plot(1:it_cnt, xvect)
title("2.  Wartość kolejnego przybliżenia rozwiązania omega w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Przybliżona wartość prędkości kątowej omega[rad/s]");
xlabel("Numer iteracji");
saveas(gcf, 'ex2BisectionValues.png');

figure(6);
semilogy(1:it_cnt, xdif)
title("2.Zmiany wartości przybliżonego rozwiązania omega w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Różnica pomiędzy pomiędzy nową, a starą wartością prędkości kątowej omega[rad/s]");
xlabel("Numer iteracji");
saveas(gcf, 'ex2BisectionDiff.png');

% 2 secant
[xvect,xdif,fx,it_cnt] = secant(@compute_impedance, 0, 50, 10^-12);
figure(7);
plot(1:it_cnt, xvect)
title("2.  Wartość kolejnego przybliżenia rozwiązania omega w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Przybliżona wartość prędkości kątowej omega[rad/s]");
xlabel("Numer iteracji");
saveas(gcf, 'ex2SecantValues.png');

figure(8);
semilogy(1:it_cnt, xdif)
title("2.Zmiany wartości przybliżonego rozwiązania omega w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Różnica pomiędzy pomiędzy nową, a starą wartością prędkości kątowej omega[rad/s]");
xlabel("Numer iteracji");
saveas(gcf, 'ex2SecantDiff.png');

% 3 bisection

[xvect, xdif, fx, it_cnt] = bisection(@speed,0,50,10^-12);

figure(9);
plot(1:it_cnt, xvect)
title("1. Wartość kolejnego przybliżenia rozwiązania T w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Przybliżona wartość czasu T[s]");
xlabel("Numer iteracji");
saveas(gcf, 'ex3BisectionValues.png');

figure(10);
semilogy(1:it_cnt, xdif)
title("1. Zmiany wartości przybliżonego rozwiązania T  w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Różnica pomiędzy nową, a starą wartością T[s]");
xlabel("Numer iteracji");
saveas(gcf, 'ex3BisectionDiff.png');

% 3 secant


[xvect, xdif, fx, it_cnt] = secant(@speed,0,50,10^-12);

figure(11);
plot(1:it_cnt, abs(xvect));
%symlog(xvect, 1:it_cnt, 0.01);
title("1. Wartość kolejnego przybliżenia rozwiązania T w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Przybliżona wartość czasu T[s]");
xlabel("Numer iteracji");
saveas(gcf, 'ex3SecantValues.png');


figure(12);
semilogy(1:it_cnt, xdif)
title("1. Zmiany wartości przybliżonego rozwiązania T  w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Różnica pomiędzy nową, a starą wartością T[s]");
xlabel("Numer iteracji");
saveas(gcf, 'ex3SecantDiff.png');


