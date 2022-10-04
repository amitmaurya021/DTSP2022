%%Title: To compute DFT and IDFT of given DT sequence
%Aim: To find the the DFT of given DT sequence x(n) and verify the answer
%by computing its IDFT

clear;clc;

% xn = [1,1,1,1];
% xn = [2,2,1,1];
% xn = [1,2,3,4,5,6,7,8];
xn = [1,2,3,4]
%xn = input('Enter input sequence x(n) = ')

N = length(xn); % N=4
xk = zeros(1,N);
ixk = zeros(1,N);
%Range of k = 0 to 3
%Range of n = 0 to 3
%  X(k=0) = x(0)*exp(0) + x(1)*exp(0) + x(2)*exp(0) + x(3)*exp(0)

%  X(k=1) = x(0)*exp(-2*pi*n*(1)/(4)) + x(1)*exp(-2*pi*n*(1)/(4)) + x(2)*exp(-2*pi*n*(1)/(4)) 
%                + x(3)*exp(-2*pi*n*(1)/(4))

%  X(2)   = x(0)*exp(-2*pi*n*(2)/(4)) + x(1)*exp(-2*pi*n*(2)/(4)) + x(2)*exp(-2*pi*n*(2)/(4)) 
%                + x(3)*exp(-2*pi*n*(2)/(4))

%  X(3)   = x(0)*exp(-2*pi*n*(3)/(4)) + x(1)*exp(-2*pi*n*(3)/(4)) + x(2)*exp(-2*pi*n*(3)/(4)) 
%                + x(3)*exp(-2*pi*n*(3)/(4))

% X(k) = [X(1), X(2), X(3), x(4)]
%DFT Computation
for k = 1:N
    for n = 1:N
        xk(k) = xk(k) + xn(n)*exp(-j*2*pi*(n-1)*(k-1)/N);
    end
end
xk
%IDFT Computation
for n = 1:N
    for k = 1:N
        ixk(n) = ixk(n) + xk(k)*exp(j*2*pi*(n-1)*(k-1)/N);
    end
end
ixk = ixk./N
