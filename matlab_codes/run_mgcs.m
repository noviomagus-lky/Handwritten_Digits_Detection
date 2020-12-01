function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar parameter for regularisation (double)
%   L      : scalar (integer) of the number of Gaussian distributions per class
% Output:
%  Ypreds : N-by-1 matrix of predicted labels for Xtest (integer)
%  MMs     : (L*K)-by-D matrix of mean vectors (double)
%  MCovs   : (L*K)-by-D-by-D 3D array of covariance matrices (double)
  D = size(Xtrain,2);
  N = size(Xtrain,1);
  
  Ysubtrain = Ytrain;
  %find the clusters in each class.
  for i=1:10
      map = find(Ytrain == i);
      X = Xtrain(Ytrain == i,:);
      [~,idx,~] = my_kMeansClustering( X,L,X(1:L,:)); 
      
    for j=1:L
      %  MMs(i*L+j,:) = mymean(X(find(idx == j),:,i+1));
     %   MCovs(:,:,i*L+j) = mycov(X(find(idx == j),:,i+1));
     Ysubtrain(map(find(idx == j))) = i*L+j-1;
    
    end
  end
  [Ypreds, MMs, MCovs] = run_gaussian_classifiers(Xtrain, Ysubtrain, Xtest, epsilon);
  Ypreds = floor(Ypreds/L);
  
end
