% Ustawienie wartości K
K = [5, 15, 25, 35];

% Pętla po wartościach K
for i = 1:length(K)
    % Generowanie toru ruchu łazika i wartości próbek
    [x, y, f, xp, yp] = lazik(K(i));
    
    
    
    % Interpolacja wielomianowa
    p = polyfit2d(x, y, f);
    [XX, YY] = meshgrid(linspace(0, 1, 101));
    FP = polyval2d(XX, YY, p);
    
    % Interpolacja trygonometryczna
    t = trygfit2d(x, y, f);
    FT = trygval2d(XX, YY, t);
    
    % Wykresy
    figure;
    subplot(2,2,1);
    plot(xp,yp,'-o','linewidth',2);
    title(strcat("Tor ruchu łazika dla K=", num2str(K(i))));
    ylabel("y[km]");
    xlabel("x[km]");


    subplot(2,2,2);
    
    plot3(x,y,f,'o', 'markersize', 5);
    surf(reshape(x,K(i),K(i)),reshape(y,K(i),K(i)),reshape(f,K(i),K(i)));
    title(strcat("Zebrane wartości próbek dla K=", num2str(K(i))));
    ylabel("y[km]");
    xlabel("x[km]");
    zlabel("f(x,y)");
    

    subplot(2,2,3);
    surf(XX, YY, FP);
    shading flat;
    title('Interpolacja wielomianowa');
    subplot(2,2,4);
    surf(XX, YY, FT);
    shading flat;
    title('Interpolacja trygonometryczna');
    
   print (gcf, strcat("K_", num2str(K(i)), ".png"), '-dpng', '-r450')
end
