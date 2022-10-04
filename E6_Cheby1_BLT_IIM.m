%% Title: Design Low pass IIR Chebyshev type-1 Filter
% Aim: To Design a Low pass butterworth filter using Impulse Invariance
% method for the following specifications:
%        0.707 <= |H(e^jw)| <= 1   ... for 0 <= w <= 0.2*pi
%                 |H(e^jw)| <= 0.1 ... for 0.5*pi <= w <= pi

close,clear,clc;
% <------ Part A: Using IIM Method ------>
delta_p = 0.707;
Ap = -20*log10(delta_p);

delta_s = 0.1;
As = -20*log10(delta_s);

wp = 0.2*pi;
ws = 0.5*pi;

Ts = 1;
Fs = 1/Ts;

ohm_p = wp/Ts;
ohm_s = ws/Ts;

% order of filter
[N,ohm_c] = cheb1ord(ohm_p,ohm_s,Ap,As,'s');

% Filter coefficients
[Bn, An] = cheby1(N,Ap,ohm_c,'s');

% H(s)
Hs = tf(Bn,An)

[num, den] = impinvar(Bn,An,Fs);

% H(z) filter function
Hz = tf(num,den,Ts)

% Magnitude Response
w = 0:pi/32:pi;
Hw = freqz(num,den,w);
Hw_mag = abs(Hw);

% Pole-Zero plot
subplot(1,2,2);
zplane(Bn,An);
title('Pole zero plot of H(z)')
grid on

subplot(1,2,1);
plot(w/pi,Hw_mag,'k')
title('Magnitude Response')
grid on
hold on
% <------ Part B: Using BLT Method ------>
BLT_ohm_p = (2/Ts)*tan(wp/2);
BLT_ohm_s = (2/Ts)*tan(ws/2);

% order of filter
[N2,BLT_ohm_c] = cheb1ord(BLT_ohm_p,BLT_ohm_s,Ap,As,'s');

% Filter coefficients
[Bn2, An2] = cheby1(N2,Ap,BLT_ohm_c,'s');

% H(s)
Hs = tf(Bn2,An2)

[num2, den2] = bilinear(Bn2,An2,Fs);

% H(z) filter function
Hz2 = tf(num2,den2,Ts)

% Magnitude Response
w = 0:pi/32:pi;
Hw2 = freqz(num2,den2,w);
Hw2_mag = abs(Hw2);

subplot(1,2,1);
plot(w/pi,Hw2_mag,'r')
title('Magnitude Response')
legend('IIM','BLT')
grid on
hold off