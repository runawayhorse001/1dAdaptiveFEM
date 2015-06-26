function [ u_h, dudx_h ] = fe_linear ( f, x, xc )

%  FE_LINEAR evaluates the finite element solution and derivative at every X.
%
%  [ u_h, dudx_h ] = fe_linear ( f, x, xc )
%
%  F(NX) is the finite element coefficients.
%  X(*) is the point or points at which to evaluate.
%  XC(NX) is the set of nodes.
%
%  U_H(*) is the value of U at every X.
%  DUDX_H(*) is the value of dUdX at every X.
%
  nt = length ( f );

  u_h = 0.0;
  dudx_h = 0.0; 

  for i = 1 : nt

    [ bi, dbidx ] = bf_linear ( i, x, xc );

    u_h =  u_h  + f(i) * bi;
    dudx_h = dudx_h + f(i) * dbidx; 

  end
