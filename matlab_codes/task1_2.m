%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.
meanvecs = zeros(11,784);
imgs = zeros(28,28,11);
amount = zeros(11);

  for i = 1:size(Y)
      meanvecs(Y(i) ,:) = meanvecs(Y(i),:) + X(i,:);
      amount(Y(i) ) = amount(Y(i) ) + 1;
  end
  %calculate mean vectors of 10 class
  for i = 1:10
      meanvecs(i,:) = meanvecs(i,:)/amount(i);
  end
  %calculate the total mean vector
  meanvecs(11,:) = mymean(X, 1);
  %integrate the figures
  for i = 1:11
      imgs(:,:,i) = reshape(meanvecs(i,:), 28, 28)';
  end
  figure(1);
  montage(imgs);
  title('figure1.2:mean vectors');
  % print(figure(1),'matlab_datas/task1_2_imgs','-bestfit','-dpdf');
  M = meanvecs;
  
end
