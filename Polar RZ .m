%Polar RZ
%Each symbol has a transition in the middle. Either from
%high to zero or from low to zero
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

for j=1:n
  if(b(j)==1)
    x(j*100:(j*100)+50) = 1;
    x((j*100)+50:(j+1)*100) = 0; %High to Low (1 to -0)
  else
    x(j*100:(j*100)+50) = -1;
    x((j*100)+50:(j+1)*100) = 0; %Low to high (-1 to 0)
  endif
end

x=x(100:end);

subplot(2,1,2)
plot(t,x, 'linewidth',2);
axis([0 n -2 +2]);
grid on;
title('Polar RZ')





