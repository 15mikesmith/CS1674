function [centers] = detectCircles(im, edges, radius, top_k)

%for every edge pixel(x,y) in edges
%for each possible radius value r, just 1 value
%for each possible gradient direction at sigma or use estimated gradient at
%(x,y)

centers = zeros(top_k, 2);
H = zeros(size(im,1), size(im,2));


for n = 1:size(edges,1)
a = round(edges(n,1) - (radius * cosd(edges(n,4))));
b = round(edges(n,2) - (radius * sind(edges(n,4))));


    %Pass over if negative or out of bounds
    if (a < 1) || (b < 1) ||(a > size(im,2)) || (b > size(im,1))
        continue
    end
 
    H(b,a) = H(b,a) + 1; 
end

H2 = H(:);

%Sort the vector so we can take the top_k circles coordinates
[Values ,idx] = sort(H2, 'descend');


% find the top-k vector indices
topKindices = idx(1:top_k);

%Convert to Matrix
[yIndex, xIndex] = ind2sub(size(im), topKindices);

for index = 1:top_k
    centers(index,1) = yIndex(index);
    centers(index,2) = xIndex(index);
end

figure; imshow(im);viscircles(centers, radius * ones(size(centers, 1),1));

title(strcat('Radius of : ', num2str(radius)));

%saveas(gcf,'jupiter_circles.png');
%saveas(gcf,'egg_circles.png');




