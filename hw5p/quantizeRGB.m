function [ outputImg, meanColors, clusterIds ] = quantizeRGB( origImg, k )

numpixels = size(origImg,1) * size(origImg,2);

%imshow(X)
X = im2double(origImg);

X = reshape(X, numpixels, 3);

%Perform K-means
%X is the data(numeric matrix), k is the number of clusters
[idx,cols] = kmeans(X,k);
indices = uint8(idx);
size(idx)

Y = reshape(indices, size(origImg,1), size(origImg,2));

Z = Y - 1;


imshow(Z, cols);

outputImg = Z;
meanColors = cols;
clusterIds = indices;

%saveas(gcf,'k2.png');
%saveas(gcf,'k3.png');
%saveas(gcf,'k4.png');

subplot(1,2,1); imshow(origImg); title('Original Image');
subplot(1,2,2); imshow(Z, cols); title(strcat('Value of k is : ', num2str(k)));


end

