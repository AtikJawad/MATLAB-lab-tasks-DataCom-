%A square wave consists of a fundamental sine wave and odd harmonies of the fundamental frequency. 
%Generate a square wave with five odd frequencies. The composite square wave will be the summation of these sine waves.
%Use same amplitude for each of the sine waves. Use for loop. The result must show all the sine waves as well as the final square wave.

clc;
clear;
close all;

% Time vector
t = 0:0.001:1; % 1 second duration with high resolution

% Fundamental frequency
f = 5; % Hz
A = 1; % Amplitude of each sine wave
num_harmonics = 5; % First five odd harmonics (1st, 3rd, 5th, 7th, 9th)

% Store individual harmonics
square_wave = 0;

% Generate harmonics and add to square_wave
for k = 1:num_harmonics
    n = 2*k - 1; % odd harmonics: 1, 3, 5, 7, 9
    sine_wave = A * sin(2*pi*f*n*t);
    square_wave = square_wave + sine_wave;

    subplot(num_harmonics+1,1,k); % plot each harmonic
    plot(t, sine_wave);
    title(["Harmonic", num2str(n)])
    ylabel('Amplitude');
    grid on;
end

% Plot the final square wave
subplot(num_harmonics+1,1,num_harmonics+1);
plot(t, square_wave);
title('Composite Square Wave (Sum of 5 Odd Harmonics)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
