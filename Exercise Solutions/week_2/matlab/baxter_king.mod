var
    Y       ${Y}$       (long_name = 'Output')
    I       ${I}$       (long_name = 'Capital accumulation')
    C       ${C}$       (long_name = 'Consumption')
    TR      ${TR}$      (long_name = 'Government transfers')

    N       ${N}$       (long_name = 'Hours worked')
    K       ${K}$       (long_name = 'Capital stock')

   %I_G     ${I_G}$     (long_name = 'Government capital accumulation')
   %K_G     ${K_G}$     (long_name = 'Government capital stock')
    G_B     ${G_B}$     (long_name = 'Government spending')
    
    r_G     ${r_G}$     (long_name = 'Real interest rate')
    r       ${r}$       (long_name = 'Rental rate of capital')
    w       ${w}$       (long_name = 'Wage')
    tau     ${tau}$     (long_name = 'Tax rate')
;

varexo
    epsilon_tau     ${epsilon_{tau}}$   (long_name = 'Policy shock to tax rate')
    epsilon_GB      ${epsilon_{GB}}$    (long_name = 'Policy shock to government spending')
   %epsilon_IG      ${epsilon_{IG}}$    (long_name = 'Policy shock to government investment')
;

parameters
    delta       ${delta}$       (long_name = 'Depreciation rate of capital')
    beta        ${beta}$        (long_name = 'Discount factor')
    theta_L     ${theta_L}$     (long_name = 'Labor dispreference parameter')
    
    A_bar       ${\bar{A}}$     (long_name = 'Total factor productivity')
    theta_K     ${theta_K}$     (long_name = 'Capital share of production')
   %theta_G     ${theta_G}$     (long_name = 'Productivity of public capital')
    gamma_X     ${gamma_X}$     (long_name = 'Growth rate of labor-augmenting technology')
    
    rho_GB      ${rho_{GB}}$    (long_name = 'AR(1) parameter for government spending')
    rho_tau     ${rho_{tau}}$   (long_name = 'AR(1) parameter for tax rate')
    
    G_B_bar     ${\bar{G_B}}$   (long_name = 'Steady state level of government spending')
    tau_bar     ${\bar{\tau}}$  (long_name = 'Steady state rate of taxation')
;

% Fixed parameters 
delta = 0.025;
gamma_X = 1.06;
rho_GB = 0.75;
rho_tau = 0.75;

% Calibrated parameters
r_G_ss = 1.065;
N_ss = 1 / 3;
Y_ss = 1;
w_ss = 2;
TR_ss = 0;
G_B_bar = 0.2 * Y_ss;
tau_bar = 0.22 * Y_ss;

tau_ss = tau_bar;
G_B_ss = G_B_bar;

beta = gamma_X / r_G_ss;
r_ss = (gamma_X / beta - (1 - delta)) / (1 - tau_ss);

theta_K = 1 - N_ss * w_ss / Y_ss;
K_ss = theta_K * Y_ss / r_ss;
I_ss = (gamma_X - 1 + delta) * K_ss;
C_ss = Y_ss - I_ss - G_B_ss;

theta_L = (1 - tau_ss) * w_ss / C_ss * (1 - N_ss);
A_bar = Y_ss / K_ss ^ theta_K / N_ss ^ (1 - theta_K);

model;

[name = 'Law of motion of capital']
gamma_X * K = (1 - delta) * K(-1) + I;

%[name = 'Law of motion of public capital']
%gamma_X * K_G = (1 - delta) * K_G(-1) + I_G;

[name = 'Real interest rate']
gamma_X * C(1) / C = beta * r_G;

[name = 'Labor supply curve']
(1 - tau) * w = theta_L * C / (1 - N);

[name = 'Euler equation']
gamma_X * C(1) / C = beta * (1 - delta) + (1 - tau(1)) * r(1);

[name = 'Production function']
Y = A_bar * K(-1) ^ theta_K * N ^ (1 - theta_K); % * K_G(-1) ^ theta_G;

[name = 'Labor demand']
w * N = (1 - theta_K) * Y;

[name = 'Capital demand']
r * K(-1) = theta_K * Y;

[name = 'Government budget constraint']
TR = tau * (w * N + r * K(-1)) - G_B; % - I_G;

[name = 'Government spending rule']
G_B - G_B_bar = rho_GB * (G_B(-1) - G_B_bar) + epsilon_GB;

%[name = 'Government investment rule']
%I_G - I_G_bar = rho_IG * (I_G(-1) - I_G_bar) + epsilon_IG;

[name = 'Tax rule']
log(tau / tau_bar) = rho_tau * log(tau(-1) / tau_bar) + epsilon_tau;

[name = 'Market clearing']
Y = C + I + G_B; % + I_G;

end;

shocks;
var epsilon_tau; stderr 0.01;
var epsilon_GB; stderr 0.01;
end;


initval;

r_G = r_G_ss;
r = r_ss;
w = w_ss;
tau = tau_ss;

Y = Y_ss;
C = C_ss;
I = I_ss;
K = K_ss;
N = N_ss;

G_B = G_B_ss;
TR = TR_ss;

end;
check;
steady;

stoch_simul(irf=20, order=1, nograph) Y C I TR N K tau G_B r_G r w;
