%Polar NRZ-L (Level)
% positive voltage for one symbol and negative for the other
clc;
close all;
clear;

b=input('Binary data: ','s')-'0';
n=length(b);
t=0:0.01:n;

for i=1:n
 if(b(i)==0)
   bp(i)=1;
 else
   bp(i)=-1;
endif
end

for j=1:n
  bw(j*100:(j+1)*100)=bp(j);
end

bw=bw(100:end);

subplot(1,1,1)
plot(t,bw);
axis([0 n -2 +2]);
grid on;
title('Polar NRZ-Level')
