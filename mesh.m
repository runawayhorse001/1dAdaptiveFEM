function [elem,node]=mesh(left,right,Nelem)
node=linspace(left,right,Nelem+1);
elem=[1:Nelem;2:Nelem+1];