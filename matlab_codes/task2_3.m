%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)
  %compute PCA
  [EVecs, EVals] = comp_pca(X);
  N = size(X,1);
  D = size(X,2);
  %convert X to 2D
  X2d = zeros(N,2);
  X2d(:,1) = X*EVecs(:,1);
  X2d(:,2) = X*EVecs(:,2);
  %calculate mean and covariance
  for i = 1:10
    class = X2d(find(Y==i),:);
    mu = mymean(class,1);
    S = mycov(class);
    
    sita = 0:0.01:2*pi;
    
    evals = eig(S);
    [evecs,~] = eig(S);
    [~,idx1] = max(evals);
    [~,idx2] = min(evals);
    
    max1 = sqrt(max(evals));
    max2 = sqrt(min(evals));
    fi = atan2(evecs(1,idx1),evecs(2,idx1));
   
    x = max1*cos(sita);
    y = max2*sin(sita);
    r = [cos(fi),sin(fi);-sin(fi),cos(fi)];
    temp = r*[y;x];
    
    
    hold on
    plot(temp(1,:) + mu(1),temp(2,:) + mu(2));
    text(mu(1),mu(2),string(i));
  end
end
