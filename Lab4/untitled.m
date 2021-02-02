close all;

x = fminsearch(@mise,[0,0,0]);

T1 = 0.4;
T2 = 0.1;
sample_time = 0.1; %czas probkowania


K1 = tf(1,[1,0]);
K2 = tf(1,[T1,1]);
K3 = tf(1,[T2,1]);
Ks = K1 * K2 * K3; %obiekt


PID_con = tf([x(1)+x(3), x(1)+x(2), x(2)],[1,1,0]); %trans PID ciagla
PID_dis = c2d(PID_con, sample_time);                %trans PID dyskretna

[licz1, mian1] = tfdata(PID_dis);
[licz2, mian2] = tfdata(PID_con);



a = sim('pider');

figure(1);
plot(a.time, a.con);
hold on;
plot(a.time, a.dis);
legend('PI ciągły','PI dyskretny')
title("Odpowiedź systemu");


figure(2);
plot(a.time, a.con_uchyb);
hold on;
plot(a.time, a.dis_uchyb);
legend('PI ciągły','PI dyskretny')
title("Uchyb systemu");


figure(3);
plot(a.time, a.con_ob);
hold on;
plot(a.time, a.dis_ob);
legend('PI ciągły','PI dyskretny')
title("Wejście obiektu");


figure(4);
plot(a.time, a.con_err);
legend('PI ciągły','PI dyskretny')
title("Całka z kwadratu uchybu");


figure(5)
cons_error = 1.318;
dis_error = [1.343, 1.497, 1.725, 2.573];
samp_time = [0.1, 0.2, 0.3, 0.5];

plot(samp_time, dis_error-cons_error);
title("Różnica błędu uchybu");