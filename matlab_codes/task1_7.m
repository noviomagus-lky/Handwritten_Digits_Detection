%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.
  load(MAT_ClusterCentres);
  load(MAT_evecs);
  load(MAT_evals);
  mean = posVec;
  K = size(C,1);
  
%calculate the correspond cluster centres on the 2D-PCA plane  
  C2d = zeros(K,2);
  for i = 1:K
    C2d(i,1) = EVecs(:,1)'*(C(i,:)-posVec)';
    C2d(i,2) = EVecs(:,2)'*(C(i,:)-posVec)';
  end
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
%apply kmeans clustering for each point
  [~,Dmap,~] = my_kMeansClustering(grid2d,K,C2d,0);
  Dmap = reshape(Dmap,nbins,nbins);
  [~,h] = contourf(Xplot(:),Yplot(:),Dmap);
  set(h,'LineColor','none');
  %save ['task1_7_dmap_' int2str(K)] Dmap 
end






