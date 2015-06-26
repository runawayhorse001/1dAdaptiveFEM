function [linfty,el2, eh1 ] = fe_error ( area, indx, nel, nnodes, node, u, xc )
%
%  [ el2, eh1 ] = fe_error ( area, f, indx, nel, nnodes, node, u, xc )
%
%  FE_ERROR computes the L2 and H1 errors in the finite element solution.
%
%  AREA is the "area" of each element.
%  INDX(NX) contains the finite element coefficient associated with each node.
%  NEL is the number of elements.
%  NNODES is the number of nodes.
%  NODE(NEL,NNODES) contains the nodes that belong to each element.
%  U is the set of finite element coefficients that define the solution.
%  XC is the set of node locations.
%
%  EL2 is the L2 error between the exact and finite element solutions.
%  EH1 is the H1 error between the exact and finite element solutions.
%

%
%  Get the two point quadrature rule.
%
[ u_e, ~ ] = exact ( xc );
  [ nq, xq, wq ] = quad2 ( nel, node, xc );
  
  el2 = 0.0;
  eh1 = 0.0;

  for it = 1 : nel 
 
    for iq = 1 : nq
%
%  Go to the quadrature point X.
%
      x = xq(it,iq);
%
%  Evaluate the finite element solution UH and its derivative UHX at X.
%
      [ u_h, dudx_h ] = fe_linear ( u, x, xc );
%
%  Evaluate the exact solution UEX and its derivative UEXX at X.
%
      [ u_exact, dudx_exact ] = exact ( x );
%
%  Add this information to the approximate integrals.
%      
      el2 = el2 + wq * area(it) * ( u_h - u_exact )^2;
      eh1 = eh1 + wq * area(it) * ( dudx_h - dudx_exact )^2;

    end

  end
  linfty=max(abs(u-u_e'));
  el2 = sqrt ( el2 );
  eh1 = sqrt ( eh1 );
