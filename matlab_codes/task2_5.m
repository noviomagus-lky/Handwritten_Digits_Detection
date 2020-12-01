%
%
function task2_5(Xtrain, Ytrain, Xtest, Ytest, epsilon)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector for Xtrain (unit8)
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector for Xtest (unit8)
%  epsilon : a scalar variable (double) for covariance regularisation
  tic
  [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon);
  t=toc
  [CM, acc] = comp_confmat(Ytest, Ypreds);
  M10 = Ms(10,:);
  Cov10 = Covs(10,:,:);
  %save matlab_datas/task2_5_cm CM
  %save matlab_datas/task2_5_m10 M10
  %save matlab_datas/task2_5_cov10 Cov10
  N = size(Xtest,1)
  Nerrs = sum(sum(CM,2),1)
  acc
  
end
