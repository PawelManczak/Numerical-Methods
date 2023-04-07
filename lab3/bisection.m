function [xvect,xdif,fx,it_cnt] = bisection(fun,a,b,eps)
% fun - funkcja, ktorej miejsce zerowe bedzie poszukiwane
% [a,b] - przedzial poszukiwania miejsca zerowego
% eps - prog dokladnosci obliczen
% 
% xvect - wektor kolejnych wartosci przyblizonego rozwiazania
% xdif - wektor roznic pomiedzy kolejnymi wartosciami przyblizonego rozwiazania
% fx - wektor wartosci funkcji dla kolejnych elementow wektora xvect
% it_cnt - liczba iteracji wykonanych przy poszukiwaniu miejsca zerowego

it_cnt = 0;
xvect = [];
xdif = [];
fx = [];
old = 0;

for i = 1:1000
    c = (a + b)/2;
    fc = feval(fun, c); % wartosci funkcji fun dla wartosci c
    
    it_cnt = i;
    xvect(i) = c;
    xdif(i) = abs(old - fc);
    fx(i) = fc;

    if(abs(fc) < eps)
        break;
    elseif fc*feval(fun, a) < 0
        b = c;
    else 
        a = c;
    end

end

end

