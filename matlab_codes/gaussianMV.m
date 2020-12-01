function y = gaussianMV(mu, cov, X)
% Y = GAUSSIANMV(MU, COVAR, X) evaluates a multi-variate Gaussian
%density in D-dimensions at a set of points given by the rows of
%the matrix X. The Gaussian density has mean vector MU and
%covariance matrix COVAR.

[n, D] = size(X);
[j, k] = size(cov);
% Check that the covariance matrix is the correct dimension
  if ((j ~= D) || (k ~=D))
    error('Dimension of covariance matrix and data should match');
  end
  y = zeros(n,1);
  others = -D/2*log(2*pi) - 1/2*logdet(cov);
  invcov = inv(cov);
  for i = 1:n
    y(i) = others - 1/2*(X(i,:)-mu)*invcov*(X(i,:)-mu)';
  end
  
end