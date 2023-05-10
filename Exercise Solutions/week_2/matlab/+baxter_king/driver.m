%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'baxter_king';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('baxter_king.log');
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'epsilon_tau'};
M_.exo_names_tex(1) = {'{epsilon_{tau}}'};
M_.exo_names_long(1) = {'Policy shock to tax rate'};
M_.exo_names(2) = {'epsilon_GB'};
M_.exo_names_tex(2) = {'{epsilon_{GB}}'};
M_.exo_names_long(2) = {'Policy shock to government spending'};
M_.endo_names = cell(11,1);
M_.endo_names_tex = cell(11,1);
M_.endo_names_long = cell(11,1);
M_.endo_names(1) = {'Y'};
M_.endo_names_tex(1) = {'{Y}'};
M_.endo_names_long(1) = {'Output'};
M_.endo_names(2) = {'I'};
M_.endo_names_tex(2) = {'{I}'};
M_.endo_names_long(2) = {'Capital accumulation'};
M_.endo_names(3) = {'C'};
M_.endo_names_tex(3) = {'{C}'};
M_.endo_names_long(3) = {'Consumption'};
M_.endo_names(4) = {'TR'};
M_.endo_names_tex(4) = {'{TR}'};
M_.endo_names_long(4) = {'Government transfers'};
M_.endo_names(5) = {'N'};
M_.endo_names_tex(5) = {'{N}'};
M_.endo_names_long(5) = {'Hours worked'};
M_.endo_names(6) = {'K'};
M_.endo_names_tex(6) = {'{K}'};
M_.endo_names_long(6) = {'Capital stock'};
M_.endo_names(7) = {'G_B'};
M_.endo_names_tex(7) = {'{G_B}'};
M_.endo_names_long(7) = {'Government spending'};
M_.endo_names(8) = {'r_G'};
M_.endo_names_tex(8) = {'{r_G}'};
M_.endo_names_long(8) = {'Real interest rate'};
M_.endo_names(9) = {'r'};
M_.endo_names_tex(9) = {'{r}'};
M_.endo_names_long(9) = {'Rental rate of capital'};
M_.endo_names(10) = {'w'};
M_.endo_names_tex(10) = {'{w}'};
M_.endo_names_long(10) = {'Wage'};
M_.endo_names(11) = {'tau'};
M_.endo_names_tex(11) = {'{tau}'};
M_.endo_names_long(11) = {'Tax rate'};
M_.endo_partitions = struct();
M_.param_names = cell(10,1);
M_.param_names_tex = cell(10,1);
M_.param_names_long = cell(10,1);
M_.param_names(1) = {'delta'};
M_.param_names_tex(1) = {'{delta}'};
M_.param_names_long(1) = {'Depreciation rate of capital'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'{beta}'};
M_.param_names_long(2) = {'Discount factor'};
M_.param_names(3) = {'theta_L'};
M_.param_names_tex(3) = {'{theta_L}'};
M_.param_names_long(3) = {'Labor dispreference parameter'};
M_.param_names(4) = {'A_bar'};
M_.param_names_tex(4) = {'{\bar{A}}'};
M_.param_names_long(4) = {'Total factor productivity'};
M_.param_names(5) = {'theta_K'};
M_.param_names_tex(5) = {'{theta_K}'};
M_.param_names_long(5) = {'Capital share of production'};
M_.param_names(6) = {'gamma_X'};
M_.param_names_tex(6) = {'{gamma_X}'};
M_.param_names_long(6) = {'Growth rate of labor-augmenting technology'};
M_.param_names(7) = {'rho_GB'};
M_.param_names_tex(7) = {'{rho_{GB}}'};
M_.param_names_long(7) = {'AR(1) parameter for government spending'};
M_.param_names(8) = {'rho_tau'};
M_.param_names_tex(8) = {'{rho_{tau}}'};
M_.param_names_long(8) = {'AR(1) parameter for tax rate'};
M_.param_names(9) = {'G_B_bar'};
M_.param_names_tex(9) = {'{\bar{G_B}}'};
M_.param_names_long(9) = {'Steady state level of government spending'};
M_.param_names(10) = {'tau_bar'};
M_.param_names_tex(10) = {'{\bar{\tau}}'};
M_.param_names_long(10) = {'Steady state rate of taxation'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 11;
M_.param_nbr = 10;
M_.orig_endo_nbr = 11;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 11;
M_.eq_nbr = 11;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 4 0;
 0 5 0;
 0 6 15;
 0 7 0;
 0 8 0;
 1 9 0;
 2 10 0;
 0 11 0;
 0 12 16;
 0 13 0;
 3 14 17;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Law of motion of capital' ;
  2 , 'name' , 'Real interest rate' ;
  3 , 'name' , 'Labor supply curve' ;
  4 , 'name' , 'Euler equation' ;
  5 , 'name' , 'Production function' ;
  6 , 'name' , 'Labor demand' ;
  7 , 'name' , 'Capital demand' ;
  8 , 'name' , 'Government budget constraint' ;
  9 , 'name' , 'Government spending rule' ;
  10 , 'name' , 'Tax rule' ;
  11 , 'name' , 'Market clearing' ;
};
M_.mapping.Y.eqidx = [5 6 7 11 ];
M_.mapping.I.eqidx = [1 11 ];
M_.mapping.C.eqidx = [2 3 4 11 ];
M_.mapping.TR.eqidx = [8 ];
M_.mapping.N.eqidx = [3 5 6 8 ];
M_.mapping.K.eqidx = [1 5 7 8 ];
M_.mapping.G_B.eqidx = [8 9 11 ];
M_.mapping.r_G.eqidx = [2 ];
M_.mapping.r.eqidx = [4 7 8 ];
M_.mapping.w.eqidx = [3 6 8 ];
M_.mapping.tau.eqidx = [3 4 8 10 ];
M_.mapping.epsilon_tau.eqidx = [10 ];
M_.mapping.epsilon_GB.eqidx = [9 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [6 7 11 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(10, 1);
M_.endo_trends = struct('deflator', cell(11, 1), 'log_deflator', cell(11, 1), 'growth_factor', cell(11, 1), 'log_growth_factor', cell(11, 1));
M_.NNZDerivatives = [40; -1; -1; ];
M_.static_tmp_nbr = [2; 1; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.025;
delta = M_.params(1);
M_.params(6) = 1.06;
gamma_X = M_.params(6);
M_.params(7) = 0.75;
rho_GB = M_.params(7);
M_.params(8) = 0.75;
rho_tau = M_.params(8);
r_G_ss = 1.065;
N_ss = 1 / 3;
Y_ss = 1;
w_ss = 2;
TR_ss = 0;
M_.params(9) = 0.2*Y_ss;
G_B_bar = M_.params(9);
M_.params(10) = Y_ss*0.22;
tau_bar = M_.params(10);
tau_ss = tau_bar;
G_B_ss = G_B_bar;
M_.params(2) = M_.params(6)/r_G_ss;
beta = M_.params(2);
r_ss = (gamma_X / beta - (1 - delta)) / (1 - tau_ss);
M_.params(5) = 1-N_ss*w_ss/Y_ss;
theta_K = M_.params(5);
K_ss = theta_K * Y_ss / r_ss;
I_ss = (gamma_X - 1 + delta) * K_ss;
C_ss = Y_ss - I_ss - G_B_ss;
M_.params(3) = w_ss*(1-tau_ss)/C_ss*(1-N_ss);
theta_L = M_.params(3);
M_.params(4) = Y_ss/K_ss^M_.params(5)/N_ss^(1-M_.params(5));
A_bar = M_.params(4);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
M_.Sigma_e(2, 2) = (0.01)^2;
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(8) = r_G_ss;
oo_.steady_state(9) = r_ss;
oo_.steady_state(10) = w_ss;
oo_.steady_state(11) = tau_ss;
oo_.steady_state(1) = Y_ss;
oo_.steady_state(3) = C_ss;
oo_.steady_state(2) = I_ss;
oo_.steady_state(6) = K_ss;
oo_.steady_state(5) = N_ss;
oo_.steady_state(7) = G_B_ss;
oo_.steady_state(4) = TR_ss;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
oo_.dr.eigval = check(M_,options_,oo_);
steady;
options_.irf = 20;
options_.nograph = true;
options_.order = 1;
var_list_ = {'Y';'C';'I';'TR';'N';'K';'tau';'G_B';'r_G';'r';'w'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('baxter_king_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('baxter_king_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('baxter_king_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('baxter_king_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('baxter_king_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('baxter_king_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('baxter_king_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
