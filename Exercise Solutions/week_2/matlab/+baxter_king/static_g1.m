function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = baxter_king.static_g1_tt(T, y, x, params);
end
g1 = zeros(11, 11);
g1(1,2)=(-1);
g1(1,6)=params(6)-(1-params(1));
g1(2,8)=(-params(2));
g1(3,3)=(-(params(3)/(1-y(5))));
g1(3,5)=(-(y(3)*params(3)/((1-y(5))*(1-y(5)))));
g1(3,10)=1-y(11);
g1(3,11)=(-y(10));
g1(4,9)=(-(1-y(11)));
g1(4,11)=y(9);
g1(5,1)=1;
g1(5,5)=(-(T(1)*getPowerDeriv(y(5),1-params(5),1)));
g1(5,6)=(-(T(2)*params(4)*getPowerDeriv(y(6),params(5),1)));
g1(6,1)=(-(1-params(5)));
g1(6,5)=y(10);
g1(6,10)=y(5);
g1(7,1)=(-params(5));
g1(7,6)=y(9);
g1(7,9)=y(6);
g1(8,4)=1;
g1(8,5)=(-(y(11)*y(10)));
g1(8,6)=(-(y(11)*y(9)));
g1(8,7)=1;
g1(8,9)=(-(y(6)*y(11)));
g1(8,10)=(-(y(11)*y(5)));
g1(8,11)=(-(y(10)*y(5)+y(6)*y(9)));
g1(9,7)=1-params(7);
g1(10,11)=T(3)-params(8)*T(3);
g1(11,1)=1;
g1(11,2)=(-1);
g1(11,3)=(-1);
g1(11,7)=(-1);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
