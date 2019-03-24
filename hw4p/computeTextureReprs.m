function [texture_repr_concat, texture_repr_mean] = computeTextureReprs(image, F) 


%    [3 pts] First, create a new variable responses of size num_filtersxnum_rowsxnum_cols, where num_rowsxnum_cols is the size of the image. Convert the input image to grayscale, and convert it to size 100x100. Compute the responses of the image to each of the filters, and store the results in responses.
%    [1 pts] Create the first image representation texture_repr_concat by simply converting responses to a vector, i.e. concatenating all pixels in the response images for all filters.
%    [1 pts] Now let's compute the image represenation in a different way. This time, the representation texture_repr_mean will be of size num_filtersx1. Compute each entry in texture_repr_mean as the mean response across all pixels to the corresponding filter. In other words, rather than keeping information about how each pixel responded to the filter, we are collapsing that information to a single value: the mean across all pixels.



im = rgb2gray(image);

I = im2double(im);

im = imresize(im, [100 100]);

%Create responses
responses = zeros(48,100,100);


for i = 1:48
    %Apply each filter to the im, store in repsonses
        responses(i,:,:) = imfilter(im,F(:,:,i),'conv');

end

%transpose
 texture_repr_concat = responses(:)';
 texture_repr_mean = mean(responses,2);
 texture_repr_mean = mean(texture_repr_mean,3);

 

end

