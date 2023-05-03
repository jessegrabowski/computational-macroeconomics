function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = baxter_king.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(11, 19);
g1(1,5)=(-1);
g1(1,1)=(-(1-params(1)));
g1(1,9)=params(6);
g1(2,6)=(-(params(6)*y(15)))/(y(6)*y(6));
g1(2,15)=params(6)/y(6);
g1(2,11)=(-params(2));
g1(3,6)=(-(params(3)/(1-y(8))));
g1(3,8)=(-(y(6)*params(3)/((1-y(8))*(1-y(8)))));
g1(3,13)=1-y(14);
g1(3,14)=(-y(13));
g1(4,6)=(-(params(6)*y(15)))/(y(6)*y(6));
g1(4,15)=params(6)/y(6);
g1(4,16)=(-(1-y(17)));
g1(4,17)=y(16);
g1(5,4)=1;
g1(5,8)=(-(T(1)*getPowerDeriv(y(8),1-params(5),1)));
g1(5,1)=(-(T(2)*params(4)*getPowerDeriv(y(1),params(5),1)));
g1(6,4)=(-(1-params(5)));
g1(6,8)=y(13);
g1(6,13)=y(8);
g1(7,4)=(-params(5));
g1(7,1)=y(12);
g1(7,12)=y(1);
g1(8,7)=1;
g1(8,8)=(-(y(14)*y(13)));
g1(8,1)=(-(y(14)*y(12)));
g1(8,10)=1;
g1(8,12)=(-(y(1)*y(14)));
g1(8,13)=(-(y(14)*y(8)));
g1(8,14)=(-(y(13)*y(8)+y(1)*y(12)));
g1(9,2)=(-params(7));
g1(9,10)=1;
g1(9,19)=(-1);
g1(10,3)=(-(params(8)*1/params(10)/(y(3)/params(10))));
g1(10,14)=1/params(10)/(y(14)/params(10));
g1(10,18)=(-1);
g1(11,4)=1;
g1(11,5)=(-1);
g1(11,6)=(-1);
g1(11,10)=(-1);

end
