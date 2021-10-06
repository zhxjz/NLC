# README.

# PROBLEM SETTING.

Given a pair of long time series ![](https://render.githubusercontent.com/render/math?math=(X,Y)), a threshold ![](https://render.githubusercontent.com/render/math?math=\theta) , the length constraint ![](https://render.githubusercontent.com/render/math?math=[L_{min},L_{max}]) and the delay constraint  ![](https://render.githubusercontent.com/render/math?math=[\tau_{min},\tau_{max}]), 
our goal is to find all correlated time window pairs ![](https://render.githubusercontent.com/render/math?math=%5Cmathcal%7BCP%7D=%5C%7BCP_1,CP_2,%5Ccdots,%20CP_%7B%7C%5Cmathcal%7BCP%7D%7C%7D%5C%7D) in the time series pair, 
where each ![](https://render.githubusercontent.com/render/math?math={CP_i=<s_i,l_i,\tau_i>}) satisfies 
![](https://render.githubusercontent.com/render/math?math=I(X(s_i,l_i),Y(s_i%2B\tau_i,l_i))\geq\theta).

# OVERVIEW.

<img src="https://github.com/zhxjz/NLC/blob/main/pics/overview.PNG" height="300"/>

# CODE.

run NLC-S.m for NLC with window shrinking strategy in the first phase.

run NLC-E.m for NLC with window extending strategy in the first phase.

The specific algorithm details are explained in Sec 4 and Sec 5 of the paper.
