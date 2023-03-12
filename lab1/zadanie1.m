clear all;
close all;
a = 12;
r_max=a/2;
n_max = 200;
n = 0;

x_h = [];
y_h = [];
r_h = [];
n_of_tries = [];
fields = [];


counter = 0;
    while true
        counter = counter + 1;
        x = rand(1) * a;
        y = rand(1) * a;
        r = rand(1) * r_max;

        if ( x > r && x < a - r && y - r >0 && y + r < a)

            x_h(end+1) = x;
            y_h(end+1) = y;
            r_h(end+1) = r;
            n_of_tries(end+1) = counter;
            fields(end+1) = pi*r^2;
            
            break;
        end
    end

hold on;
axis equal;
axis([0 a 0 a]);

while n < n_max -1
    n = n+1;
    counter = 0;
    while true
        counter = counter + 1;
        x = rand(1) * a;
        y = rand(1) * a;
        r = rand(1) * r_max;

        if ( x > r && x < a - r && y - r >0 && y + r < a)


            i = 1;
            flag = 0;
            for radius = r_h
                
   
                distSq = sqrt((x - x_h(i))^2 + (y - y_h(i))^2);
                    
                if(distSq - r < r_h(i))
                    flag = 1;    
                end
            
                i = i + 1;
             
            end
            
            if (flag == 1)
                continue;
            end
            x_h(end+1) = x;
            y_h(end+1) = y;
            r_h(end+1) = r;
            n_of_tries(end+1) = counter;
            fields(end+1) = pi*r^2;

            break;
        end
    end
    plot_circle(x, y, r);
    pause(0.01);
end

%exercise 1.1
hold off;
figure(2);


plot(linspace(1, 200, 200), cumsum(fields));
xlabel("Liczba narysowanych okręgów");
ylabel("Powierzchnia");
title("Powierzchnia całkowita kół");

figure(3);
second = cumsum(n_of_tries);


for i = 1:200
   second(i) = second(i)/i;
end
plot(linspace(1, 200, 200), second);
xlabel("Liczba narysowanych okręgów");
ylabel("Liczba losowań");
title("Średnia liczba losowań");
