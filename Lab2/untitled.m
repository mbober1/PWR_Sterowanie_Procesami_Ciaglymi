close all;
grid on;
hold on;

T = 2
w = 2
K = 1/(1+T*w*1i)
A = abs(K)
fi = angle(K)

t = 0:0.01:10
x = A*sin(w*t+fi)

sys = tf([0, 1],[T, 1])
lsim(sys, sin(w*t), t)
plot(t,x,'r')



figure(2)
w = 0:0.01:10
K = 1./(1+T*w.*1i)
re = real(K)
im = imag(K)
plot3(re,im,w,'r')

figure(3)
K = exp(-T*w.*1i)
re = real(K)
im = imag(K)
plot3(re,im,w,'r')

figure(4)
w = 0:0.01:10
K = 1./(1+(4*(T*w).*1i)-(6*((T*w).^2))-(4*((T*w).^3)*1i)+((T*w).^4))
re = real(K)
im = imag(K)
plot3(re,im,w,'r')

sys = tf([0, 1],[T, 1]) %inercyjny I
sys2 = tf([0, 1],[T, 4*T, 6*T, 4*T,1]) %inercyjny IV
sys3 = tf([0, 1],[T,1,0]) %calkujacy rzeczywisty

figure(5)
nyquist(sys)

figure(6)
nyquist(sys2)

figure(7)
nyquist(sys3)
