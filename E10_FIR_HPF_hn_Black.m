%% Title: Design of a highpass FIR filter
% Aim: To design a highpass FIR filter using hamming window and rectangular
% window

clear; close all; clc;

M = 25; % Length of the window

w_rect = zeros(1,M);    % Intialising the window coefficients
w_hamming = zeros(1,M); % Intialising the window coefficients

if rem(M,2)==0  
    alpha_delay = M/2; % If M is even
else
    alpha_delay = (M-1)/2; % If M is odd
end

n = 0:1:M-1; % Time axis

% Filter specification of desired FIR filter
hd = (sin(pi*(n-alpha_delay))-sin((pi/4)*(n-alpha_delay)))./(pi*(n-alpha_delay)); % Desired infinite impulse response 

hd(alpha_delay + 1) = 0.75;

% Define windows to be used
for n = 0:1:M-1
        w_rect(n+1) = 1;    % Definition of rectangular window
        w_hamming(n+1) = 0.54 - 0.46 * cos(2*pi*n/(M-1)); % Definition of Hamming window
end

f_w_rect = abs(freqz(w_rect));      % Frequency transform of rectangular window
f_w_hamming = abs(freqz(w_hamming));% Frequency transform of Hamming window

hold on;
plot(linspace(0,M-1,M),w_rect,'--'); grid on;
plot(linspace(0,M-1,M),w_hamming,'--'); grid on;
hold off;
title('Comparison of Windows for FIR filter');
legend('Rectangular Window','Hamming Window');

figure;
subplot(2,2,1);plot(linspace(0,1,512),20*log10(f_w_rect)); grid on;title('Rectangular window Freq Transform');
subplot(2,2,3);plot(linspace(0,1,512),20*log10(f_w_hamming)); grid on;title('Hamming window Freq Transform');

% Caluclate final impulse response h(n) = hd(n) * w(n)
hn_rect = hd .* w_rect;
hn_hamming = hd .* w_hamming;

w = -pi:0.1:pi;

H_rect_freq = freqz(hn_rect,1,w);
subplot(2,2,2);plot(w/pi, (abs(H_rect_freq)));grid on;
title('Final Impulse response h(n)');xlabel('Normalised Frequency');ylabel('Magnitude Response');

H_hamming_freq = freqz(hn_hamming,1,w);
subplot(2,2,4);plot(w/pi, (abs(H_hamming_freq)),'r-');grid on;
title('Final Impulse response h(n)');xlabel('Normalised Frequency');ylabel('Magnitude Response');