function  I = compute_mi_delay(X, Y, k, s, l, tau)
    tot_len = size(X,1);
    XX = X( s: s+l-1 );
    if s + tau < 1
        YY = [randn( 1 - (s+tau), 1 ); Y( 1 : s+tau + l - 1 )];
    elseif s+tau + l -1 > tot_len
        YY = [Y( s+tau : tot_len); randn(l - ( tot_len - (s+tau) + 1), 1 )];
    else
        YY = Y( s+tau: s+tau + l - 1 );
    end
    I = compute_mi(XX, YY, k );
end