close all;
clear all;
d = 1; %mnożnik błędu

%offline
b = [1,2,3];

n = 1000;

offline = zeros(1, n);

for i = 1:n
    offline(i) = mnk_off(b, rand(1,i), d);
    disp(i)
end

%online

bn = [0,0,0];
Pn = diag([1000,1000,1000]);

u = [0, 0, rand()];

online = zeros(1, n);

for i = 1:n
    y = (b(1) * u(3)) + (b(2) * u(2)) + (b(3) * u(1)) + d*rand();

    f = [ u(3), u(2), u(1) ];

    E = y - f*transpose(bn);

    Pn = Pn - (Pn * transpose(f) * f * Pn) / (1 + f * Pn * transpose(f));

    bn = bn + transpose(Pn * transpose(f) * E);

    online(i) = norm(bn - b);

    u = [u(2), u(3), rand()];
    disp(i)
end

figure(1);
plot(1:n, offline);
title('Błąd estymatora offline');
legend('Offline');


figure(2);
plot(1:n, online);
title('Błąd estymatora online');
legend('Online');


figure(3);
plot(1:n, offline);
hold on;
plot(1:n, online);
title('Porównanie estymatorów');
legend('Offline', 'Online');



%wpływ wielkości zakłucenia

clear all;
n = 1000;
b = [1,2,3];

%offline

figure(4);

for i = 1:n
    d(i) = (i-1);
    offline(i) = mnk_off(b, rand(1,n), d(i));
    disp(i)
end

plot(d, offline);

title('Wpływ wielkości zakłucenia na błąd estymatora offline');
legend('Offline');



%online

figure(5);

bn = [0,0,0];
Pn = diag([1000,1000,1000]);

u = [0, 0, rand()];

for i = 1:n
    d(i) = (i-1);
    y = (b(1) * u(3)) + (b(2) * u(2)) + (b(3) * u(1)) + d(i)*rand();

    f = [ u(3), u(2), u(1) ];

    E = y - f*transpose(bn);

    Pn = Pn - (Pn * transpose(f) * f * Pn) / (1 + f * Pn * transpose(f));

    bn = bn + transpose(Pn * transpose(f) * E);

    online(i) = norm(bn - b);

    u = [u(2), u(3), rand()];
    disp(i)
end

plot(d, online);
title('Wpływ wielkości zakłucenia na błąd estymatora online');
legend('Online');


figure(6);
plot(d, offline);
hold on;
plot(d, online);
title('Wpływ wielkości zakłucenia - porównanie estymatorów');
legend('Offline', 'Online');