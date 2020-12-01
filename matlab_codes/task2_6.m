%
%
function Dmap = task2_6(X, Y, epsilon, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X        : M-by-D data matrix (double)
%  Y        : M-by-1 label vector (uint8)
%  epsilon  : scalar (double) for covariance matrix regularisation
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec   : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) denoting the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.
  %load the data 
  load(MAT_evecs);
  load(MAT_evals);
  mean = posVec;
  Xtrain = X;
  Ytrain = Y;
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

%convert the data on 2D to the original 784D coordinate i.e.X = (x1,x2,x3...x784)
  
  grid = grid2d*EVecs(:,1:2)' + posVec;
  
%apply Gaussian classification
  [Ypreds, ~, ~] = run_gaussian_classifiers(X, Y, grid, epsilon);
  Dmap = reshape(Ypreds,nbins,nbins);
  [~,h] = contourf(Xplot(:),Yplot(:),Dmap);
  set(h,'LineColor','none');
end
