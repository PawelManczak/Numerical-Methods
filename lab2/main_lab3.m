clc
clear all
close all

% odpowiednie fragmenty kodu mozna wykonac poprzez zaznaczenie i wcisniecie F9 w Matlabie
% komentowanie/odkomentowywanie: ctrl+r / ctrl+t

% Zadanie A
%------------------
N = 10;
density = 3; % parametr decydujacy o gestosci polaczen miedzy stronami
[Edges] = generate_network(N, density);

%-----------------

% Zadanie B
%------------------
% generacja macierzy I, A, B i wektora b
% macierze A, B i I musza byc przechowywane w formacie sparse (rzadkim)

d = 0.85;
B = sparse(Edges(2,:), Edges(1,:), 1, N, N);
I = speye(N);
L = sum(B);

A = sparse(spdiags(1./L));

M = sparse(I - d.*B.*A);
b = ones(N,1);
b(:,:) = (1 - d)/N;

issparse(M)
%-----------------
% Zadanie C
r = M\b;


% Zadanie D
%------------------
clc
clear all
close all
d = 0.85;
N = [500, 1000, 3000, 6000, 12000];


for i = 1:5
    density = 3; % parametr decydujacy o gestosci polaczen miedzy stronami
    [Edges] = generate_network(N(i), density);

    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));
    I = speye(N(i));
    L = sum(B);

    A = sparse(spdiags(1./L));

    M = sparse(I - d.*B.*A);
    b = ones(N(i),1);
    b(:,:) = (1 - d)/N(i);
    
    tic
    % obliczenia start
    r = M\b;
    % obliczenia stop
    czas_Gauss(i) = toc;
end

plot(N, czas_Gauss)
figure(1);

title("Zadanie D");
ylabel("czas rozwiązywania równania macierzowego [s]");
xlabel("Rozmiar macierzy");
saveas(gcf, 'zadD.png');



%------------------



% Zadanie E
%------------------
clc
clear all
close all

% sprawdz przykladowe dzialanie funkcji tril, triu, diag:
% Z = rand(4,4)
% tril(Z,-1) 
% triu(Z,1) 
% diag(diag(Z))


for i = 1:5
    tic
    % obliczenia start

    % obliczenia stop
    czas_Jacobi(i) = toc;
end
%plot(N, czas_Jacobi)
%------------------


% Zadanie F
%------------------


% Zadanie G
%------------------






