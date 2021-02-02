close all;

%odpowiedz skokowa dla najlepszego przypadku
tic;
x = fminsearch(@mise, [0,0])
calc_time = toc
    
a = 0.25;
b = 0.3;
c = 1;
sys_ob = tf(1, [a, b, c]);
sys_reg = tf([x(1), x(2)],[1,0]);
sys_otw = sys_ob * sys_reg;

Ke = 1/(sys_otw + 1);

figure(1);
hold on;
opt = stepDataOptions;
opt.StepAmplitude = 2;


step(Ke, 11, opt);

sys_reg = tf([20, 20],[1,0]);
sys_otw = sys_ob * sys_reg;

Ke = 1/(sys_otw + 1);

opt = stepDataOptions;
opt.StepAmplitude = 2;


step(Ke, 11, opt);

return

%wykres 3D
kp = 0.1:0.1:10;
ki = 0.1:0.1:10;

result = zeros(length(kp), length(ki));
tic;
for i = 1:1:length(kp)
    for j = 1:1:length(ki)
        result(i,j) = mise([kp(i), ki(j)]);
    end
end
calc_time2 = toc

figure(2);
surf(kp, ki, result);
xlabel('Kp');
ylabel('Ki');
zlabel('MISO PI(Kp,Ki)');
