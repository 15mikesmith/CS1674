function displaySeam( im, seam, seamDirection )

figure;
imshow(im);

hold on;

if isequal(seamDirection,'HORIZONTAL')
    
         plot(1:size(im,2),seam);
else
       plot(seam,1:size(im,1));

end

end

