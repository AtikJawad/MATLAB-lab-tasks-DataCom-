%Bipolar AMI (Alternate Mark Inversion)

%the “0” symbol is represented by zero voltage and
%the “1” symbol alternates between +V and –V
clc;
close all;
clear;

b=input('Binary data: ','s')-'0';
n=length(b);
t=0:0.01:n;

for i=1:n
  bw(i*100:(i+1)*100)=b(i);
end
bw=bw(100:end);

subplot(2,1,1)
plot(t,bw, 'linewidth',2);
axis([0 n 0 +1]);
grid on;
title('Binary wave')

lastbit=1;
for i= 1:n
 if(b(i)==1)
  x(i*100:(i+1)*100)=lastbit;
  lastbit=-lastbit;
 else
  x(i*100:(i+1)*100)=0;
 endif
end

x=x(100:end);

subplot(2,1,2)
plot(t,x, 'linewidth',2);
axis([0 n -1 +1]);
grid on;
title('Bipolar AMI')








