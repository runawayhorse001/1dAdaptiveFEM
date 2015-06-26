function left = bracket ( x, xc )
% 
%  left = bracket ( x, xc )
%
%  BRACKET finds the biggest XC that is less than or equal to each X.
%
%  X(*) contains one or more values we are trying to bracket.
%  XC(NX) contains a set of fixed nodes.
%
%  LEFT(*) contains, for every X, the index of an entry of XC that is
%    just to the left of X.  (However, entries of X that are less than
%    XC(1) get LEFT = 1.)
%
  n = length ( x );
  nx = length ( xc );

  for i = 1 : n

    if ( x(i) <= xc(2) )

      left(i) = 1;

    elseif ( xc(nx-1) <= x(i) )

      left(i) = nx-1;

    else

      idata = 2;
      while ( xc(idata+1) < x(i) )
        idata = idata + 1;
      end
      left(i) = idata;

    end

  end



