%% function compute_mi(X, Y, k )
% [ I1,nx,ny ] = compute_mi(X, Y, k=2)
% input: X,Y
% output: MI of the 2 sequences.

function I = compute_mi(X, Y, k )
N = size(X,1);
data = [X Y];
[ kid, ~ ] = knnsearch(data,data,'dist','chebychev','K',k+1);
kid = kid( :, 2:end );
nx = max(0,getnx( X, kid ));
ny = max(0,getnx( Y, kid ));
I = psi(k) - 1/k - sum(psi(nx) + psi(ny)) / N + psi(N);