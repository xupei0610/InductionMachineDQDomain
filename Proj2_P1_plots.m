%% Project 2, Part 1
% File for making plots
% Run this file after simulation

figure;

% Plot State Voltage
subplot(5, 2, [1, 2]);
plot(Vs(:,1), Vs(:,2));
title('Va [V]')
xlabel('Time [second]')

% Plot Stator Current
subplot(5, 2, 3);
plot(Ia(:,1), Ia(:,2));
title('dq Model');
ylabel('I_a [A]')
subplot(5, 2, 4);
plot(Ia(:,1), Ia(:,3));
title('abc Model');

% Plot Rotor Current
subplot(5, 2, 5);
plot(IA(:,1), IA(:,2));
ylabel('I_A [A]')
subplot(5, 2, 6);
plot(IA(:,1), IA(:,3));

% Plot Electromagentic Torque
subplot(5, 2, 7);
plot(Tem(:,1), Tem(:,2));
hold on;
plot(Tload(:,1), Tload(:,2), '--');
ylabel('T_{em} & T_{load} [Nm]')
legend('T_{em}', 'T_{load}', 'Location', 'southeast');
subplot(5, 2, 8);
plot(Tem(:,1), Tem(:,3));
hold on;
plot(Tload(:,1), Tload(:,2), '--');
legend('T_{em}', 'T_{load}', 'Location', 'southeast');

% Plot Mechanical Rotation Speed
subplot(5, 2, 9);
plot(w_mech(:,1), w_mech(:,2));
ylabel('\omega_{mech} [rad/s]')
xlabel('Time [second]')
subplot(5, 2, 10);
plot(w_mech(:,1), w_mech(:,3));
xlabel('Time [second]')
