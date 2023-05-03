var 
    x
;

varexo
    epsilon
;

parameters
    theta 
    phi
;

theta = 0.4;
phi = 0.4;

model;
x - theta * x(-1) = epsilon - theta * epsilon(-1);
end;

shocks;
var epsilon; stderr 1;
end;

steady_state_model;

x = 0;
lag_eps = 0;

end;
steady;
check;

stoch_simul(periods=200, order=1, irf=0);

figure;
subplot(2, 1, 1);
plot(x(51:end));
title('$x_t$', 'Interpreter', 'latex')
subplot(2, 1, 2)
plot(oo_.exo_simul(51:end));
title('$\varepsilon_t$', 'Interpreter', 'latex')