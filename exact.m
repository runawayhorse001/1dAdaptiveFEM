function [ uex, uexx ] = exact ( x )
%
%  [ uex, uexx ] = exact ( x )
%
%  EXACT returns the value of the exact solution U and its derivative dU/dX at X.
%
%  X(*) is the point or points of evaluation.
%
%  UEX(*) is the value of U at X.
%  UEXX(*) is the value of dU/dX at X.
%
% 
% uex=x.^3;
% uexx=3*x.^2;
n=length(x);
for i=1:n
    if (x(i)<1/pi)
        uex(i)=-0.5*x(i)^2+(5*pi^2+1)/(2*pi*(pi+1))*x(i);
        uexx(i)=-x(i)+(5*pi^2+1)/(2*pi*(pi+1));
    else
        uex(i)=-0.25*x(i)^2 +(5*pi^2+1)/(4*pi*(pi+1))*x(i)-(5*pi-1)/(4*pi*(pi+1));
        uexx(i)=-0.5*x(i)+(5*pi^2+1)/(4*pi*(pi+1));
    end
end
%   uex=sqrt(x.^3);
%   uexx=1.5.*sqrt(x);
