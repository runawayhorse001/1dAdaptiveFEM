function [ phi, Dphi ] = gradbasis ( ib,ie,x,elem, node)

elemi=elem(:,ie);
xi=elemi(1);
xj=elemi(2);

if ib==1
    phi=(node(xj)-x)/(node(xj)-node(xi));
    Dphi=-1/(node(xj)-node(xi));
elseif ib==2
    phi=(x-node(xi))/(node(xj)-node(xi));
    Dphi=1/(node(xj)-node(xi));
end
 