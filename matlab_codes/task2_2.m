%
%
function Dmap = task2_2(Xtrain,Ytrain, k, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X   : M-by-D data matrix (double)
%  k   : scalar (integer) - the number of nearest neighbours
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) - the number of bins for each PCA axis
% Output:
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

%load the data 
  load(MAT_evecs);
  load(MAT_evals);
  mean = posVec;
  D = size(Xtrain,2);
  N = size(Xtrain,1);

%calculate the mean and standard deviation using given inputs
  m1 = mean*EVecs(:,1);
  m2 = mean*EVecs(:,2);
  dev1 = sqrt(EVals(1));
  dev2 = sqrt(EVals(2));

%get the 2d plane
  Xplot = linspace(m1-5*dev1,m1+5*dev1,nbins);
  Yplot = linspace(m2-5*dev2,m2+5*dev2,nbins);
  [Xv,Yv] =meshgrid(Xplot,Yplot);
  grid2d = [Xv(:),Yv(:)];
%convert the points on the plane to 784D
  grid = zeros(nbins*nbins,D-2);
  grid = cat(2,grid2d,grid);
%
  Xmap = zeros(N,D);
  for i=1:N
      for j=1:D
      Xmap(i,j) = EVecs(:,j)'*(Xtrain(i,:)-posVec)';
      end
  end
%apply k Dmap = task2_2(Xtrn, Ytrn, 1, 'task1_3_evecs.mat', 'task1_3_evals.mat',mean(Xtrn), 200);-NN for the sample plane
  [Ypreds] = run_knn_classifier(Xmap, Ytrain, grid, k);
  Dmap = reshape(Ypreds,nbins,nbins);
  [~,h] = contourf(Xplot(:),Yplot(:),Dmap);
  set(h,'LineColor','none');
  
end
