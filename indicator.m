function eta=indicator(elem,node,u,Nquad)

[ nquad, xquad, wquad ] = quad( Nquad, elem, node );
[ area, nodeIndx, Nelem, elem, Nnode, node ]=auxfun(elem,node);

eta=area.^2.*sum(wquad.*rhsfun(xquad).^2,1);
