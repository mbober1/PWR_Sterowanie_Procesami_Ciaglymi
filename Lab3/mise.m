
function [error] = mise(k)
    
    a = 0.25;
    b = 0.3;
    c = 1;
    error = 0;
    
    sys_ob = tf(1, [a, b, c]);
    sys_reg = tf([k(1), k(2)],[1,0]);
    sys_otw = sys_ob * sys_reg;
    
    Ke = 1/(sys_otw + 1);
    
    opt = stepDataOptions;
    opt.StepAmplitude = 2;
    
    [value, t] = step(Ke, 10, opt);
    
    for i = 2:1:length(t)
        error = error + value(i-1)^2 * (t(i) - t(i-1));
    end
end