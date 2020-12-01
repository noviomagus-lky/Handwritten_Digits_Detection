function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
  %% TO-DO
    
   
   
    S = mycov(X);    
    %each column presents an eigenvector
    [EVecs, EVals] = eig(S);
    for i=1:784
        
        EVals(i,1) = EVals(i,i);
        if real(EVecs(1,i)) < 0 || imag(EVecs(1,i) < 0)
            EVecs(:,i) = -EVecs(:,i);
            EVals(i,1) = -EVals(i,i);
        end
    end
    EVals = EVals(:,1);
    [EVals,Index] = sort(EVals,'descend');
    EVecs = EVecs(:,Index);
end

