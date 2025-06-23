%A sine wave or a sinusoid is a mathematical curve that describes a smooth periodic oscillation.
%In contrast, a triangle wave is a non-sinusoidal periodic waveform named for its triangular shape.
%Sawtooth waves can be created by adding a sufficient number of sine waves. This process is referred to as "Additive Synthesis."
%The more sine waves that are added, the closer the resemblance to a sawtooth wave formed from the composition of sine waves.
%The equation for a sawtooth wave as a composition of sine waves is given below:

%𝑦 = sin(2𝜋𝑓𝑡) − 1/2 sin(2𝜋2𝑓𝑡)+ 1/3 sin(2𝜋3𝑓𝑡) − ⋯

%Add five sine waves to form the sawtooth wave. Use a For loop.
%The result must show all the individual sine waves as well as the final sawtooth wave.

clc;
clear;
close all;

% Time vector
t = 0:0.001:1;

% Fundamental frequency
f = 50;

SawTooth = 0;

lastbit= 1; %for determining plus and minus in the sum

% Generating sine-waves with Additive Synthesis
for i = 1:5
    sine_wave = lastbit * (1/i) * sin(2*pi*i*f*t);
    SawTooth = SawTooth + sine_wave;

    lastbit=-lastbit; %for determining plus and minus in the sum

    subplot(6,1,i); % plotting each sine wave
    plot(t, sine_wave);
    title(["Sine Wave ", num2str(i)])
    xlabel('time')
    ylabel('Amplitude');
    grid on;
end

% Plot the final square wave
subplot(6,1,6);
plot(t, SawTooth,'r');
title('SawTooth Wave(Sum of 5 sine waves)');
xlabel('Time');
ylabel('Signal x(t)');
grid on;
