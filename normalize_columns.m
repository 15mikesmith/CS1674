function [B] = normalize_columns(A)


X = sum(A,1);
C = repmat(X,size(A(:,1)));

B = A./C

end