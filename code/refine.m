%% FUNCTION: refine
%  optimize every CP in CP0 to satisfy the problem requirements.
% INPUT:    CP0
% OUTPUT:   CP1
function CP1 = refine(CP0, X, Y, k, ...
    L_min, L_max, delta_s, delta_l, theta1 )
lstot = size(CP0, 1);
CP1 = [];
for id = 1:lstot
    CP = CP0(id,:);
    S = CP(1);
    L = CP(2);
    TAU = CP(3);
    fprintf('%d %d %d\n',S, L, TAU);
    [ sbest, lbest, Ibest ] = direct_st( S, S+L-L_min, delta_s, delta_l, X, Y, k, L, TAU, L_min, L_max);
    fprintf('%d %d %d %.2f\n',sbest, lbest, TAU, Ibest);
    if Ibest > theta1
        CP = [ sbest, lbest, Ibest ];
%         CP = modify( CP, X, Y, k, L_max);
        CP1 = [CP1; [sbest, lbest, TAU, Ibest]];
    end    
end
end

% function CP = modify(CP, X, Y, k, L_max)
%     theta1
% end