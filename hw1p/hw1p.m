clear all;
close all;
clc;

%MATRICES AND VECTORS:


%1
X = randn(1000000,1);
%vector of a million by one random numbers


%2
Y=X;
tic
for n = 1:size(X)
   % disp(X(n))
    Y(n) = Y(n)+1;
   % disp(X(n))
end
%Add 1 to each element using a loop
toc

fileID = fopen('answers.txt','w');
fprintf(fileID, '\nElapsed time in seconds using a loop is:');
fprintf(fileID,'%12.6f %12.6f\n',toc);

%3
tic;
Z = ones(1000000, 1);    
X = X+Z;
toc
fprintf(fileID, '\nElapsed time in seconds without using a loop is:');
fprintf(fileID,'%12.6f %12.6f\n',toc);

%4
A = 0.5:0.5:50;
B = 0.5:0.5:50;
C = A+B;
assert(all(C(:) == (1:100)') == 1)

%5
X=0:2:98;
Y=2.^X;
plot(X,Y)


%LOOPS ALLOWED:


%6

a= [1 2 3 4 5 6 7 8 9 10] ;
a = a(randperm(length(a)));

for n = 1:10
    a(n)
    if rem(n, 2) == 0
        pause(1);
    end
end

%7

A=rand(5,3);
B=rand(3,5);
C=zeros(5,5);

for i=1:5
  for j=1:5
     C(i,j)=0.0;
     for k=1:3
        C(i,j) = C(i,j)+A(i,k)*B(k,j);
     end 
   end 
end 




%IMAGES:



%12

A = imread('pittsburgh.png');
size(A) 
fprintf(fileID, '\nDimensions are: ');

fprintf(fileID,'%12f %12f\n',size(A));
fclose(fileID);

%13

I = rgb2gray(A);
figure;
%imshow(I);

%14

sum(I(:) == 6)

%15
vec = I(:);
[M,i] = min(vec) ;
[a,b] = ind2sub(size(I),i);


for n=a-15:a+15
    for m=b-15:b+15
       A(n,m,1)=255;
       A(n,m,2)=255;
       A(n,m,3)=255;
    end
end

%16

center=[size(A, 1)/2,size(A, 2)/2]

for n=center(1)-60:center(1)+60
    for m=center(2)-60:center(2)+60
       A(n,m,1)=150;
       A(n,m,2)=150;
       A(n,m,3)=150;
    end
end



gcf = figure;
imshow(A);

%18
saveas(gcf, 'new_image.png');


%19
img = imread('pittsburgh.png'); % Read image

red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel

redMean = mean2(red);
greenMean = mean2(green);
blueMean = mean2(blue);

img(:,:,1) = img(:,:,1) - redMean;%element subtraction to subtract average pixel value from all pixels
img(:,:,2) = img(:,:,2) - greenMean ;%element subtraction to subtract average pixel value from all pixels
img(:,:,3) = img(:,:,3) - blueMean ;%element subtraction to subtract average pixel value from all pixels

imshow(img);
saveas(gcf, 'mean_sub.png');



