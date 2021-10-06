function CP0 = shrinking(X, Y, k, we, tau_min, tau_max, miniL, L_max, theta0 )
if( size(X,1) < size(X,2) )
    X = X';
end
if( size(Y,1) < size(Y,2) )
    Y = Y';
end
totlen = size(X,1);
s = 1;
CP0 = [];
while( s + we - 1 <= totlen)
    fprintf('now s: %d\n', s);
    CP = [s, we, 0];
    I_best = 0;
    for tau = tau_min : tau_max
        I_now = compute_mi_delay(X, Y, k, s, we, tau);
        if I_now > I_best
            I_best = I_now;
            CP = [s, we, tau];
        end
    end
    fprintf("I_best: %.2f tau: %d\n",I_best, CP(3));
    if I_best > theta0
        CP = trim( CP, X, Y, k, miniL, theta0, L_max);
        CP0 = [CP0; CP];
    end
    s = s + we;
end