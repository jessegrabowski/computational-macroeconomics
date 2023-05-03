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
M_.fname = 'rbc_crra';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbc_crra.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'epsilon_A'};
M_.exo_names_tex(1) = {'epsilon\_A'};
M_.exo_names_long(1) = {'epsilon_A'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'Y'};
M_.endo_names_tex(1) = {'{Y}'};
M_.endo_names_long(1) = {'Output'};
M_.endo_names(2) = {'C'};
M_.endo_names_tex(2) = {'{C}'};
M_.endo_names_long(2) = {'Consumption'};
M_.endo_names(3) = {'I'};
M_.endo_names_tex(3) = {'{I}'};
M_.endo_names_long(3) = {'Captial accumulation'};
M_.endo_names(4) = {'N'};
M_.endo_names_tex(4) = {'{N}'};
M_.endo_names_long(4) = {'Time spent in work (pct)'};
M_.endo_names(5) = {'L'};
M_.endo_names_tex(5) = {'{L}'};
M_.endo_names_long(5) = {'Time spend in leisure (pct)'};
M_.endo_names(6) = {'K'};
M_.endo_names_tex(6) = {'{K}'};
M_.endo_names_long(6) = {'Capital'};
M_.endo_names(7) = {'r'};
M_.endo_names_tex(7) = {'{r}'};
M_.endo_names_long(7) = {'Rental rate of capital'};
M_.endo_names(8) = {'w'};
M_.endo_names_tex(8) = {'{w}'};
M_.endo_names_long(8) = {'Average hourly wage'};
M_.endo_names(9) = {'A'};
M_.endo_names_tex(9) = {'{A}'};
M_.endo_names_long(9) = {'Technology shocks'};
M_.endo_partitions = struct();
M_.param_names = cell(9,1);
M_.param_names_tex = cell(9,1);
M_.param_names_long = cell(9,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'{alpha}'};
M_.param_names_long(1) = {'Capital share in production'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'{beta}'};
M_.param_names_long(2) = {'Discount factor'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'{delta}'};
M_.param_names_long(3) = {'Depreciation rate'};
M_.param_names(4) = {'gamma'};
M_.param_names_tex(4) = {'{gamma}'};
M_.param_names_long(4) = {'Consumption weight in utility'};
M_.param_names(5) = {'psi'};
M_.param_names_tex(5) = {'{psi}'};
M_.param_names_long(5) = {'Leisure weight in utility'};
M_.param_names(6) = {'eta_C'};
M_.param_names_tex(6) = {'{eta_C}'};
M_.param_names_long(6) = {'Arrow-Pratt risk aversion'};
M_.param_names(7) = {'eta_L'};
M_.param_names_tex(7) = {'{eta_L}'};
M_.param_names_long(7) = {'Elasticity of leisure?'};
M_.param_names(8) = {'rho_A'};
M_.param_names_tex(8) = {'{rho_A}'};
M_.param_names_long(8) = {'AR(1) coefficient in technology'};
M_.param_names(9) = {'sigma_A'};
M_.param_names_tex(9) = {'{sigma_A}'};
M_.param_names_long(9) = {'Standard deviation of technology shocks'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 9;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [1 2 5 6 7 9];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
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
 0 3 0;
 0 4 12;
 0 5 0;
 0 6 0;
 0 7 0;
 1 8 0;
 0 9 13;
 0 10 0;
 2 11 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [5; 7; 1; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Household labor supply' ;
  2 , 'name' , 'Euler equation' ;
  3 , 'name' , 'Law of motion of capital' ;
  4 , 'name' , 'Time constraint' ;
  5 , 'name' , 'Firm demand for capital' ;
  6 , 'name' , 'Firm demand for labor' ;
  7 , 'name' , 'Production function' ;
  8 , 'name' , 'AS-AD Equlibrium' ;
  9 , 'name' , 'Law of motion of technology' ;
};
M_.mapping.Y.eqidx = [5 6 7 8 ];
M_.mapping.C.eqidx = [1 2 8 ];
M_.mapping.I.eqidx = [3 8 ];
M_.mapping.N.eqidx = [4 6 7 ];
M_.mapping.L.eqidx = [1 4 ];
M_.mapping.K.eqidx = [3 5 7 ];
M_.mapping.r.eqidx = [2 5 ];
M_.mapping.w.eqidx = [1 6 ];
M_.mapping.A.eqidx = [7 9 ];
M_.mapping.epsilon_A.eqidx = [9 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [6 9 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(9, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [27; 24; -1; ];
M_.static_tmp_nbr = [5; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.33;
alpha = M_.params(1);
M_.params(2) = 0.98;
beta = M_.params(2);
M_.params(3) = 0.035;
delta = M_.params(3);
M_.params(4) = 1;
gamma = M_.params(4);
M_.params(6) = 1.5;
eta_C = M_.params(6);
M_.params(7) = 2.0;
eta_L = M_.params(7);
M_.params(5) = 1.452;
psi = M_.params(5);
M_.params(8) = 0.95;
rho_A = M_.params(8);
M_.params(9) = 0.01;
sigma_A = M_.params(9);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(9) = 1;
oo_.steady_state(7) = 1/M_.params(2)-(1-M_.params(3));
oo_.steady_state(8) = (1-M_.params(1))*(M_.params(1)/oo_.steady_state(7))^(M_.params(1)/(1-M_.params(1)));
oo_.steady_state(1) = M_.params(4)/M_.params(5)*oo_.steady_state(8)/(1+(1-M_.params(1))*M_.params(4)/M_.params(5)-M_.params(3)*M_.params(1)/oo_.steady_state(7));
oo_.steady_state(2) = M_.params(4)/M_.params(5)*(oo_.steady_state(8)-(1-M_.params(1))*oo_.steady_state(1));
oo_.steady_state(3) = M_.params(3)*M_.params(1)*oo_.steady_state(1)/oo_.steady_state(7);
oo_.steady_state(6) = M_.params(1)*oo_.steady_state(1)/oo_.steady_state(7);
oo_.steady_state(4) = (1-M_.params(1))*oo_.steady_state(1)/oo_.steady_state(8);
oo_.steady_state(5) = 1-oo_.steady_state(4);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
oo_.dr.eigval = check(M_,options_,oo_);
steady;
save('rbc_crra_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbc_crra_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbc_crra_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbc_crra_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbc_crra_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rbc_crra_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rbc_crra_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
