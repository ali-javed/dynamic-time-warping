function dist=dtw_d(s1,s2,w)
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
@misc{DTW_D,
title={Multivariate time series dynamic time warping using euclidean distance},
author={Ali Javed},
year={2019},
month={November},
note = {\url{https://github.com/ali-javed/dynamic-time-warping}}
%}
    
    
%%    
    
    if length(size(s1)) ~=3 || length(size(s2))~=3
        error('Error in dtw(): dimensions of input sequence incorrect.');
    end
        
    if size(s1,2)~=size(s2,2)
        error('Error in dtw(): the number of variables do not match.');
    end
    
    if w<0 || w >1
        error('Error in dtw(): window size needs to be between 0 and 1.');
    end

    if size(s1,3)~=size(s2,3)
        warning('Error in dtw(): The lenght of timeseries do not match.');
    end
    
    
    
    
    if w == 0
        %returns squared distance
        dist = squared_euclidean(s1,s2);
        
        dist = sqrt(dist);

    else

        %get absolute window size
        w = ceil(w * size(s1,3));

        % adapt window size
        ns1=size(s1,3);
        ns2=size(s2,3);
        w=max(w, abs(ns1-ns2)); 

        %initialization
        D=zeros(ns1+1,ns2+1)+Inf; % cache matrix
        D(1,1)=0;

        for i=1:ns1
            for j=max(i-w,1):min(i+w,ns2)

                dist_temp = (squared_euclidean(s1(1,:,i),s2(1,:,j)));%squared euclidean distance between two points
                D(i+1,j+1)=dist_temp+min( [D(i,j+1), D(i+1,j), D(i,j)] );%find the optimal path

            end
        end
        dist=(sqrt(D(ns1+1,ns2+1)));%return the square root of final distance
        
    end

end

function dist = squared_euclidean(s1,s2)
%%
%%author: Ali Javed 
%email: ajaved@uvm.edu
%Version history:
%Version 1 . basis implementation of dynaimc time warping dependant. 
%Version 2 (7 Nov 2019). changed variable names to be more representative
%and added comments.

%Inputs
% s1: signal 1, size 1 * m * n. where m is the number of variables, n is the
% timesteps.
% s2: signal 2, size 1 * m * n. where m is the number of variables, n is the
% timesteps.


%OUTPUT
%dist: Squared euclidean distance

%%
dist = 0;%initilize

%loop over each variable
for ii=1:size(s1,1)
    
    ob1 = s1(ii,:);
    ob2 = s2(ii,:);
    ob = [ob1;ob2];
    %the final distance is the sum of squared distances of euclidean
    %distances
    dist = dist + sum((ob(1,:) - ob(2,:)).^2);
    
    
end


end
    
 
