function[] = task2_8(Xtrain, Ytrain, Xtest, Ytest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Xtrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   Ytest  : N-by-1 label vector for Xtest (uint8)
%   epsilon : A scalar parameter for regularisation
%   L      : scalar (integer) of the number of Gaussian distributions per class
  tic
  [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L);
  t=toc
  
  [CM, acc] = comp_confmat(Ytest, Ypreds);
  text1 = 'matlab_datas/task2_8_cm_';
  text2 = 'matlab_datas/task2_8_g';
  text2 = strcat(text2,string(L));
  %save(strcat(text1,string(L)),'CM');
  Ms1 = MMs(1:L,:);
  Covs1 = MCovs(1:L,:,:);
  %save(strcat(text2,'_m1'),'Ms1');
  %save(strcat(text2,'_cov1'),'Covs1');
  N=size(Xtrain,1)
  Nerrs = sum(sum(CM,2),1)
  acc

end
