%If you use this code in your work please cite as
%{
@misc{DTW_D,
title={Multivariate time series dynamic time warping using euclidean distance},
author={Ali Javed},
year={2019},
month={November},
note = {\url{https://github.com/ali-javed/dynamic-time-warping}}
%}


%sequence 1 variable 1 and 2
%s1_1 = [1,2,3,4,4,4,4,4,5,6,6];
%s1_2 = [1,2,3,3,4,4,4,3,4,4,6];

s1_1 = [1,3,4,4,4,3,6,1];
s1_2 = [1,1,3,4,4,4,3,6];


%sequence 2 variable 1 and 2
s2_1 = [1,2,3,3,3,4,4,4,4,4,6];
s2_2 = [1,3,3,3,3,4,4,4,4,4,6];

%format them for input to dtw_d function
s1 = zeros(1,1,8);
s2 = zeros(1,1,8);



s1(1,1,:) = s1_1;
s2(1,1,:) = s1_2;

%s1(1,2,:) = s1_2;
%s2(1,2,:) = s2_2;


dist=dtw_d(s1,s2,1);

fprintf('Dynamic time warping dependent distance (2 variable) is %f.\n',dist)
