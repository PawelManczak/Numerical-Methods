clear all
Edges=[1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7;
       4, 6, 3, 4, 5, 5, 6, 7, 5, 6, 4, 6, 4, 7, 6];

N = 7;
d=0.85;

t1 = linspace(1,7, 7);
t2 = ones(1,7);
t3 = Edges(2,1:7);

B = sparse(Edges(2,:), Edges(1,:), 1, 7, 7);
I = speye(N);
L = sum(B);

A = sparse(spdiags(1./L));

M = sparse(I - d.*B.*A);
b = ones(N,1);
b(:,:) = (1 - d)/N;

whos A B I M b;


spy(B);
title('Układ w macierzy B');
xlabel("");
print -dpng spy_b;

r = M\b;
bar(r);
title('Wartość PageRank dla poszczególnych stron w sieci');
xlabel("Numer strony internetowej");
ylabel("Wartość PageRank");
print -dpng bar;