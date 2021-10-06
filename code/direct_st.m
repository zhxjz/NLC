%% FUNCTION: direct_st 
%  Find the best starting point and length for the given CP(s,l,tau)
function [ sbest, lbest, Ibest ] = direct_st( lb, ub, delta_s, delta_l, X, Y, k, l, tau, L_min, L_max)
tot_len = size(X,1);
s = lb;
e = min(lb+l-1, tot_len);
% initialize
Ibest = compute_mi_delay(X, Y, k, lb, L_min, tau);
sbest = lb;
lbest = L_min;

while ( ub - lb > delta_s ) %delta_s= L_min*0.1
%     fprintf("lb: %d  ub: %d\n", lb, ub);
    sl = floor(lb + (ub-lb)/6);
    su = floor(ub - (ub-lb)/6);
    [ll, Il] = direct_len( L_min, min(L_max, e-sl+1), delta_l, X, Y, k, sl, l, tau);
    [lu, Iu] = direct_len( L_min, min(L_max, e-su+1), delta_l, X, Y, k, su, l, tau);
    if( Il > Iu )
        if ( Ibest < Il )
            Ibest = Il;
            sbest = sl;
            lbest = ll;
        end
        ub = su;
    else
        if ( Ibest < Iu )
            Ibest = Iu;
            sbest = su;
            lbest = lu;
        end
        lb = sl;
    end
%     fprintf("Ibest: %f sbest:%d lbest: %d tau:%d\n", Ibest, sbest, lbest, tau);
%     fprintf("lb: %d  ub: %d\n", lb, ub);
end
end
