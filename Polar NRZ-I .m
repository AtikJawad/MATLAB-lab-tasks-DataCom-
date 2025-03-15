%NRZ-I নিয়ম:-
% 0 বিট: লেভেল অপরিবর্তিত থাকে।
% 1 বিট: লেভেল উল্টে যায় (যদি +1 থাকে → -1 হবে, -1 থাকলে → +1 হবে)।

%Polar NRZ-I (Inverse)
%Inversion (NRZ-I) - the change or lack of change in
%polarity determines the value of a symbol.
%E.g. a “1” symbol inverts the polarity a “0” does not.

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
for j=1:n
  if(b(j)==1)
   x(j*100:(j+1)*100)=-lastbit;
   lastbit=-lastbit;
  else
   x(j*100:(j+1)*100)=lastbit;
  endif
end

x=x(100:end);

subplot(2,1,2)
plot(t,x, 'linewidth',2);
axis([0 n -2 +2]);
grid on;
title('Polar NRZ-I Encoded')






