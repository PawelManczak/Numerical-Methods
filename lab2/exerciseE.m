% Zadanie E
%------------------
clc
clear all
close all

N = [500, 1000, 3000, 6000, 12000];
density = 10;
d = 0.85;
accuracy = 10^(-14);

for i = 1:5
    [Edges] = generate_network(N(i), density);

    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));
    I = speye(N(i));
    L = sum(B);

    A = sparse(spdiags(1./L));

    M = sparse(I - d.*B.*A);
    b = ones(N(i),1);
    b(:,:) = (1 - d)/N(i);
  
    % starting values
    r = ones(N(i), 1);
    D = diag(diag(M));
    U = triu(M, 1);
    L = tril(M, -1);

    number_of_iterations(i) = 0;
  
    % W Matlabie operator \ wywołuje procedurę, 
    % która określa najbardziej odpowiedni
    % algorytm do wyznaczenia rozwiązania.

    factor1 = -D \(L + U);
    factor2 = D \ b;
  
  
  tic
  while(true)
    number_of_iterations(i) = number_of_iterations(i) + 1;
    r = factor1*r + factor2;
    res = M*r - b;

    if i == 2 % 1000
        resy(number_of_iterations(i)) = norm(res);
    end
    if(norm(res) <= accuracy)
      break
    end
  end

  time(i) = toc;
end

plot(N, time)
title("czas wyznaczenia rozwiązania w zależności od N");
ylabel("Czas [s]");
xlabel("Rozmiar macierzy");
saveas(gcf, 'zadanieE_czas.png');

plot(N, number_of_iterations)
title("liczba iteracji wymagana do osiągnięcia rozwiązania w zależności od N");
ylabel("Liczba iteracji");
xlabel("Rozmiar macierzy");
saveas(gcf, 'zadanieE_iteracje.png');

% semilogy (oś y w skali logarytmicznej) 
temp = linspace(1, number_of_iterations(2), number_of_iterations(2));
semilogy(temp, resy)
title('norma błędu rezydualnego dla kolejnych iteracji dla rozmiaru macierzy N = 1000')
ylabel("norma błędu rezydualnego");
xlabel("Nr iteracjii");
saveas(gcf, 'zadanieE_norma.png');
%------------------