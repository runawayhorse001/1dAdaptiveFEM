function [ nquad, xquad, wquad ] = quad( Nquad, elem, node )
 %Nnode=size(node,2);
 Nelem=size(elem,2);
 
 nquad=Nquad;
 xquad=zeros(Nquad,Nelem);
 wquad=zeros(Nquad,Nelem);
 
 for i=1:Nelem
     a=node(elem(1,i));
     b=node(elem(2,i));
     [xquad(:,i),wquad(:,i)]=lgwt(Nquad,a,b);
 end



