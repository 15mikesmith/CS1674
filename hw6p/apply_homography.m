function [p2] = apply_homography(p1, H)

p2 = H*p1;

p2(1) = p2(1)/p2(3);
p2(2) = p2(2)/p2(3);

p2 = [p2(1),p2(2)];


end

