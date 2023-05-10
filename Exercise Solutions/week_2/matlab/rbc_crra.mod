var
    %Aggregate Variables
    Y       ${Y}$       (long_name='Output')
    C       ${C}$       (long_name='Consumption')
    I       ${I}$       (long_name='Captial accumulation')
    N       ${N}$       (long_name='Time spent in work (pct)')

    %Factor inputs
    L       ${L}$       (long_name='Time spend in leisure (pct)')
    K       ${K}$       (long_name='Capital')

    %Prices
    r       ${r}$       (long_name='Rental rate of capital')
    w       ${w}$       (long_name='Average hourly wage')

    %Exogenous
    A       ${A}$       (long_name='Technology shocks')
;

varexo
    epsilon_A
;

parameters
    alpha   ${alpha}$       (long_name='Capital share in production')
    beta    ${beta}$        (long_name='Discount factor')
    delta   ${delta}$       (long_name='Depreciation rate')
    gamma   ${gamma}$       (long_name='Consumption weight in utility')
    psi     ${psi}$         (long_name='Leisure weight in utility')
    eta_C   ${eta_C}$       (long_name='Arrow-Pratt risk aversion')
    eta_L   ${eta_L}$       (long_name='Elasticity of leisure?')
    rho_A   ${rho_A}$       (long_name='AR(1) coefficient in technology')
    sigma_A ${sigma_A}$     (long_name='Standard deviation of technology shocks')
;

alpha = 0.33;
beta = 0.98;
delta = 0.035;
gamma = 1;
eta_C = 1.5;
eta_L = 2.0;
psi = 1.452;
rho_A = 0.95;
sigma_A = 0.01;

model;

[name = 'Household labor supply']
w = psi / gamma * L ^ (-eta_L) * C ^ eta_C;

[name = 'Euler equation']
(C(+1) / C) ^ eta_C = beta * (r(+1) + 1 - delta);

[name = 'Law of motion of capital']
K = (1 - delta) * K(-1) + I;

[name = 'Time constraint']
1 = N + L;

[name = 'Firm demand for capital']
r = alpha * Y / K(-1);

[name = 'Firm demand for labor']
w = (1 - alpha) * Y / N;

[name = 'Production function']
Y = A * K(-1) ^ alpha * N ^ (1 - alpha);

[name = 'AS-AD Equlibrium']
Y = C + I;

[name = 'Law of motion of technology']
log(A) = rho_A * log(A(-1)) + epsilon_A;

end;

% Use the log model ss values as starting values
initval;

A = 1;
r = 1 / beta - (1 - delta);
w = (1 - alpha) * (alpha / r) ^ (alpha / (1 - alpha));
Y = gamma / psi * w / (1 + (1 - alpha) * gamma / psi - alpha * delta / r);
C = gamma / psi * (w - (1 - alpha) * Y);
I = alpha * delta * Y / r;
K = alpha * Y / r;
N = (1 - alpha) * Y / w;
L = 1 - N;

end;
check;
steady;

    
