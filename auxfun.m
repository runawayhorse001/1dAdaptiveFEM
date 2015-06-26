function [ area, nodeIndx, Nelem, elem, Nnode, node ]=auxfun(elem,node)
  %[ area, indx, nel, node, nunk, xc ] = geometry ( nnodes, nx )
  Nnode=size(node,2);
  Nelem=size(elem,2);
  area=(node(elem(2,:))-node(elem(1,:)));
  nodeIndx=(1:Nnode);