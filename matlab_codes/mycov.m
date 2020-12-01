function [S] = mycov(X)

  Mean = mymean(X,1);
  N = size(X,1);
  n = size(X,2);
  S = zeros(n,n);
  
  for i=1:N     
      S = S + (X(i,:)-Mean)'*(X(i,:)-Mean);
  end
  
  S = S/(N-1);
  
end