function phase_portrait(x,a,b,c,includeVoltageTrace, customTitle)
%  PHASE_PORTRAIT Function takes X as an argument to decide parameters for Hopf (x =1) or
% 
% Saddle Node on Invariant Cycle (x=2), a b and c are initial current, increment, 
% and final current
% 
% includeVoltageTrace, (true/false) if true will include a plot of the voltage 
% traces for the current values of the selected simulation parameters
params1 = [0.04 4.0 2.0 30.0 120.0 84.0 -60.0 8.0 2.0 -1.2 18.0 20.0];  % Hopf parameters
params2 = [ 0.067 4.4 12 17.4 120.0 84.0 -60.0 8.0 2.0 -1.2 18.0 20.0]; % SNIC parameters
% select Hopf or SNIC parameters
if x == 1
    params = params1;
    defaultTitle = "Phase Portrait- Morris-Lecar Model Hopf Bifuraction";
end
if x == 2
    params = params2;
    defaultTitle = "Phase Portait - Morris-Lecar Model SNIC Bifurcation";
end
    % Use custom title if provided, otherwise use default title
if nargin > 5 && ~isempty(customTitle)
        titleText = customTitle;
else
        titleText = defaultTitle;
end
% Set up time parameters
t0 = 0.0;       % Initial time
dt = 0.001;     % Time step
t_max = 1000.0; % Maximum time
% Set up parameters
phi = params(1);  % 0.04 Hopf, 0.067 SNIC
g_ca = params(2); % 4.0 HOPF , 4.4 SNIC
v3 = params(3);   % 2 for HOPF, 12 for SNIC
v4 = params(4);   % 30 for HOPF, 17.4 for SNIC
e_ca = params(5);
e_k = params(6);
e_l = params(7);
g_k = params(8);
g_l = params(9);
v1 = params(10);
v2 = params(11);
c_m = params(12);
% Set up applied current range
I_app_range = a:b:c; % Range of applied current values
% Initialize variables
t = t0:dt:t_max;
V = zeros(length(I_app_range), length(t));
n = zeros(length(I_app_range), length(t));
% Simulate the model for different I_app values
for i = 1:length(I_app_range)
    I_app = I_app_range(i); % Update I_app for each iteration
    % Set initial conditions
    V(i, 1) = -20;
    n(i, 1) = 0.01;
    % Simulate selected model 
    for j = 2:length(t)
        minf = 0.5 * (1 + tanh((V(i, j-1) - v1) / v2)); % m infinite
        Taun = 1.0 / cosh((V(i, j-1) - v3) / v4);       % Tau for N
        ninf = 0.5 * (1 + tanh((V(i, j-1) - v3) / v4)); % n infinite
        dvdt = (1 / c_m) * (I_app - g_l * (V(i, j-1) - e_l) - g_k * n(i, j-1) * (V(i, j-1) + e_k) - g_ca * minf * (V(i, j-1) - e_ca));
        dndt = phi * (ninf - n(i, j-1)) / Taun;
        V(i, j) = V(i, j-1) + dvdt * dt;
        n(i, j) = n(i, j-1) + dndt * dt;
    end
end
% Plot the phase portraits
figure;
hold on;
colors = colormap(jet(length(I_app_range))); % Generate colors for each I_app value
for i = 1:length(I_app_range) % loop over current ranges
    plot(V(i, :), n(i, :), 'Color', colors(i, :));
end
xlabel('Membrane Potential (V)');
ylabel('Gating Variable (n)');
title(titleText);
grid on;
% Plot voltage trace if includeVoltageTrace is true
if includeVoltageTrace
    figure;
    hold on;
    for i = 1:length(I_app_range)
        plot(t, V(i, :), 'Color', colors(i, :));
    end
    xlabel('Time');
    ylabel('Membrane Potential (V)');
    title('Voltage Traces for Applied Currents');
    legend(cellstr(num2str(I_app_range', 'I_{app} = %d')));
    grid on;
end
hold off;
end