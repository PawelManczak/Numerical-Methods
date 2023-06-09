function [xvect,xdif,fx,it_cnt] = secant(fun,a,b,eps)
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
xvect(1) = a;
xvect(2) = b;
xdif(1) = 0;
xdif(2) = abs(b-a);
fx(1) = feval(fun, a);
fx(2) = feval(fun, b);
old = a;

for i = 3:1000
    fn = feval(fun, xvect(i - 1)); 
    fn1 = feval(fun, xvect(i - 2));
    xvect(i) = (fn*xvect(i - 2) - fn1*xvect(i - 1))/(fn - fn1);
    
    our = feval(fun, xvect(i));
    it_cnt = i;
    xdif(i) = abs(old - our);
    fx(i) = our;
    old = our;

     if(abs(our) < eps)
        break;
     end
end




end

