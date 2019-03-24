
im1 = imread('keble1.png');
im2 = imread('keble2.png');

figure;
imshow(im1);
impixelinfo;

figure;
imshow(im2);
impixelinfo;

PA = zeros(4,2);
PA(1,:) = [163,76];
PA(2,:) = [255,104];
PA(3,:) = [162,148];
PA(4,:) = [245,162];



PB = zeros(4,2);
PB(1,:) = [67,88];
PB(2,:) = [160,118];
PB(3,:) = [64,161];
PB(4,:) = [149,175];


H = estimate_homography(PA, PB);

p2 = apply_homography([164,78,1]',H);

figure;
subplot(1,2,1);
imshow(im1);
hold on;
plot(164,78,'g','Marker','o')
hold off;

subplot(1,2,2);
imshow(im2);
hold on;
plot(p2(1),p2(2),'y','Marker','o')


a = (size(im2,1)*3);
b = (size(im2,2)*3);
canvas = zeros(a,b , 3);

a = (size(im2,1)+1):(size(im2,1)*2);
b = (size(im2,2)+1):(size(im2,2)*2);

canvas(a,b,:) = im2;

%figure;
%imshow(uint8(canvas));


for i=1:size(im1,1)
    for j=1:size(im1,2)
    
        p2 = apply_homography([i,j,1]',H);
               
        canvas(floor(p2(1))+size(im2,2)+1, floor(p2(2))+size(im2,1)+1,  :) = im1(i,j,:);
        
        canvas(floor(p2(1))+size(im2,2)+1, ceil(p2(2))+size(im2,1)+1,  :) = im1(i,j,:);
        
        canvas(ceil(p2(1))+size(im2,2)+1, floor(p2(2))+size(im2,1)+1,  :) = im1(i,j,:);
        
        canvas(ceil(p2(1))+size(im2,2)+1, ceil(p2(2))+size(im2,1)+1,  :) = im1(i,j,:);
        
    end
end

figure;
imshow(uint8(canvas));




