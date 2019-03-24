%Different for here
for x=1:numOfRows,
    for y=1:numOfColumns,

               x,y

H = [Sx2(x, y) Sxy(x, y); Sxy(x, y) Sy2(x, y)];

    end
end




output = R > imdilate(im, [1 1 1; 1 0 1; 1 1 1]);

figure, imshow(greyImage);
figure, imshow(output)