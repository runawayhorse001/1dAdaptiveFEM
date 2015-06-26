function [elem, node]=refine(elem,node,indexRefine)

 refineElem= elem(:,indexRefine);
 sizeRefine=size(indexRefine,2);
 %Nnode=size(node,2);
 Nelem=size(elem,2);
 %% the node after refinement
 nodeTemp=(node(refineElem(1,:))+node(refineElem(2,:)))/2;
 node=sort([node nodeTemp]);
 %% the elem after refinement 
  NelemNew=Nelem+sizeRefine;
  elem=[1:NelemNew;2:NelemNew+1];
