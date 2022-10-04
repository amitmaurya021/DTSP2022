clear; close all; clc;

M = 30;
w_rect = zeros(1,M);
w_hanning = zeros(1,M);
w_hamming = zeros(1,M);
w_blackman = zeros(1,M);

for n = 0:1:M-1
        w_rect(n+1) = 1;
        w_hanning(n+1) = 0.5 - 0.5 * cos(2*pi*n/(M-1));
        w_hamming(n+1) = 0.54 - 0.46 * cos(2*pi*n/(M-1));
        w_blackman(n+1)= 0.42 - 0.5 * cos(2*pi*n/(M-1)) + 0.08 * cos(4*pi*n/(M-1));
end

f_w_rect = abs(freqz(w_rect));
f_w_hanning = abs(freqz(w_hanning));
f_w_hamming = abs(freqz(w_hamming));
f_w_blackman = abs(freqz(w_blackman));

subplot(2,2,1);stem(linspace(0,M-1,M),w_rect); grid on;title('Rectangular window');
subplot(2,2,2);stem(linspace(0,M-1,M),w_hanning); grid on;title('Hanning window');
subplot(2,2,3);stem(linspace(0,M-1,M),w_hamming); grid on;title('Hamming window');
subplot(2,2,4);stem(linspace(0,M-1,M),w_blackman); grid on;title('Blackman window');

figure;
hold on;
plot(linspace(0,M-1,M),w_rect,'--'); grid on;
plot(linspace(0,M-1,M),w_hanning,'--'); grid on;
plot(linspace(0,M-1,M),w_hamming,'--'); grid on;
plot(linspace(0,M-1,M),w_blackman,'--'); grid on;
hold off;
title('Comparison of Windows for FIR filter');
legend('Rectangular Window','Hanning Window','Hamming Window','Blackman Window');

figure;
subplot(2,2,1);plot(linspace(0,1,512),20*log10(f_w_rect)); grid on;title('Rectangular window Freq Transform');
subplot(2,2,2);plot(linspace(0,1,512),20*log10(f_w_hanning)); grid on;title('Hanning window Freq Transform');
subplot(2,2,3);plot(linspace(0,1,512),20*log10(f_w_hamming)); grid on;title('Hamming window Freq Transform');
subplot(2,2,4);plot(linspace(0,1,512),20*log10(f_w_blackman)); grid on;title('Blackman window Freq Transform');