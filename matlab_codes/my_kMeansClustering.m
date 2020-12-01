%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

  %% If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
  %% TO-DO
  N = size(X,1);
  D = size(X,2);
  C = initialCentres;
  idx = zeros(N,1);
  SSE = zeros(maxIter+1,1);
  Ctemp = zeros(k,D);

  for i = 1:maxIter+1
      %first, assign each data vector to the nearest cluster centre.
      eucdist = sq_dist(X,C);
      [~,idx] = min(eucdist,[],2);
      
      %Then, calculate the sum squared error for this iteration
      
      for m = 1:k
          SSE(i) = SSE(i) + sum(sq_dist(X(find(idx == m),:),C(m,:)),1);
      end
      
      %At last, recalculate each cluster centre
     
      for m = 1:k  
        Ctemp(m,:)= sum(X(find(idx == m),:),1)./size(find(idx == m),1);
      end
     
        if C ==Ctemp
            break
        end
      
      C = Ctemp;
  end
  
  SSE = SSE(find(SSE~=0));
  
end
