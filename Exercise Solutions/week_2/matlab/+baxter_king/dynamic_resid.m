function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = baxter_king.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(11, 1);
lhs = params(6)*y(9);
rhs = (1-params(1))*y(1)+y(5);
residual(1) = lhs - rhs;
lhs = params(6)*y(15)/y(6);
rhs = params(2)*y(11);
residual(2) = lhs - rhs;
lhs = (1-y(14))*y(13);
rhs = y(6)*params(3)/(1-y(8));
residual(3) = lhs - rhs;
lhs = params(6)*y(15)/y(6);
rhs = (1-params(1))*params(2)+(1-y(17))*y(16);
residual(4) = lhs - rhs;
lhs = y(4);
rhs = T(1)*T(2);
residual(5) = lhs - rhs;
lhs = y(13)*y(8);
rhs = y(4)*(1-params(5));
residual(6) = lhs - rhs;
lhs = y(1)*y(12);
rhs = y(4)*params(5);
residual(7) = lhs - rhs;
lhs = y(7);
rhs = y(14)*(y(13)*y(8)+y(1)*y(12))-y(10);
residual(8) = lhs - rhs;
lhs = y(10)-params(9);
rhs = params(7)*(y(2)-params(9))+x(it_, 2);
residual(9) = lhs - rhs;
lhs = log(y(14)/params(10));
rhs = params(8)*log(y(3)/params(10))+x(it_, 1);
residual(10) = lhs - rhs;
lhs = y(4);
rhs = y(10)+y(5)+y(6);
residual(11) = lhs - rhs;

end
