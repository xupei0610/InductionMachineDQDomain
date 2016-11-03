%% Project 2, Part 3
% File for making plots
% Run this file after simulation

figure;

% Plot Mechanical Rotation Speed
subplot(4, 1, 2);
plot(w_mech(:,1), w_mech(:,2));
hold on;
plot(w_mech(:,1), w_mech(:,3));
ylabel('\omega_{mech} [rad/s]')
legend('\omega_{mech} with Compensation', '\omega_{mech} without Compensation', 'Location', 'southeast')

% Plot Electromagentic Torque
subplot(4, 1, 1);
plot(Tem(:,1), Tem(:,2));
hold on;
plot(Tem(:,1), Tem(:,3));
plot(Tload(:,1), Tload(:,2), '--');
ylabel('Torque [Nm]')
legend('T_{em} with Compensation', 'T_{em} without Compensation', 'T_{load}', 'Location', 'southeast');

% Plot Isq
subplot(4, 1, 3);
plot(I_sq(:,1), I_sq(:,2));
hold on;
plot(I_sq(:,1), I_sq(:,3));
ylabel('I_{sq} [A]')
legend('I_{sq} with Compensation', 'I_{sq} without Compensation', 'Location', 'southeast')

% Plot Isd
subplot(4, 1, 4);
plot(I_sd(:,1), I_sd(:,2));
hold on;
plot(I_sd(:,1), I_sd(:,3));
ylabel('I_{sd} [A]')
legend('I_{sd} with Compensation', 'I_{sd} without Compensation', 'Location', 'southeast')
xlabel('Time [second]')