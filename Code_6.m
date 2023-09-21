% Clear the workspace and close any existing figures
clear;
clf;
close all;

% Define the signal length
signal_length = 100;

% Generate time indices
time_indices = 0:signal_length-1;

% Define the impulse response and input sequence (unit step)
impulse_response = [1 ones(1, signal_length-1)];
input_sequence = [1 ones(1, signal_length-1)];

% Calculate the convolution
convolution_result = conv(impulse_response, input_sequence);

% Calculate the length of the output
output_length = length(impulse_response) + length(input_sequence) - 1;

% Generate time indices for the output
output_indices = 0:output_length-1;

% Create subplots
figure;

% Plot the input sequence
subplot(3, 1, 1);
stem(time_indices, input_sequence, 'filled');
xlabel('Time index n');
ylabel('Amplitude');
title('Input Sequence');

% Plot the impulse response
subplot(3, 1, 2);
stem(time_indices, impulse_response, 'filled');
xlabel('Time index n');
ylabel('Amplitude');
title('Impulse Response');

% Plot the output obtained by convolution
subplot(3, 1, 3);
stem(output_indices, convolution_result, 'filled');
xlabel('Time index n');
ylabel('Amplitude');
title('Output Obtained by Convolution');


