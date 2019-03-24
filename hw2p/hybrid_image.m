im1 = imread('woman_happy.png');
im2 = imread('woman_neutral.png');

im1 = (rgb2gray(im1));
im2 = (rgb2gray(im2));

im1 = imresize(im1,[512 512]);
im2 = imresize(im2,[512 512]);

im1_blur = imgaussfilt(im1, 10, 'FilterSize', 31);
im2_blur = imgaussfilt(im2, 10, 'FilterSize', 31);

im2_detail =  im2 - im2_blur;
%im2_detail =   im2_blur - im2 ;


final = im1_blur + im2_detail;

figure;
imshow(final);

saveas(gcf, 'hybrid.png');