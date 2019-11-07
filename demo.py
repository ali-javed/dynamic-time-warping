from DTW_D import dtw_d
import numpy as np

#sequence 1 variable 1 and 2
s1_1 = [1,2,3,4,4,4,4,4,5,6,6];
s1_2 = [1,2,3,3,4,4,4,4,4,4,6];

#sequence 2 variable 1 and 2
s2_1 = [1,2,3,3,3,4,4,4,4,4,6];
s2_2 = [1,3,3,3,3,4,4,4,4,4,6];

s1 = []
s2 = []

temp = []
temp.append(s1_1)
temp.append(s1_2)

s1.append(temp)

temp = []
temp.append(s2_1)
temp.append(s2_2)

s2.append(temp)


s1 = np.asarray(s1)
s2 = np.asarray(s2)
dist=dtw_d(s1,s2,0)

print('Dynamic time warping dependent distance (2 variable) is '+str(dist))
