% 1d fem main function
clc;clear all;
%% parameters 
left=0;right=1;
disp('The Adaptive Finite Element Method for Iterface Problems')
fprintf('Nelem     Linfty          L2            H1\n')
%for Nelem=2.^[ 2 3 4 5 6 7 8];
Nelem=32;
Nbasis=2; % 2: linear basis; 3: quadratic 
Nquad=2; %  Number of quadrate nodes
theta=0.01;
maxIt=10;
vecL2=zeros(1,maxIt);vecH1=zeros(1,maxIt);
%% mesh generation 
%[elem,node]=mesh(left,right,Nelem);
elem=[1 2;2 3];
node=[0 1/pi 1];
 %[ nquad, xquad, wquad ] = quad( Nquad, elem, node )
 %%  Adaptive Finite Element Method
% *SOLVE* -> *ESTIMATE* -> *MARK* -> *REFINE*
for k = 1:maxIt
    % Step 1: SOLVE
    u=fem1d(elem,node,Nquad,Nbasis);
    % get errors
   [Linfty, L2, H1]=femerror(elem,node,u,Nbasis);   
   vecL2(k)=L2;vecH1(k)=H1;
   Nelem=size(elem,2);
   fprintf('%3d    %e  %e    %e\n',Nelem,Linfty,L2,H1)
    % Step 2: ESTIMATE
    eta=indicator(elem,node,u,Nquad);     
    % Step 3: MARK
   indexRefine=mark(elem,eta,theta);
    % Step 4: REFINE
    [elem, node]=refine(elem,node,indexRefine);
end
%[ uex, uexx ] = exact ( node );
%% visualization
% figure
% plot(1:maxIt,vecL2,'r-o',1:maxIt,vecH1,'b-*')
% figure
% plot(1:maxIt,vecH1,'b-*')
% lh=legend('$L^2$ norm error','$H^1$ norm error',2');
%   set(lh,'Box','off','Interpreter','latex');
figure
plot(1:maxIt,vecH1,'b-*')
lh=legend('$H^1$ norm error',2');
set(lh,'Box','off','Interpreter','latex')