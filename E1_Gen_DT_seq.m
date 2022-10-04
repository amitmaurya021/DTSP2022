%% DTSP EXP 1: To generate the discrete time sequences
% Title: To generate the discrete time sequences of -
% (a) Unit impulse sequence
% (b) Unit Step sequence
% (c) Unit Ramp sequence
% (d) Exponential sequence
% (e) Sinewave sequence
% (f) Cosine sequence
clear;
clc;
close all;
% Program: (a) Unit impulse sequence
time_a = -2:1:2;
impulse = [zeros(1,2), 1 , zeros(1,2)];
subplot(3,2,1);
stem(time_a,impulse,"filled",'r');
xlabel('Time (n)')
ylabel('Amplitude')
title('Unit Impulse Sequence')

% Program: (b) Unit Step sequence
N = 4; % number of samples
time_b = 0:1:N-1;
unit_step = ones(1,N);
subplot(3,2,2); 
stem(time_b,unit_step,"filled",'g');
xlabel('Time (n)')
ylabel('Amplitude')
title('Unit Step Sequence')

% Program: (c) Unit Ramp sequence
unit_ramp = time_b;
subplot(3,2,3); 
stem(time_b,unit_ramp,"filled",'c');
xlabel('Time (n)')
ylabel('Amplitude')
title('Unit Ramp Sequence')

% Program: (d) Exponential sequence
time_d = 0:0.1:5;
exponential = exp(time_d);
subplot(3,2,4); 
stem(time_d,exponential,"filled",'m');
xlabel('Time (n)')
ylabel('Amplitude')
title('Unit Exponential Sequence')

% Program: (e) Sinewave sequence
time_e = 0:0.1:1;
sinewave = sin(2*pi*time_e);
subplot(3,2,5); 
stem(time_e,sinewave,"filled");
xlabel('Time (n)')
ylabel('Amplitude')
title('Unit Sinewave Sequence')

% Program: (f) Cosinewave sequence
time_e = 0:0.1:1;
cosinewave = cos(2*pi*time_e);
subplot(3,2,6); 
stem(time_e,cosinewave,"filled",'k');
xlabel('Time (n)')
ylabel('Amplitude')
title('Unit Cosinewave Sequence')