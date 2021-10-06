%% FUNCTION: direct_len
%  Find the best length to get the max(I) for the given s.
function [lbest, Ibest] = direct_len( lb, ub, delta_l, X, Y, k, s, l, tau)
tot_len = size( X, 1 );
e = min( s+l-1, tot_len );
% fprintf("s:%d l: %d e:%d\n",s,l,e);
lbest = lb;
Ibest = compute_mi_delay(X, Y, k, s, lb, tau);
% fprintf("Ibest: %f s:%d lbest: %d tau:%d\n", Ibest, s, lbest, tau);
while ( ub - lb > delta_l )
%     fprintf("lb: %d  ub: %d\n", lb, ub);
    sl = floor( lb + (ub-lb)/6);
    su = floor( ub - (ub-lb)/6);
    edl = min(e, s+sl-1);
    edu = min(e, s+su-1);
%     fprintf("edl %d edu %d\n", edl, edu);
    Il = compute_mi_delay(X, Y, k, s, edl-s+1, tau);
    Iu = compute_mi_delay(X, Y, k, s, edu-s+1, tau);
%     fprintf("Il %f %d %d %d\n  Iu %f\n", Il, s, edl-s+1, tau, Iu);
    if( Il > Iu )
        if Ibest < Il
            Ibest = Il;
            lbest = sl;
        end
        ub = su;
    else
        if Ibest < Iu
            Ibest = Iu;
            lbest = su;
        end
        lb = sl;
    end
%     fprintf("Ibest: %f s:%d lbest: %d tau:%d\n", Ibest, s, lbest, tau);
%     fprintf("lb: %d  ub: %d\n", lb, ub);
end

end