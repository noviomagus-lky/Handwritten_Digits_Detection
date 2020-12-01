function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest : N-by-D test data matrix (double)
%   Ks   : 1-by-L vector of the numbers of nearest neighbours in Xtrain (integer)
% Output:
%  Ypreds : N-by-L matrix of predicted labels for Xtest (integer)
  rng(2);
  N = size(Xtest,1);
  M = size(Xtrain,1);
  L = size(Ks,2);
  D = size(Xtest,2);
  Ypreds = zeros(N,L);
  %Index = zeros(N,M);
   [~,Index] = sort(sq_dist(Xtest,Xtrain),2,'ascend');
    for i=1:L
        for j=1:N
            idx = Index(j,1:Ks(i));
            Ypreds(j,i) = mode(Ytrain(idx));
        end
    end
end
