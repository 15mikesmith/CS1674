function [B] = normalize_rows(A)


X = sum(A,2);
C = repmat(X,size(A(1,:)));

B = A./C


end
