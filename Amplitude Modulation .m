clc; %clears the command window
clear; %clears all variable from the workspace
close all; %closes all open figures

t=0:0.01:5; %Time vector with .01 intervals from 0 to 5

Amplitude=5; %given

%Modulating Signal
m=5*sin(2*pi*2*t);

%Carrier Signal
c=5*sin(2*pi*40*t);

%Modulated signal
y=m.*c;

subplot(3,1,1)
plot(t,m)
grid on;
title("Modulating Signal")
xlabel('time--->')
ylabel('Amplitude--->')

subplot(3,1,2)
plot(t,c)
grid on;
title("Carrier Signal")
xlabel('time--->')
ylabel('Amplitude--->')

subplot(3,1,3)
plot(t,y)
grid on;
title("Modulated Signal")
xlabel('time--->')
ylabel('Amplitude--->')


