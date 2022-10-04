%% Title: Design of Low pass IIR Butterworth filter
% Aim: To design a low pass Butterworth filter using Impulse Invariance
% method and bilinear transformation method for the given specifications:
%           0.8 <= |H(e^jw)| <= 1   for ... 0 <= w <= 0.2*pi
%                  |H(e^jw)| <= 0.2 for ... 0.6*pi <= w <= pi

close, clear, clc;
% <------ Part A: Using IIM Method ------>
delta_p = 0.8;              % Linear value
Ap = -20*log10(delta_p);    % dB value

delta_s = 0.2;              % Linear value
As = -20*log10(delta_s);    % dB value

wp = 0.2*pi;    % Passband frequency
ws = 0.6*pi;    % Stopband frequency

Ts = 1;         % Sampling period
Fs = 1/Ts;

% Analog frequencies
ohm_p = wp/Ts;  % Relation between analog and digital frequencies for IIM method
ohm_s = ws/Ts;  % Relation between analog and digital frequencies for IIM method

% Order of filter
%[N, ohm_c] = buttord(ohm_p,ohm_s,Ap,As,'s');
%N = ceil(0.5*((log10((10^(0.1*As)-1)/(10^(0.1*Ap)-1)))/(log10((ohm_s)/(ohm_p)))));
N = ceil(0.5 * (log10((10^(0.1*As)-1)/(10^(0.1*Ap)-1)))/(log10((ohm_s)/(ohm_p))));

ohm_c = ohm_p/((10^(0.1*Ap) - 1)^(1/(2*N)));

% Filter coefficients
[B, A] = butter(N,ohm_c,'s');

% Analog filter transfer function H(s)
Hs = tf(B,A)

[num, den] = impinvar(B,A,Fs); % Impulse invariance method

% Digital filter transfer function H(z)
Hz = tf(num,den,Ts)

% Magnitude response of H(e^jw)
w = 0:pi/32:pi;
Hw = freqz(num,den,w);
Hw_mag = abs(Hw);

plot(w/pi,Hw_mag);
title('Magnitude response of H(e^jw)')
grid on;
hold on;

%<------ Part B: Using BLT method ------>
BLT_ohm_p = (2/Ts)*tan(wp/2); % Relation between analog and digital frequencies for BLT method
BLT_ohm_s = (2/Ts)*tan(ws/2); % Relation between analog and digital frequencies for BLT method

% Order of filter
%[N2,BLT_ohm_c] = buttord(BLT_ohm_p,BLT_ohm_s,Ap,As,'s');
N2 = ceil(0.5*((log10((10^(0.1*As)-1)/(10^(0.1*Ap)-1)))/(log10((BLT_ohm_s)/(BLT_ohm_p)))));
BLT_ohm_c = BLT_ohm_p/((10^(0.1*Ap)-1)^(1/(2*N2)));

[B2, A2] = butter(N2,BLT_ohm_c,'s');

% Analog filter transfer function H(s)
Hs2 = tf(B2,A2)

[num2, den2] = bilinear(B2,A2,Fs); % BLT method

% Digital filter transfer function H(z)
Hz2 = tf(num2,den2,Ts)

% Magnitude response of H(e^jw)
w = 0:pi/32:pi;
Hw2 = freqz(num2,den2,w);
Hw_mag2 = abs(Hw2);

plot(w/pi,Hw_mag2,'r');
legend('IIM','BLT');
grid on;
hold off;