clc
clear all
close all

% 1 
% loading M and b
load('Dane_Filtr_Dielektryczny_lab3_MN.mat');

r1 = M\b;
res = M*r1 - b;
normRes1 = norm(res);
%disp(r1);

% 2
% starting values
r2 = ones(20000, 1);
D = diag(diag(M));
U = triu(M, 1);
L = tril(M, -1);

  
% W Matlabie operator \ wywołuje procedurę, 
% która określa najbardziej odpowiedni
% algorytm do wyznaczenia rozwiązania.

factor1 = -D \(L + U);
factor2 = D \ b;

accuracy = 10^(-14);
while(true)
    r2 = factor1*r2 + factor2;
    res = M*r2 - b;

    if(norm(res) <= accuracy || isnan(norm(res)))
      break
    end
end

normRes2 = norm(res);

%3
    r3 = ones(20000, 1);
    D = diag(diag(M));
    U = triu(M, 1);
    L = tril(M, -1);

  
    % W Matlabie operator \ wywołuje procedurę, 
    % która określa najbardziej odpowiedni
    % algorytm do wyznaczenia rozwiązania.

    factor1 = -(D + L);
    factor2 = (D + L) \ b;
  
  
  while(true)
    r3 = factor1 \ (U*r3) + factor2;
    res = M*r3 - b;

    if(norm(res) <= accuracy || isnan(norm(res)))
      break
    end
  end

normRes3 = norm(res);
