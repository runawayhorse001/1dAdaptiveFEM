function [ a, f ] = assemble (elem,node,Nquad,Nbasis)

 
 [ nquad, xquad, wquad ] = quad( Nquad, elem, node );
 
 [ area, nodeIndx, Nelem, elem, Nnode, node ]=auxfun(elem,node);
 
  a = zeros(Nnode,Nnode);
  f = zeros(Nnode,1);

 for ie=1:Nelem % elem loop
     for iq=1:nquad % quadrature loop
        x=xquad(iq,ie); w=wquad(iq,ie);
         for ib=1:Nbasis %basis loop
             i = elem(ib,ie);             
             [ phii, Dphii ] = gradbasis ( ib,ie,x,elem, node);
             rhs = rhsfun ( x );
             f(i) = f(i) + w* rhs * phii;
         
             for jb=1:Nbasis %basis loop
                 j = elem(jb,ie);
                 
                 [ ~, Dphij ] = gradbasis ( jb,ie,x,elem, node);
                 if (x<1/pi)
                 a(i,j) = a(i,j) + w* Dphij * Dphii;
                 else
                 a(i,j) = a(i,j) + 2*w* Dphij * Dphii;   
                 end
             end %end basis loop
         end %end basis loop
     end %end quadrature loop
 end  %end elem loop
 %  The first equation enforces the boundary condition at the left endpoint.
%
  a(1,1) = 1.0;
  a(1,2:Nnode) = 0.0;
  f(1) = 0.0;
%
%  The last equation enforces the boundary condition at the right endpoint.
%
  a(Nnode,1:Nnode-1) = 0.0;
  a(Nnode,Nnode) = 1.0;
  f(Nnode) = 1;