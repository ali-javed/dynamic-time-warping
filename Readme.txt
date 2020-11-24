%%author: Ali Javed 
%email: ajaved@uvm.edu
%Version history:
%Version 1 . basis implementation of dynaimc time warping dependant. 
%Version 2 (7 Nov 2019). changed variable names to be more representative
%and added comments.

%INPUTS:
% s1: signal 1, size 1 * m * n. where m is the number of variables, n is the
% timesteps.
% s2: signal 2, size 1 * m * n. where m is the number of variables, n is the
% timesteps.
% w: window parameter, percent of size and is between0 and 1. 0 is
% euclidean distance while 1 is maximum window size.
% 
%OUTPUTS: 
% dist: resulting distance
    %if 0 then calculate euclidean distance
    
%If you use this code in your work please cite as
%{
%Ali Javed, Byung Suk Lee, and Donna M. Rizzo. “A benchmark study on time series clustering”. In: Machine Learning with Applications 1 (2020), p. 100001. issn: 2666-8270. doi: https://doi.org/10.1016/j.mlwa.2020.100001. url: http://www.sciencedirect.com/science/article/pii/S2666827020300013
%}



This is code for multivariate time series dynamic time warping using euclidean distance. The code by default calculated dynamic time warping dependent. If you are interested in dynamic time warping independent, simply call the function on each variable separately and sum the resulting distances.
