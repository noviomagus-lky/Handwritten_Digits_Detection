function DI = sq_dist(X,Y)

%sq_dist = sum(bsxfun(@minus,U,v).^2,2)';
  [N,~] = size(X);
  [M] = size(Y,1);
  XX = zeros(N,1);
  YY =zeros(M,1);
  for i=1:N
      XX(i) = X(i,:)*X(i,:)';
  end
  for i=1:M
      YY(i) = Y(i,:)*Y(i,:)';
  end
  DI = repmat(XX,1,M) + repmat(YY,1,N)' - 2*X*Y';
end