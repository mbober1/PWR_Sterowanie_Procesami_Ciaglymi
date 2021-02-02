clear;
close all;
clc;

grid on;

kupf = sim('kupf_sim');
stejc = sim('strejc_sim');

hold on

plot(kupf.get('time'), kupf.get('kupf'));
plot(stejc.get('time'), stejc.get('kupf'));

hold off