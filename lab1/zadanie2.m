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
inversed = 1./L;

A = spdiags(1./L);

