function[V] = mymean(X, dim)

  if nargin ==1
      dim = 1;
  end
V = sum(X,dim)/size(X,dim);


end