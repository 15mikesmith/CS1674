function [ x,y, scores, Ih, Iv ] = extract_keypoints( image )

greyImage = double(rgb2gray(image));


sobelY = [1 2 1;0 0 0; -1 -2 -1];

sobelX = [1 0 -1;2 0 -2; 1 0 -1];


Ih = imfilter(greyImage, sobelX);

Iv = imfilter(greyImage, sobelY);


k = 0.05;


% 2) Compute products of derivatives at every pixel
Ih2 = Ih.^2;
Iv2 = Iv.^2;
Ihv = Ih.*Iv;

numOfRows = size(greyImage, 1);
numOfColumns = size(greyImage, 2);

%Initialize zero Matrix
R = zeros(numOfRows, numOfColumns);


for y = 6:size(greyImage,1)-6
    for x = 6:size(greyImage,2)-6

        %Compute the Means
        
        M = [mean(reshape(Ih2(y-2:y+2,x-2:x+2)',[],1)), mean(reshape(Ihv(y-2:y+2,x-2:x+2)',[],1)); 
             mean(reshape(Ihv(y-2:y+2,x-2:x+2)',[],1)), mean(reshape(Iv2(y-2:y+2,x-2:x+2)',[],1))];
        
         Harris = det(M) - (k * trace(M)^2);
              
         %Save the Values
        
        R(y,x) = Harris;
       
    end
end

scores = [];

%Compute Threshold to be 5 times the average R score
threshold = abs(5 * mean(mean(R)));

%Find Max keypoints
[r, c] = find(R > threshold);


for x = 1:size(r,1)
    scores = cat(2, scores,R(r(x),c(x)));
end

y = r;
x = c;


figure; imshow(image) 
hold on

for i = 1:size(scores,2)
    plot(x(i), y(i), 'ro', 'MarkerSize', scores(i) / 1000000000);   
end
saveas(gcf,'vis3.png');
hold off


end
