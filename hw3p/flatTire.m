I = rgb2gray(imread('flat1.jpg'));
I = rot90(I);

r = [0 0 900 900 ];
c = [0 750 750 0];

BW = roipoly(I,c,r);

H = fspecial('disk',30);
J = roifilt2(H,I,BW);

imshow(I)

figure
imshow(J)
saveas(gcf,'blurredFlat.png');