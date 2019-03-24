function [ energyImage, Ix, Iy ] = energy_image( im )

%Convert to grayscale
greyImage = double(rgb2gray(im));


sobelY = [1 2 1;0 0 0; -1 -2 -1];

sobelX = [1 0 -1;2 0 -2; 1 0 -1];


Ix = imfilter(greyImage, sobelX);
%figure, imshow(Ix)

Iy = imfilter(greyImage, sobelY);
%figure, imshow(Iy)


%Ix is the gradient in the x direction

%Iy is the gradient in the y direction


energyImage = sqrt(Ix.^2 + Iy.^2);

%figure, imagesc(energyImage)

end

