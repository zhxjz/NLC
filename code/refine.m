%% FUNCTION: refine
%  optimize every CP in CP0 to satisfy the problem requirements.
%   INPUT:    CP0
%   OUTPUT:   CP1
function CP1 = refine(CP0, X, Y, k, ...
    L_min, L_max, delta_s, delta_l, theta1 )
lstot = size(CP0, 1);
CP1 = [];
lastCP = [];
for id = 1:lstot
    CP = CP0(id,:);
    S = CP(1);
    L = CP(2);
    TAU = CP(3);
%----------------------------------------------------------
%  Adjust Candidate according to the already refined CP.
    if size(lastCP,1)>0
        Sj = lastCP(1);
        Lj = lastCP(2);
        TAUj = lastCP(3);
        if Sj+Lj > S
            L = L-(Sj+Lj-S);
            S = Sj+Lj;
        end
        if Sj+Lj+TAUj > S+TAU
            L = L-((Sj+Lj+TAUj)-(S+TAU)-TAU);
            S = (Sj+Lj+TAUj)-(S+TAU)-TAU;
        end
    end
    if ( L < L_min )
        continue;
    end
    fprintf('%d %d %d\n',S, L, TAU);
%----------------------------------------------------------
%     Direct search
    [ sbest, lbest, Ibest ] = direct_st( S, S+L-L_min, delta_s, delta_l, X, Y, k, L, TAU, L_min, L_max);
    fprintf('%d %d %d %.2f\n',sbest, lbest, TAU, Ibest);
    if Ibest > theta1
        CP = [ sbest, lbest, TAU, Ibest ];
        CP1 = [CP1; CP];
        lastCP = CP;
    end    
end
end