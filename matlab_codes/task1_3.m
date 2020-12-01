%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.
[EVecs,EVals] = comp_pca(X);
CumVar = zeros(size(X,2),1);
MinDims = zeros(4,1);
Xndims = zeros(size(X));
%generates the new n-dimensional data Yn(Y1,Y2..Yn) from eigenvectors,
% e.g.Y1 = u'*Xn, u is the eigenvector correspond to the largest eigenvalue.  
  for i=1:size(X,1)
      for j=1:size(X,2)  
          
        Xndims(i,j) = EVecs(:,j)'*(X(i,:)');
      
      end
  end

  CumVar(1) = var(Xndims(:,1));
  save xndims Xndims 
  for i=2:size(X,2)
     
      CumVar(i,1) = var(Xndims(:,i))+CumVar(i-1,1);
      
  end
  
  figure(1);
  plot(CumVar');
  title('Cumulative variance curve');
   %print(figure(1),'matlab_datas/task1_3_graph','-bestfit','-dpdf');

  Percentage =  CumVar/CumVar(size(X,2),1);
  
  for i=2:size(X,2)
      
      if Percentage(i-1)<=0.7 && Percentage(i)>=0.7
          MinDims(1) = i;
      elseif Percentage(i-1)<=0.8 && Percentage(i)>=0.8
          MinDims(2) = i;
      elseif Percentage(i-1)<=0.9 && Percentage(i)>=0.9
          MinDims(3) = i;
      elseif Percentage(i-1)<=0.95 && Percentage(i)>=0.95
          MinDims(4) = i;
      end    
      
  end
    
end
