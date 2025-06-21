clc;
close all;
clear;

b=input('enter binary: ', 's')-'0';
n=length(b);

t=0:0.01:n;

b(b==0)=-1;

for i=1:n
  bw(i*100:(i+1)*100)=b(i);
end

bw=bw(100:end);

sint1=sin(2*pi*t);

cos2=cos(2*pi*5*t);

for i=1:length(bw)
  if(bw(i)==-1)
    bm(i)=sint1(i);
  else
    bm(i)=cos2(i);
endif
end

subplot(2,1,1)
plot(t,bw)
grid on;
axis([0 n -2 +2])
title("BINARY WAVE")

subplot(2,1,2)
plot(t,bm)
grid on;
axis([0 n -2 +2])
title("NON coherent FSK")



