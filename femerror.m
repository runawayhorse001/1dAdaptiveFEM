function [Linfty, L2, H1]=femerror(elem,node,u,Nbasis)
[ area, nodeIndx, Nelem, elem, Nnode, node ]=auxfun(elem,node);
 [Linfty, L2, H1 ] = fe_error ( area, nodeIndx, Nelem, Nbasis, elem', u, node );