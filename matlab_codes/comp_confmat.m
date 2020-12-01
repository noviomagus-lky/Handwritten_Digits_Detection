function [CM, acc] = comp_confmat(Ytrues, Ypreds)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)
  
  K = 10;
  N = size(Ytrues,1);
  CM = zeros(K,K);
  Ytrues = Ytrues;
  for i=1:N
      if Ytrues(i)~=Ypreds(i)
          CM(Ytrues(i),Ypreds(i)) = CM(Ytrues(i),Ypreds(i))+1;
      end
  end
  CorrectNum = sum(CM,2);
  CorrectNum = N-sum(CorrectNum);
  acc = CorrectNum/N;
end
