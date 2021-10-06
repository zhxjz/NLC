function CP0 = extending(X, Y, k, tau_min, tau_max, miniL, L_min, L_max, theta0 )
if( size(X,1) < size(X,2) )
    X = X';
end
if( size(Y,1) < size(Y,2) )
    Y = Y';
end
totlen = size(X,1);
s = 1;
CP0 = [];
while( s + L_min - 1 <= totlen)
    fprintf('now s: %d\n', s);
    CP = [s, L_min, 0];
    I_best = 0;
    for tau = tau_min : tau_max
        I_now = compute_mi_delay(X, Y, k, s, L_min, tau);
        if I_now > I_best
            I_best = I_now;
            CP = [s, L_min, tau];
        end
    end
    fprintf("I_best: %.2f tau: %d\n",I_best, CP(3));
    if I_best > theta0
        CP1 = [s, L_min+L_max, CP(3) ];
        I1 = compute_mi_delay(X, Y, k, CP1(1), CP1(2), CP1(3));
        CP2 = [s-L_min, L_min+L_max, CP(3) ];
        I2 = compute_mi_delay(X, Y, k, CP2(1), CP2(2), CP2(3));
        if I1>I2
            CP1 = trim( CP1, X, Y, k, miniL, theta0, L_max );
            CP0 = [CP0;CP1];
            s = CP1(1)+CP1(2)-L_min;
        else
            CP2 = trim( CP2, X, Y, k, miniL, theta0, L_max );
            CP0 = [CP0;CP2];
            s = CP2(1)+CP2(2)-L_min;
        end
    end
    s = s + L_min;
end