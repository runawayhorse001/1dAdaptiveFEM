function u=fem1d(elem,node,Nquad,Nbasis)
[ a, f ] = assemble (elem,node,Nquad,Nbasis);
u = a\f; 