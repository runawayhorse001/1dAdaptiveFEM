function [ bi, dbidx ] = bf_linear ( i, x, xc )

%  BF_LINEAR evaluates a linear basis function and derivative at a given point X.
%
%  [ bi, dbidx ] = bf_linear ( i, x, xc )
%
%  I is the index of the basis function.
%  X(*) contains the coordinates of one or more points.
%  XC is the set of node coordinates.
%
%  BI(*) is the value of the I-th linear basis function at every X.
%  DBIDX(*) is the value of the derivative of the I-th basis function at every X.
%

%
%  For each X, LEFT is the index of the XC that is just to the left of it.
%
  left = bracket ( x, xc );

  for j = 1 : length ( x )

    if ( left(j) < i-1 )

      bi(j)    = 0.0;
      dbidx(j) = 0.0;

    elseif ( left(j) == i-1 )

      bi(j)    = ( x(j) - xc(i-1) ) / ( xc(i) - xc(i-1) );
      dbidx(j) =   1.0              / ( xc(i) - xc(i-1) );

    elseif ( left(j) == i )

      bi(j)    = ( xc(i+1) - x(j) ) / ( xc(i+1) - xc(i) );
      dbidx(j) =           - 1.0    / ( xc(i+1) - xc(i) ); 

    else

      bi(j)    = 0.0;
      dbidx(j) = 0.0;

    end

  end

 
