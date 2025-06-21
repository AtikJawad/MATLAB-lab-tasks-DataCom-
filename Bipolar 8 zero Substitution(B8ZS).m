clc;
clear;
close all;

% Input binary sequence

input = [1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 1 0];
n=length(input);

% Initialize
output = [];  % Final encoded signal
last_polarity = 1;  % previous bit is positive (as per question)

i = 1;
while i <= n
    if i <= n - 7 && all(input(i:i+7) == 0)
        % Insert B8ZS violation pattern
        % Pattern: 000VB0VB (based on previous polarity)
        if last_polarity == 1
            % Previous was positive ->
            % pattern: 000+-0-+
            output = [output 0 0 0 1 -1 0 -1 1];
            last_polarity = 1; % Violations end with +1
        else
            % Previous was negative -> pattern: 000-+0+-
            output = [output 0 0 0 -1 1 0 1 -1];
            last_polarity = -1; % Violations end with -1
        endif
        i = i + 8;
    else
        if input(i) == 0
            output = [output 0];
        else
            % Alternate polarity for '1's
            last_polarity = -last_polarity;
            output = [output last_polarity];
        endif
        i = i + 1;
    endif
end

% Plotting
t = 0:1:length(output);

stairs(t, [output output(end)]); % Stairs is mostly like plot guys but plot need those stupid
                                 % for loop lines like (i+1)*100 to look like binary bits
axis([0 length(output) -2 +2])
grid on;
xlabel('Bit Index');
ylabel('Voltage Level');
title('B8ZS Line Encoding');



