# README.

# PROBLEM SETTING.

Given a pair of long time series $(X,Y)$, a threshold $\theta$, the length constraint $[L_{min},L_{max}]$ and the delay constraint $[\tau_{min},\tau_{max}]$, our goal is to find all correlated time window pairs $\mathcal{CP}=\{CP_1,CP_2,\cdots, CP_{|\mathcal{CP}|}\}$ in the time series pair. 
Each $CP_i=<s_i,l_i,\tau_i>$ satisfies $$I(X(s_i,l_i),Y(s_i+\tau_i,l_i))\geq \theta$$.

# OVERVIEW.

![overview](https://github.com/zhxjz/NLC/tree/main/pics/overview.PNG)

# CODE.

run NLC-S.m for NLC with window shrinking strategy in the first phase.

run NLC-E.m for NLC with window extending strategy in the first phase.

The specific algorithm details are explained in Sec 4 and Sec 5 of the paper.
