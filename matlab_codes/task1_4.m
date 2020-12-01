%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
  imgs  = zeros(28,28,10);
  for i = 1:10
      imgs(:,:,i) = reshape(EVecs(:,i), 28, 28)';
  end
  montage(imgs,'DisplayRange',[-0.2,0.2]);
%print(figure(1),'matlab_datas/task1_4_imgs','-bestfit','-dpdf');
end
