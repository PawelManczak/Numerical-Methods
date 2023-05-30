clc
clear all
close all

N = 10^7;
load P_ref
fun = @gestosc;
a = 0;
b = 5;
fmin = 0;
fmax = fun(10);
tic
dx = (b - a)/N;
rectangleSum = 0;

for i = 1:N
    x_i = a + (i - 1)*dx;
    x_i_1 = a + i * dx;

    rectangleSum = rectangleSum + fun((x_i + x_i_1)/2)*dx;
end
time_p = toc;

% Metoda trapezów
tic
dx = (b - a)/N;
trapezoidSum  = 0;
for i = 1:N
    x_i = a + (i - 1)*dx;
    x_i_1 = a + i * dx;
    trapezoidSum  = trapezoidSum + ((fun(x_i) + fun(x_i_1))/2)*dx;
end
time_t = toc;

% Metoda Simpsona
tic
dx = (b - a)/N;
simpsonSum = 0;
for i = 1:N
    x_i = a + (i - 1)*dx;
    x_i_1 = a + i * dx;
    simpsonSum = simpsonSum+ fun(x_i) + 4 * fun((x_i_1 + x_i)/2) + fun(x_i_1);
end
simpsonSum = simpsonSum* dx/6;
time_s = toc;

% Metoda Monte Carlo
tic
f_diff = fmax - fmin;
i_diff = b - a;
N_1 = 0;
for i = 1:N
    x = rand() * i_diff + a;
    y = rand() * f_diff + fmin;
    fx = fun(x);
    if y >= fmin && y <= fx
        N_1 = N_1 + 1;
    end
end
Sm = (N_1/N) * abs(a-b) * abs(fmin-fmax);
time_m = toc;

figure();
x = [1, 2, 3, 4];
y = [time_p; time_t; time_s; time_m];
bar(x,y);
labels = {'prostokątów', 'trapezów', 'Simpsona', 'Monte Carlo'};

set(gca, 'XTickLabel', labels);  
title('Czas wykonania poszczególnych metod dla N = 10^7');
xlabel('Metoda');
ylabel('Czas [s]');
saveas(gcf, 'wykres_czas_wykonania.png');
