clear
load data\\NL617

% --parameters setting--
tau_min = -150;
tau_max = 150;
k = 2;
L_min = 400;
L_max = 850;
theta0 = 0.25;
theta1 = 1.0;
we = 2000;
miniL = 0.25*L_min;
delta_s = 0.2*L_min;
delta_l = 0.2*L_min;

% PHASE ONE: 
% use window shrinking:
fprintf('PHASE ONE (window shrinking strategy) START\n');
tt = clock;
CP0 = shrinking(X, Y, k, we, ...,
    tau_min, tau_max, miniL, L_max, theta0 );
tt0 = clock;
fprintf('PHASE ONE FINISHED. Time: %.2f\n', etime(tt0,tt));

% PHASE TWO:
% refine every CP to satisfy the problem requirements
fprintf('PHASE TWO START\n');
CP1 = refine(CP0, X, Y, k, ...
    L_min, L_max, delta_s, delta_l, theta1 );
tt1 = clock;
fprintf('PHASE TWO FINISHED. Time: %.2f\n', etime(tt1,tt0));
fprintf('Total time: %f\n', etime(tt1,tt));

% calculate accuracy
totlen = size(X,1);
[x_cal, y_cal, tot_cal] = calF1( res_ls, CP1, totlen);
fprintf('Accuracy: PRE, RECALL, F1-SCORE\n');
see = [x_cal; y_cal; tot_cal]