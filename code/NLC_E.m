clear
clc
load data\\NL617

% --parameters setting--
L_min = 400;    % min length
L_max = 850;    % max length
tau_min = -150; % min delay
tau_max = 150;  % max delay
k = 2;          % k-NN for MI calculation in KSG estimator
theta0 = 0.25;  % initial threshold for phase one
theta1 = 1.0;   % final threshold for phase two

miniL = 0.1*L_min;     % mini window length for trimming
delta_s = 0.1*L_min;    % search termination condition of starting point s
delta_l = 0.1*L_min;    % search termination condition of length l

%----------------------------------------------------------
% PHASE ONE
% use window extending:
fprintf('PHASE ONE (window extending strategy) START\n');
tt = clock;
CP0 = extending(X, Y, k, ...,
    tau_min, tau_max, miniL, L_min, L_max, theta0 );
tt0 = clock;
fprintf('PHASE ONE FINISHED. Time: %.2f\n', etime(tt0,tt));

%----------------------------------------------------------
% PHASE TWO
% refine every CP to satisfy the problem requirements
fprintf('PHASE TWO START\n');
CP1 = refine(CP0, X, Y, k, ...
    L_min, L_max, delta_s, delta_l, theta1 );
tt1 = clock;
fprintf('PHASE TWO FINISHED. Time: %.2f\n', etime(tt1,tt0));
fprintf('Total time: %f\n', etime(tt1,tt));

%----------------------------------------------------------
% calculate accuracy
totlen = size(X,1);
[x_cal, y_cal, tot_cal] = calF1( res_ls, CP1, totlen);
fprintf('Accuracy: PRE, RECALL, F1-SCORE\n');
see = [x_cal; y_cal; tot_cal]