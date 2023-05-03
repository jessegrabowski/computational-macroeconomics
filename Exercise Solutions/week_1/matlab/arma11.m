% State space matrices
THETA = 0.4;
PHI = 0.4;

A = [THETA -PHI; 0 0];
R = [1; 1];

% simulation
trajectory = zeros(2, 200);
for t = 2:200
    epsilon = random('Normal', 0, 1);
    trajectory(:, t) = A * trajectory(:, t-1) + epsilon * R;
end

% plotting
subplot(2,1,1)
plot(trajectory(1, 51:end));
title('$x_t$', 'Interpreter', 'latex')
subplot(2, 1, 2)
plot(trajectory(2, 51:end));
title('$\varepsilon_t$', 'Interpreter', 'latex')
