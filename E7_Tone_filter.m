clear;close all;clc;
Fs = 100000;
Ts = 1/Fs;

f1 = 2000;
f2= 10000;

w1 = 2*pi*f1/Fs;
w2 = 2*pi*f2/Fs;

n = 0:0.01:1;
x1 = sin(w1*n*Fs);
x2 = sin(w2*n*Fs);
x3 = x1 + x2;

subplot(3,2,1);plot(x1);
subplot(3,2,2);plot(abs(fft(x1)));
subplot(3,2,3);plot(x2);
subplot(3,2,4);plot(abs(fft(x2)));
subplot(3,2,5);plot(x3);
subplot(3,2,6);plot(abs(fft(x3)));

Wp = 11/Fs;
Ws = 18/Fs;

[N, Wc] = buttord(Wp,Ws,3,60); % design filter order
[B2, A2] = butter(N,Wc,'s');

y1 = filter(B2,A2,x3); % apply the filter
figure;
subplot(2,1,1);plot(y1);
subplot(2,1,2);plot(abs(fft(y1)));

figure;
w = 0:pi/32:pi;
plot(abs(freqz(B2,A2,w)))