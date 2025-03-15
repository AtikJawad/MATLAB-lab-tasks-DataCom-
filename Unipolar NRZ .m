%Unipolar NRZ
clear;
clc;
close all;
b =input('Enter Binary Data: ', 's') - '0';
n = length(b);
t = 0:.01:n;

for i=1:n
  bw(i*100:(i+1)*100)=b(i);
end

bw=bw(100:end);

subplot(1,1,1)
plot(t,bw, 'linewidth',2);
axis([0 n 0 +2])
grid on;
title('Unipolar NRZ');
