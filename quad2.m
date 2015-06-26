function [ nq, xq, wq ] = quad2 ( nel, node, xc )
%
%  [ nq, xq, wq ] = quad2 ( nel, node, xc )
%
%  QUAD2 sets up a two point quadratrue rule.
%
%  NEL, the number of elements;
%  NODE, the nodes that belong to each element;
%  XC, the location of the nodes.
%
%  NQ, the number of quadrature points per element:
%  XQ, the location of the quadrature points;
%  WQ, the quadrature weight.
%
  nq = 2;
% 
%  Set the location of the quadrature points in each element.
%
  a = 0.5773502692;

  for it = 1 : nel
    ip1 = node(it,1);
    ip2 = node(it,2); 
    x1 = xc(ip1);
    x2 = xc(ip2); 
    xq(it,1) = ( ( +a + 1.0 ) * x1 + ( -a + 1.0 ) * x2 ) / 2.0; 
    xq(it,2) = ( ( -a + 1.0 ) * x1 + ( +a + 1.0 ) * x2 ) / 2.0;
  end 
% 
%  Set the quadrature weights.
%
  wq = 0.5;
