function index=mark(elem,eta,theta)

Nelem=size(elem,2);
Toleta=sum(eta);
index=find(eta>theta*Toleta);