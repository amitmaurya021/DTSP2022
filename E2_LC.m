%% Title: Linear Convolution of discrete sequences
% Exp 2: To obtain the linear convolution of two finite length sequences

close all; clear, clc;
%x = input('Enter x(n): ');
%h = input('Enter h(n): ');
% x = [1,2,3,4,5];    
% h = [5,8,3,5,5,6];  
 x = [1,2,2,1] % input sequence
 h = [1,2,3]   % system response
m = length(x);
n = length(h);

% Pad Zeros to make length uniform
X = [x, zeros(1,n-1)];
H = [h, zeros(1,m-1)];
for i = 1:1:n+m-1
    Y(i)=0;
    for j =1:1:m
        if(i-j+1>0)
            Y(i)= Y(i)+X(j)*H(i-j+1);
        end
        
    end
end
Y
Y2 = conv(x,h)
subplot(4,1,1);
stem(X);
xlabel("n");
ylabel("Amplitude")
title("x(n)")
grid on;

subplot(4,1,2);
stem(H);
xlabel("n");
ylabel("Amplitude")
title("h(n)")
grid on;

subplot(4,1,3);
stem(Y);
xlabel("n");
ylabel("Amplitude")
title("y(n)")
grid on;

subplot(4,1,4);
stem(Y2);
xlabel("n");
ylabel("Amplitude")
title("y2(n)")
grid on;