clc
clear all;
close all;


im = imread('prague.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointprague.jpg');