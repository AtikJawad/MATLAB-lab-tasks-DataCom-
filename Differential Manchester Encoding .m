%Only Transition at start of a bit period represents zero.
% • No transition at start of a bit period represents one.
% • Diff. Manchester requires two signal changes to represent “0” and one signal change to represent “1”
clc;
clear;
close all;

b=input('Enter binary Data: ', 's')-'0';
n=length(b);
t=0:0.01:n;

lastbit=1;

for i=1:n
  if(b(i)==1)
    x(i*100:(i*100)+50)=lastbit;
    lastbit=-lastbit;
    x((i*100)+50:(i+1)*100)=lastbit;
  else
    lastbit=-lastbit;
    x(i*100:(i*100)+50)=lastbit;
    lastbit=-lastbit;
    x((i*100)+50:(i+1)*100)=lastbit;
  endif
end


x=x(100:end);

subplot(1,1,1)
plot(t,x, 'linewidth',2)
grid on;
axis([0 n -2 +2])
title('Differential Manchester');

