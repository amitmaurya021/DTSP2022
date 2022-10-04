%% Title: Design Low pass IIR Butterworth Filter
% Aim: To Design a Low pass butterworth filter using Impulse Invariance
% method for the following specifications:
%        0.8 <= |H(e^jw)| <= 1   ... for 0 <= w <= 0.2*pi
%               |H(e^jw)| <= 0.2 ... for 0.6*pi <= w <= pi

close,clear,clc;
% Using IIM Method
delta_p = 0.8;              % Linear value
Ap = -20*log10(delta_p);    % dB value

delta_s = 0.2;              % Linear value
As = -20*log10(delta_s);    % dB value

wp = 0.2*pi;                % Passband frequency
ws = 0.6*pi;                % Stopband frequency

Ts = 1;                     % Sampling Period
Fs = 1/Ts;                  % Sampling frequency

% Relation between Analog frequencies and Digital frequencies in IIM
ohm_p = wp/Ts;
ohm_s = ws/Ts;

% order of filter
%[N,ohm_c] = buttord(ohm_p,ohm_s,Ap,As,'s');

%N = ceil(0.5*((log10((10^(0.1*As) - 1)/(10^(0.1*Ap) - 1)))/(log10((ohm_s)/(ohm_p)))));
N = ceil(0.5 * (log10((10^(0.1*As)-1)/(10^(0.1*Ap)-1)))/(log10((ohm_s)/(ohm_p))));

ohm_c = ohm_p/((10^(0.1*Ap) - 1)^(1/(2*N)));

% Filter coefficients
[Bn, An] = butter(N,ohm_c,'s');

% Analog filter transfer function H(s)
Hs = tf(Bn,An)
[num, den] = impinvar(Bn,An,Fs);    % IIM method

% Digital filter transfer function H(z)
Hz = tf(num,den,Ts)

% Magnitude Response
w = 0:pi/32:pi;
Hw = freqz(num,den,w);
Hw_mag = abs(Hw);

% Pole-Zero plot
subplot(1,2,2);
zplane(Bn,An);
title('Pole zero plot of H(z)')
grid on;

subplot(1,2,1);
plot(w/pi,Hw_mag)
title('Magnitude Response')
grid on;