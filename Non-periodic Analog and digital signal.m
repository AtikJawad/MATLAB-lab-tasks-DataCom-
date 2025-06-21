t = 0:0.01:5;

analog_signal = exp(-t) .* sin(2*pi*t); % Non-periodic analog signal
digital_signal = randi([0 1], size(t)); % Non-periodic digital signal

% Plotting part (b)
figure;

subplot(2,1,1);
plot(t, analog_signal);
title('Non-periodic Analog Signal');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(t, digital_signal);
title('Non-periodic Digital Signal');
xlabel('Time'); ylabel('Value');
grid on;
