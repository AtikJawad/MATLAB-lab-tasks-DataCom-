clc;
close all;
clear;

t=0:0.0001:1;

sig1=30*sin(2*pi*5*t);
sig2=20*sin(2*pi*10*t);
sig3=10*sin(2*pi*15*t);

car1=10*sin(2*pi*50*t);
car2=5*sin(2*pi*100*t);
car3=7*sin(2*pi*150*t);

res1=sig1.*car1;
res2=sig2.*car2;
res3=sig3.*car3;

res=res1+res2+res3;

subplot(4,1,1);
plot(t,sig1);
axis([0 1 -50 50])
grid on;

subplot(4,1,2);
plot(t,sig2);
axis([0 1 -50 50])
grid on;

subplot(4,1,3);
plot(t,sig3);
axis([0 1 -50 50])
grid on;

subplot(4,1,4);
plot(t,res);
axis([0 1 -200 200])
grid on;
