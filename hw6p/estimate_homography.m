function H = estimate_homography(PA, PB)
%PA and PB are 4x2 matrices, H is a 3x3 Matrix

%2x9 Matrix

A = zeros(8,9);


x = 1;

for i = 1:4
A(x:x+1,:) = [ -PA(i,1), -PA(i,2), -1, 0, 0, 0, PA(i,1)*PB(i,1), PA(i,2)*PB(i,1), PB(i,1) ;
        0, 0, 0, -PA(i,1), -PA(i,2), -1, PA(i,1)*PB(i,2), PA(i,2)*PB(i,2), PB(i,2) ];
    x = x+2;
end
    
[~, ~, V] = svd(A);
h = V(:, end);
H = reshape(h, 3, 3)';

end

