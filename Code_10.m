% Clear the current figure
clf;

% Define the numerator and denominator coefficients of the system
num = [1, -4, 3];
den = [1, 1.7, -1];

% Set the number of samples for computing the impulse response
N = 250; % Reduced N to a smaller value

% Calculate the impulse response of the system
h = impz(num, den, N + 1);


% Initialize a variable to accumulate the sum of absolute values
parsum = 0;

% Iterate through the impulse response samples
for k = 1:N + 1

    % Accumulate the absolute values
    parsum = parsum + abs(h(k));

    % Check if the absolute value of h(k) is below a threshold
    if abs(h(k)) < 10^(-6)
        break; % Exit the loop if convergence is reached
    end
end

% Plot the impulse response (plot a subset, e.g., the first 100 samples)
n = 0:N;
stem(n(1:100), h(1:100))
xlabel('Time index n');
ylabel('Amplitude');

% Print the value of abs(h(k)) to indicate convergence
disp('Value =');
disp(abs(h(k)));

%check if system is sttable or unstable based on poles
poles = roots(den);
is_stable = all(abs(poles) < 1);
if is_stable
    disp('The system is stable.');
else
    disp('The system is unstable.');
end
