%close all;
%clear all;

Kp = 2.05;
Ki = 1.45;
Kd = 0.7;

a=1;
b=2;
c=1;

obj = tf([0, 1],[a,b,c]);
C_pi = pid(Kp,Ki,Kd);
T_pi = feedback(C_pi*obj, 1);

a = sim('sim');
t = a.get('clock');

figure(1);
hold on;
plot(t,a.get('simout'));
step(T_pi,'r--', 10);
title('Odpowiedzi skokowe');
legend('Obiekt niestacjonarny', 'Obiekt stacjonarny');

figure(2);
plot(t,a.get('sygnal'));
title('Parametr C');

figure(3);
hold on;
plot(t,a.get('roznica'));
title('Różnica pomiędzy modelami');

figure(4);
hold on;
plot(t,a.get('pid2'));
title('Regulator korekcyjny');

figure(5);
hold on;
plot(t,a.get('uchyb'));
title('Uchyb');