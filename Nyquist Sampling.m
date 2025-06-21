clc;
clear;
close all;

% Define original signal frequency
f_signal = 5; % Hz

% Time vector for continuous signal (high resolution)
t_cont = 0:0.001:1;
y_cont = sin(2 * pi * f_signal * t_cont);  % Original continuous sine wave

% --- Case 1: Sampling at Nyquist Rate (2 * f_signal) ---
fs_nyquist = 2 * f_signal;  % Nyquist sampling frequency
t_nyq = 0:1/fs_nyquist:1;
y_nyq = sin(2 * pi * f_signal * t_nyq);

% --- Case 2: Sampling at less than Nyquist Rate (1/4 * f_signal) ---
fs_low = f_signal / 4;  % Too low sampling frequency
t_low = 0:1/fs_low:1;
y_low = sin(2 * pi * f_signal * t_low);

% ----------- Plotting -----------

% Original Signal
subplot(3,1,1);
plot(t_cont, y_cont);
title('Original Continuous Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Nyquist Sampling
subplot(3,1,2);
stem(t_nyq, y_nyq,'filled');
hold on;
plot(t_cont, y_cont);
title('Sampling at Nyquist Rate (2 × f)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Below Nyquist Sampling
subplot(3,1,3);
stem(t_low, y_low,'filled');
hold on;
plot(t_cont, y_cont, 'b--');
title('Sampling at Less than Nyquist Rate (¼ × f)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
