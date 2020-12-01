%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours
partc = 'matlab_datas/task1_5_c_';
partidx = 'matlab_datas/task1_5_idx_';
partsse = 'matlab_datas/task1_5_sse_';
for i = 1:size(Ks,2)
      [C,idx,SSE] = my_kMeansClustering(X,Ks(i),X(1:Ks(i),:));
     % save (strcat(partc,string(Ks(i))),'C');
     % save (strcat(partidx,string(Ks(i))),'idx')
     % save (strcat(partsse,string(Ks(i))),'SSE');
    
  end
end


