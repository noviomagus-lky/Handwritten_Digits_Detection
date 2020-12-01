%
%
function [] = task1_8(Xtrain,k)
%  NB: there is no specification to this function.
%trying to using mean values of different class as initial centres
  D  = size(Xtrain,2);  
  K = 10;
  X = Xtrain;
  
%   initialC = zeros(K,D);
%   
%   for i = 1:K
%     initialC(K,:) = mymean(Xtrain(find(Ytrain == i)));  
%   end
%   [~,~,SSE1] = my_kMeansClustering(Xtrain, K, initialC);
%   [~,~,SSE2] = my_kMeansClustering(Xtrain, K, Xtrain(1:K,:));
%   size(SSE1,1);
%   size(SSE2,1);
 t = zeros(1,4);
 SSE = zeros(1,4);
  for i = 1:5
    tic
  [~,~,SSE1] = kmeans(X,k,'Start','uniform'); 
  t1=toc;
  [~,~,SSE2] = kmeans(X,k,'Start','plus');
  t2 = toc - t1;
  [~,~,SSE3] = kmeans(X,k,'Start','sample');
  t3 = toc - t2;
  [~,~,SSE4] = kmeans(X,k,'Start','cluster');
  t4 = toc - t3;
  t = t + [t1,t2,t3,t4];
  SSE = SSE + [SSE1 SSE2 SSE3 SSE4];
  end
  t = t/5
  SSE = sum(SSE/5)
end

