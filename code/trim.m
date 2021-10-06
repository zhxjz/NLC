function CP = trim( CP, X, Y, k, miniL, theta0, L_max)
%     CP=[s, l, tau]
    tot_len = size(X,1);
    s = CP(1);
    e = min(CP(1)+CP(2)-1, tot_len);
    tau = CP(3);
    while( s+miniL-1 <=e )
        if compute_mi_delay(X, Y, k, s, miniL, tau)> theta0
            break;
        end
        s = s+miniL;
    end
    while( e-miniL+1 >=s)
        if compute_mi_delay(X, Y, k, e-miniL+1, miniL, tau)> theta0
            break;
        end
        e = e-miniL;
    end
    if e-s + 1 <= L_max
        diff = L_max - (e-s + 1);
        e = min(tot_len, e + floor(diff/2));
        s = s - floor(diff/2);
    end
    CP = [s, e-s+1, tau];
end