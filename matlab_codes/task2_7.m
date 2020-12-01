%
%
function [CM, acc] = task2_7(Xtrain, Ytrain, Xtest, Ytest, epsilon, ratio)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector for Xtrain (unit8)
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector for Xtest (unit8)
%  ration : scalar (double) - ratio of training data to use.
% Output:
%  CM     : K-by-K matrix (integer) of confusion matrix
%  acc    : scalar (double) of correct classification rate
N = int32(size(Xtrain,1)*ratio);
Xtrain = Xtrain(1:N,:);
Ytrain = Ytrain(1:N,:);
R = ratio*100;
text = 'matlab_datas/task2_7_cm_';
[Ypreds, ~, ~] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon);
[CM, acc] = comp_confmat(Ytest, Ypreds);
%save(strcat(text,string(R)),'CM');

end
