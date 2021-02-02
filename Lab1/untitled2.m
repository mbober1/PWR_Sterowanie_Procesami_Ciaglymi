close all;

subplot(3,1,1)
grid on;
hold on;

t = 0:0.1:10
u = rand(101,1);

% sys1 = tf([0, 1],[1, 2, 1])
% sys2 = tf([1, 2],[1, 0, 10])
% sys3 = tf([3, 2],[1, 3, 1])
% sys4 = tf([0, 1],[0, 5, 0])
sys1 = tf([0, 1],[0, 2, 1])
% sys2 = tf([1, 2],[1, 0, 10])
% sys3 = tf([3, 2],[1, 3, 1])
% sys4 = tf([0, 1],[0, 5, 0])

step(sys1,t)
% step(sys2,t)
% step(sys3,t)
% step(sys4,t)

subplot(3,1,2)
grid on;
hold on;
pzmap(sys1)
% pzmap(sys2)
% pzmap(sys3)
% pzmap(sys4)

subplot(3,1,3)
grid on;
hold on;
impulse(sys1,t)
% impulse(sys2,t)
% impulse(sys3,t)
% impulse(sys4,t)

% figure(2)
% hold on;
% lsim(sys1, u, t);
% lsim(sys2, u, t);
% lsim(sys3, u, t);
% lsim(sys4, u, t);