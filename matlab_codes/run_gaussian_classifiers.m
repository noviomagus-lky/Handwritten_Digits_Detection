function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.
  K = max(Ytrain)-min(Ytrain)+1;
  N = size(Xtest,1);
  D = size(Xtest,2);
  Ypreds = zeros(N,1);
  Ms = zeros(K,D);
  Covs = zeros(K,D,D);
  likelihood = zeros(N,K);
  prior = zeros(10,1);
% calculate the probability for each point
  for i=1:K
      prior(i) = size(find(Ytrain == i),1)/size(Ytrain,1);
  end
  for i=1:K
      class = Xtrain(find(Ytrain == i),:);
      mu = mymean(class,1);
      Ms(i,:) = mu;
      S = mycov(class) + epsilon*eye(D);
      Covs(i,:,:) = S;
      likelihood(:,i) = gaussianMV(mu,S,Xtest) + log(prior(i));
  end
%compare the result and make prediction
      [~,Ypreds] = max(likelihood,[],2);
      
end
