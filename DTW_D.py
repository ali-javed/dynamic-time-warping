import numpy as np

'''
If you use the code in your work please cite as
@misc{DTW_D,
title={Multivariate time series dynamic time warping using euclidean distance},
author={Ali Javed},
year={2019},
month={November},
note = {\url{}}
%}
'''


def sq_euc(s1, s2):
#author: Ali Javed 
#email: ajaved@uvm.edu
#Version history:
#Version 1 . basis implementation of dynaimc time warping dependant. 
#Version 2 (7 Nov 2019). changed variable names to be more representative and added comments.

#Inputs
#s1: signal 1, size 1 * m * n. where m is the number of variables, n is the timesteps.
#s2: signal 2, size 1 * m * n. where m is the number of variables, n is the timesteps.


#OUTPUT
#dist: Squared euclidean distance
    
    dist = ((s1 - s2) ** 2)
    return dist.flatten().sum()




def dtw_d(s1, s2, w):
#author: Ali Javed 
#email: ajaved@uvm.edu
#Version 1 . basis implementation of dynaimc time warping dependant. 
#Version 2 (7 Nov 2019). changed variable names to be more representative and added comments.

#INPUTS:
#s1: signal 1, size 1 * m * n. where m is the number of variables, n is the timesteps.
#s2: signal 2, size 1 * m * n. where m is the number of variables, n is the timesteps.
#w: window parameter, percent of size and is between0 and 1. 0 is
#euclidean distance while 1 is maximum window size.
# 
#OUTPUTS: 
#dist: resulting distance


    s1 = np.asarray(s1)
    s2 = np.asarray(s2)
    s1_shape = np.shape(s1)
    s2_shape = np.shape(s2)
    
    if w<0 or w>1:
        print("Error: W should be between 0 and 1")
        return False
    if s1_shape[0] >1 or s2_shape[0] >1:
        print("Error: Please check input dimensions")
        return False
    if s1_shape[1] != s2_shape[1]:
        print("Error: Please check input dimensions. Number of variables not consistent.")
        return False
    if s1_shape[2] != s2_shape[2]:
        print("Warning: Length of time series not equal")
        
    #if window size is zero, it is plain euclidean distance
    if w ==0:
        dist = np.sqrt(sq_euc(s1, s2))
        return dist


    #get absolute window size
    w = int(np.ceil(w * s1_shape[2]))

    #adapt window size

    w=int(max(w, abs(s1_shape[2]- s2_shape[2])));
        
        
    #initilize    
    DTW = {}
    for i in range(-1, s1_shape[2]):
        for j in range(-1, s2_shape[2]):
            DTW[(i, j)] = float('inf')
    DTW[(-1, -1)] = 0

    print('entering dtw')
    for i in range(s1_shape[2]):
        for j in range(max(0, i - w), min(s2_shape[2], i + w)):
            #squared euc distance
            dist = sq_euc(s1[0,:,i], s2[0,:,j])
            #find optimal path
            DTW[(i, j)] = dist + min(DTW[(i - 1, j)], DTW[(i, j - 1)], DTW[(i - 1, j - 1)])

    dist = np.sqrt(DTW[s1_shape[2] - 1, s2_shape[2] - 1])
    
    
    return dist