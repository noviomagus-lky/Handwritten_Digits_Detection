%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.
  X = Xtrain;
  Y = Ytrain;
  Corrs = zeros(11,1);
  %Compute PCA
  [EVecs, EVals] = comp_pca(X);
  N = size(X,1);
  D = size(X,2);
  %convert X from 784D to 2D
  X2d = zeros(N,2);
  X2d(:,1) = X*EVecs(:,1);
  X2d(:,2) = X*EVecs(:,2);
  %compute correlation for each class
   for i = 1:10
    class = X2d(find(Y==i),:);
    
    S = mycov(class);
    Corrs(i) = S(2,1)/sqrt(S(1,1)*S(2,2));
   end
   %Compute correlation for all the class
   S = mycov(X2d);
   Corrs(11) = S(2,1)/sqrt(S(1,1)*S(2,2));
end
