clear all; close all; clc;

max_diff_poly = [];
max_diff_trig = [];

for k = 5:45
    [Y,X] = meshgrid(linspace(0,1,101),linspace(0,1,101));
    [x,y,f,xp,yp] = lazik(k);
    
    [p_poly] = polyfit2d(x,y,f);
    [FF_poly] = polyval2d(X,Y,p_poly);
    
    [p_trig] = trygfit2d(x,y,f);
    [FF_trig] = trygval2d(X,Y,p_trig);
    
    if k == 5
        FF_poly_prev = FF_poly;
        FF_trig_prev = FF_trig;
    else
        max_diff_poly(end+1) = max(max(abs(FF_poly-FF_poly_prev)));
        max_diff_trig(end+1) = max(max(abs(FF_trig-FF_trig_prev)));
        FF_poly_prev = FF_poly;
        FF_trig_prev = FF_trig;
    end
end

plot(6:45, max_diff_poly);
title('Zbieżność interpolacji wielomianowej');
ylabel('Maksymalna wartość różnicy interpolowanych funkcji');
xlabel('Liczba pomiarów - K');
print(gcf, 'zbieznosc_interpolacji_wielomianowej.png', '-dpng', '-r450');
figure;
semilogy(6:45, max_diff_trig);
title('Zbieżność interpolacji trygonometrycznej');
ylabel('Maksymalna wartość różnicy interpolowanych funkcji');
xlabel('Liczba pomiarów - K');
print(gcf, 'zbieznosc_interpolacji_trygonometrycznej.png', '-dpng', '-r450');

