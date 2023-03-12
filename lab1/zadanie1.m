clear all;
close all;
a = 12;
r_max=a/2;
n_max = 20;
n = n_max;


x = rand(1) * a;
y = rand(1) * a;
r = rand(1) * r_max;
plot_circle(x, y, r);
hold on;
axis equal;
axis([0 a 0 a]);

while n > 1
    n = n-1;
    while true
        x = rand(1) * a;
        y = rand(1) * a;
        r = rand(1) * r_max;

        if ( x > r && x < a - r && y - r >0 && y + r < a)
            break;
        end
    end
    plot_circle(x, y, r);
    pause(0.01);
end
