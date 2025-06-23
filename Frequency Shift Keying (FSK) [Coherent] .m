% In coherent FSK, the switch from one frequency signal 
% to the other only occurs at the same phase in the signal.

clear;
clc;
close all;
b=[0 1 0 1 1 1 0];
n=length(b);
t=0:0.01:n;
b(b==0)=-1;

for i= 1:n
  bm(i*100:(i+1)*100)=b(i);
  end
bm=bm(100:end);

sint1=sin(2*pi*t);
sint2=sin(2*pi*110*t);

for i=1:length(bm)
  if(bm(i)==-1)
    bw(i)=sint2(i);
  else
    bw(i)=sint1(i)
  endif
end

subplot(2,1,1)
plot(t,bm)
grid on;
axis([0 n -2 +2])
title('binary Signal')

subplot(2,1,2)
plot(t,bw)
grid on;
axis([0 n -2 +2])
title('Frequency Shifted Signal')



