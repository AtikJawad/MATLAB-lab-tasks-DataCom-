clc; %clears the command window
clear; %clears all variable from the workspace
close all; %closes all open figures


%Fm must be at least 2*Fc

t=0:0.005:1; %Time vector with .01 intervals from 0 to 5

fc=10;
fm=20;

%Modulating Signal
m=5*sin(2*pi*fm*t);

%Carrier Signal
c=sin(2*pi*fc*t);

%Phase Modulated signal
PhaseDev= pi/2; %Defines the phase deviation
Pm = cos(2*pi*fc*t + PhaseDev*m);



subplot(3,1,1)
plot(t,m)
grid on;
title("Modulating Signal")
xlabel('time')
ylabel('Amplitude')

subplot(3,1,2)
plot(t,c)
grid on;
title("Carrier Signal")
xlabel('time--->')
ylabel('Amplitude--->')

subplot(3,1,3)
plot(t,Pm)
grid on;
title("Modulated Signal")
xlabel('time--->')
ylabel('Amplitude--->')

