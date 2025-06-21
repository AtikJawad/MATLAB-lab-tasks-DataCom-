
t = 0:0.01:10;  %creates a time vector from 0 to 10 in steps of 0.01


y = sin(t);                
y_leading = sin(t + pi/4);   % + pi/4 means the wave is shifted left → it starts earlier → leading
y_lagging = sin(t - pi/4);   % - pi/4 means the wave is shifted right → it starts later → lagging


subplot(3,1,1);
plot(t, y, 'b', 'LineWidth', 2); % Plots the original wave in blue.
grid on;
axis([0 n -1.5 1.5]);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Original Sine Wave'); 
  

subplot(3,1,2);
plot(t, y_leading, 'r--', 'LineWidth', 2); %Plots the leading sine wave in red dashed line.
grid on;
axis([0 n -1.5 1.5]);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Sine Wave with 45° Leading Phase Shift');


subplot(3,1,3);
plot(t, y_lagging, 'g:', 'LineWidth', 2); % Plots the lagging sine wave in green dotted line.
grid on;
axis([0 n -1.5 1.5]);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Sine Wave with 45° Lagging Phase Shift');
