close all;
t = 0:0.1:4

% inercyjny
figure(1)
subplot(3,1,1)
title('Odpowiedz skokowa');
hold on;

for v = 0.5:0.5:2
    sys = tf([0, 1],[v,1])
    [x,t] = step(sys,t);
    txt = ['D = ',num2str(v)];

    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show


subplot(3,1,2)
title('Odpowiedz impulsowa');
hold on;

for v = 0.5:0.5:2
    sys = tf([0, 1],[v,1])
    [x,t] = impulse(sys,t);
    txt = ['D = ',num2str(v)];
    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show

subplot(3,1,3)
title('Rozkład biegunów');
hold on;

for v = 0.5:0.5:2
    sys = tf([0, 1],[v,1])
    pzmap(sys);
end
grid on;


% całkujący rzeczywisty
figure(2)
subplot(3,1,1)
title('Odpowiedz skokowa');
hold on;

for v = 0.5:0.5:2
    sys = tf([0,1], [v, 1, 0])
    [x,t] = step(sys,t);
    txt = ['C = ',num2str(v)];

    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show


subplot(3,1,2)
title('Odpowiedz impulsowa');
hold on;

for v = 0.5:0.5:2
    sys = tf([0,1], [v, 1, 0])
    [x,t] = impulse(sys,t);
    txt = ['C = ',num2str(v)];
    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show

subplot(3,1,3)
title('Rozkład biegunów');
hold on;

for v = 0.5:0.5:2
    sys = tf([0,1], [v, 1, 0])
    pzmap(sys);
end
grid on;


% różniczkujący rzeczywisty
figure(3)
subplot(3,1,1)
title('Odpowiedz skokowa');
hold on;

for v = 0.5:0.5:2
    sys = tf([1,0], [v, 1])
    [x,t] = step(sys,t);
    txt = ['D = ',num2str(v)];

    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show


subplot(3,1,2)
title('Odpowiedz impulsowa');
hold on;

for v = 0.5:0.5:2
    sys = tf([1,0], [v, 1])
    [x,t] = impulse(sys,t);
    txt = ['D = ',num2str(v)];
    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show

subplot(3,1,3)
title('Rozkład biegunów');
hold on;

for v = 0.5:0.5:2
    sys = tf([1,0], [v, 1])
    pzmap(sys);
end
grid on;



t = 0:0.1:10
% oscylacyjny
figure(4)
subplot(3,1,1)
title('Odpowiedz skokowa');
hold on;

for v = 0.5:0.5:2
    E = 0.6
    sys = tf([0,1], [v*v, v*E, 1])
    [x,t] = step(sys,t);
    txt = ['C = ',num2str(v*v), ', D = ', num2str(v) ];

    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show

subplot(3,1,2)
title('Odpowiedz impulsowa');
hold on;

for v = 0.5:0.5:2
    E = 0.6
    sys = tf([0,1], [v*v, v*E, 1])
    [x,t] = impulse(sys,t);
    txt = ['C = ',num2str(v*v), ', D = ', num2str(v) ];
    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show

subplot(3,1,3)
title('Rozkład biegunów');
hold on;

for v = 0.5:0.5:2
    E = 0.6
    sys = tf([0,1], [v*v, v*E, 1])
    pzmap(sys);
end
grid on;




t = 0:0.1:100
u = rand(1001,1);

% inercyjny
figure(5)
title('Inercyjny pobudzony sygnałem losowym');
hold on;

for v = 0.5:0.5:2
    sys = tf([0, 1],[v,1])
    [x,t] = lsim(sys,u,t);
    txt = ['D = ',num2str(v)];

    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show


% całkujący rzeczywisty
figure(6)
title('Całkujący pobudzony sygnałem losowym');
hold on;

for v = 0.5:0.5:2
    sys = tf([0,1], [v, 1, 0])
    [x,t] = lsim(sys,u,t);
    txt = ['C = ',num2str(v)];

    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show


% różniczkujący rzeczywisty
figure(7)
title('Różniczkujący pobudzony sygnałem losowym');
hold on;

for v = 0.5:0.5:2
    sys = tf([1,0], [v, 1])
    [x,t] = lsim(sys,u,t);
    txt = ['D = ',num2str(v)];

    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show


t = 0:0.1:100
u = rand(1001,1);
% oscylacyjny
figure(8)
title('Oscylacyjny pobudzony sygnałem losowym');
hold on;

for v = 0.5:0.5:2
    E = 0.6
    sys = tf([0,1], [v*v, v*E, 1])
    [x,t] = lsim(sys,u,t);
    txt = ['C = ',num2str(v*v), ', D = ', num2str(v) ];

    plot(t,x, 'DisplayName',txt);
end
grid on;
legend show