%% Project 2, Part 4
% File for making plots
% Run this file after simulation

figure;

% Plot Isq
subplot(5, 3, 1);
plot(Isq(:,1), Isq(:,2));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
hold on;
plot(Isq_est(:,1), Isq_est(:,2), '--');
ylabel('I_{sq} & I_{sq, est} [A]');
ylim([-1200, 5000]);
xlim([5, 10]);
legend('I_{sq}', 'I_{sq, est}', 'Location', 'southeast');
title('Scheme 1');
subplot(5, 3, 2);
plot(Isq(:,1), Isq(:,3));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
hold on;
plot(Isq_est(:,1), Isq_est(:,3), '--');
ylim([-1200, 5000]);
xlim([5, 10]);
legend('I_{sq}', 'I_{sq, est}', 'Location', 'southeast');
title('Scheme 2');
subplot(5, 3, 3);
plot(Isq(:,1), Isq(:,4));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
hold on;
plot(Isq_est(:,1), Isq_est(:,4), '--');
ylim([-1200, 5000]);
xlim([5, 10]);
legend('I_{sq}', 'I_{sq, est}', 'Location', 'northeast');
title('Scheme 3');

% Plot theta_err
subplot(5, 3, 4);
plot(theta_err(:,1), theta_err(:,2));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
ylabel('\theta_{err} [rad]');
ylim([-0.02, 0.5]);
xlim([5, 10]);
xlabel('Time [second]');
subplot(5, 3, 5);
plot(theta_err(:,1), theta_err(:,3));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
ylim([-0.02, 0.5]);
xlim([5, 10]);
xlabel('Time [second]');
subplot(5, 3, 6);
plot(theta_err(:,1), theta_err(:,4));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
ylim([-0.02, 0.5]);
xlim([5, 10]);
xlabel('Time [second]');

% Plot Electromagentic Torque
subplot(5, 3, [7, 8, 9]);
plot(Tem(:,1), Tem(:,2));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
hold on;
plot(Tem(:,1), Tem(:,3));
plot(Tem(:,1), Tem(:,4));
plot(Tload(:,1), Tload(:,2), '--');
ylabel('Torque [Nm]')
xlim([5, 10]);
legend('T_{em}, Scheme 1', 'T_{em}, Scheme 2', 'T_{em}, Scheme 3', 'T_{load}', 'Location', 'southeast');

% Plot Mechanical Rotation Speed
subplot(5, 3, [10, 11, 12]);
plot(w_mech(:,1), w_mech(:,2));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
hold on;
plot(w_mech(:,1), w_mech(:,3));
plot(w_mech(:,1), w_mech(:,4));
ylabel('\omega_{mech} [rad/s]')
xlim([5, 10]);
legend('\omega_{mech}, Scheme 1', '\omega_{mech}, Scheme 2', '\omega_{mech}, Scheme 3', 'Location', 'southeast')

% Plot Isq
subplot(5, 3, [13, 14, 15]);
plot(Isq(:,1), Isq(:,2));
ax = gca;
ax.XTick = [5, 6, 7, 8, 9, 10];
ax.XTickLabel = {'0','1','2','3','4', '5'};
hold on;
plot(Isq(:,1), Isq(:,3));
plot(Isq(:,1), Isq(:,4));
ylabel('I_{sq} [A]')
xlim([5, 10]);
legend('I_{sq}, Scheme 1', 'I_{sq}, Scheme 2', 'I_{sq}, Scheme 3', 'Location', 'southeast')
xlabel('Time [second]')
