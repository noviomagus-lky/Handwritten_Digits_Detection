%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
  %calculate time for execuation
  tic
  [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
  t1 = toc
  
  filename = 'matlab_datas/task2_1_cm';
  L = size(Ks,2);
  N = size(Xtest,1);
  %save file
  for i=1:L
  [CM, acc] = comp_confmat(Ytest, Ypreds(:,i));
  %save(strcat(filename,string(Ks(i))),'CM');
  %show required display 
  Ks(i)
  N
  Nerrs = sum(sum(CM,2),1)
  acc
  end
end
