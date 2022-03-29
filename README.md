# Non-Linear Correlation search (NLC)

Non-Linear Correlation search(NLC) is proposed for the localization of correlated window pairs on long time series pairs. 

Our goal is to find these correlated window pairs, which may have different delays and lengths, and may be nonlinear. 

<img src="https://github.com/zhxjz/NLC/blob/main/pics/problem.png" width="80%"/>

# Problem statement

**Given:**

- A pair of long time series ![](https://render.githubusercontent.com/render/math?math=(X,Y)), 

- a threshold ![](https://render.githubusercontent.com/render/math?math=\theta) , 

- the length constraint ![](https://render.githubusercontent.com/render/math?math=[L_{min},L_{max}]) 

- and the delay constraint  ![](https://render.githubusercontent.com/render/math?math=[\tau_{min},\tau_{max}]), 

**Our goal:** 

Find all correlated time window pairs ![](https://render.githubusercontent.com/render/math?math=%5Cmathcal%7BCP%7D=%5C%7BCP_1,CP_2,%5Ccdots,%20CP_%7B%7C%5Cmathcal%7BCP%7D%7C%7D%5C%7D) in the time series pair, 
where each ![](https://render.githubusercontent.com/render/math?math={CP_i=<s_i,l_i,\tau_i>}) satisfies 

- ![](https://render.githubusercontent.com/render/math?math=I(X(s_i,l_i),Y(s_i%2B\tau_i,l_i)),

- ![](https://render.githubusercontent.com/render/math?math=l_i\in[L_{min},L_{max}]),

- ![](https://render.githubusercontent.com/render/math?math=\tau_i\in[\tau_{min},\tau_{max}]).

# Algorithm Overview

<img src="https://github.com/zhxjz/NLC/blob/main/pics/overview.PNG"/>

The specific algorithm details are explained in Sec 4 and Sec 5 of our paper.

Also, we give a longer-version proof of theoretical analysis in vldb-nlc-longer.pdf.

# Parameter Settings

You can change the parameters setting part in the beginning of NLC_E.m or NLC_S.m

```matlab
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
```

# Run

run NLC_S.m for NLC with window shrinking strategy.

run NLC_E.m for NLC with window extending strategy.

The window pair we found by NLC is saved in CP_1.

If you have the standard answer of the known correlated pairs, you can also get the Accuracy of NLC. (including Precision, Recall, F1-score.) 
