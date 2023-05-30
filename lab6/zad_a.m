clc
clear all
close all

load P_ref
fun = @gestosc
a = 0
b = 5
fmin = 0
fmax = fun(10)

err_p = [];
err_t = [];
err_s = [];
err_m = [];

% 1.1
gest_h = [];

for i = 0:1:20
    gest_h = [gest_h, gestosc(i)];
end

figure;
plot(0:1:20, gest_h, 'LineWidth', 2);
title('Wykres gęstości prawdopodobieństwa f(x)');
xlabel('x');
ylabel('f(x)');
saveas(gcf, 'gestosc.png');

for N = 5:50:10^4
  %Metoda prostokątów
  dx = (b - a)/N;
  Sp = 0;
  for i = 1:N
    x_i = a + (i - 1)*dx;
    x_i_1 = a + i * dx;
    Sp = Sp + fun((x_i + x_i_1)/2)*dx;
  end
  err_p = [err_p, abs(Sp - P_ref)];
  
  %Metoda trapezow
  dx = (b - a)/N;
  St = 0;
  for i = 1:N
    x_i = a + (i - 1)*dx;
    x_i_1 = a + i*dx;
    St = St + (fun(x_i) + fun(x_i_1))/2*dx;
  end
  err_t = [err_t, abs(St - P_ref)];

  %Metoda Simpsona
  dx = (b - a)/N;
  Ss = 0;
  for i = 1:N
    x_i = a + (i - 1)*dx;
    x_i_1 = a + i * dx;
    Ss = Ss + fun(x_i) + 4 * fun((x_i_1 + x_i)/2) + fun(x_i_1);
  end
  Ss = Ss*dx/6;
  err_s = [err_s, abs(Ss - P_ref)];

  %Metoda Monte Carlo
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
  err_m = [err_m, abs(Sm - P_ref)];
end


x = 5:50:10^4;

figure();
loglog(x, err_p);
title('Błąd - metoda prostokątów');
xlabel('Liczba przedziałów');
ylabel('Wartość błędu');
saveas(gcf, 'metoda_prostokatow_blad.png')

figure();
loglog(x, err_t);
title('Błąd - metoda trapezów');
xlabel('Liczba przedziałów');
ylabel('Blad');
saveas(gcf, 'metoda_trapezow_blad.png')

figure();
loglog(x, err_s);
title('Błąd - metoda Simpsona');
xlabel('Liczba przedziałów');
ylabel('Blad');
saveas(gcf, 'metoda_simpsona_blad.png')

figure();
loglog(x, err_m);
title('Błąd - metoda Monte Carlo');
xlabel('Liczba punktów');
ylabel('Blad');
saveas(gcf, 'metoda_monte_carlo_blad.png')

N = 10^7

%Metoda prostokątów
tic
dx = (b - a)/N;
Sp = 0;

for i = 1:N
  x_i = a + (i - 1)*dx;
  x_i_1 = a + i * dx;

  Sp = Sp + fun((x_i + x_i_1)/2)*dx;
end
time_p = toc;

%Metoda trapezow
tic
dx = (b - a)/N;
St = 0;
for i = 1:N
  x_i = a + (i - 1)*dx;
  x_i_1 = a + i * dx;
  St = St+ ((fun(x_i) + fun(x_i_1))/2)*dx;
end
time_t = toc;

%Metoda Simpsona
tic
dx = (b - a)/N;
Ss = 0;
for i = 1:N
  x_i = a + (i - 1)*dx;
  x_i_1 = a + i * dx;
  Ss = Ss+ fun(x_i) + 4 * fun((x_i_1 + x_i)/2) + fun(x_i_1);
end
Ss = Ss* dx/6;
time_s = toc;

%Metoda Monte Carlo
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
bar(x, y, 0.5, 'FaceColor', [0, 0.5, 1]);
labels = ['prostokątów'; 'trapezów'; 'Simpsona'; 'Monte Carlo'];
set(gca, 'XTickLabel', labels);  
title('Czas wykonania poszczególnych metod dla N = 10^7');
xlabel('Metoda');
ylabel('Czas [s]');
saveas(gcf, "wykres_czas_wykonania.png");
