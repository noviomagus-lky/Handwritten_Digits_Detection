%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
  text = 'matlab_datas/task1_1_imgs_class';
 
  for class = 1:10
      imgs = zeros(28,28,10);
      i = 1;
      count = 1;
   %find first 10 figures
      while count <= 10
          if Y(i) == class
              imgs(:,:,count) =  reshape(X(i,:), 28, 28)';
              count = count + 1;
          end
          i = i + 1;
      end
   %integrate 10 images using montage
      figure(class);
      montage(imgs);
      titletext = ['figure 1.1.' int2str(class) ': Class' int2str(class)];
      title(titletext);
    %  print(figure(class),strcat(text,string(class)),'-bestfit','-dpdf');
   
  end
 
end
