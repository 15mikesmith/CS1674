function [ features, x, y, scores ] = compute_features( x, y, scores, Ix, Iy )


%[5 pts] If any of your detected keypoints are less than 5 pixels from the top/left or 5 pixels from the bottom/right of the image, i.e. pixels lacking 5+5 neighbors in either the horizontal or vertical direction, erase this keypoint from the x, y, scores vectors at the start of your code and do not compute a descriptor for it.
%[5 pts] To compute the gradient magnitude m(x, y) and gradient angle ?(x, y) at point (x, y), take L to be the image and use the formula below shown in class and Matlab's atand, which returns values in the range [-90, 90]. If the gradient magnitude is 0, then both the x and y gradients are 0, and you should ignore the orientation for that pixel (since it won't contribute to the histogram). 
%[5 pts] Quantize the gradient orientations in 8 bins (so put values between -90 and -67.5 degrees in one bin, the -67.5 to -45 degree angles in another bin, etc.). For example, you can have a variable with the same size as the image, that says to which bin (1 through 8) the gradient at that pixel belongs.
%[5 pts] To populate the SIFT histogram, consider each of the 8 bins. To populate the first bin, sum the gradient magnitudes that are between -90 and -67.5 degrees. Repeat analogously for all bins.
%[5 pts] Finally, you should clip all values to 0.2 as discussed in class, and normalize each descriptor to be of unit length, e.g. using hist_final = hist_final / sum(hist_final); Normalize both before and after the clipping. You do not have to implement any more sophisticated detail from the Lowe paper. 

magnitude = zeros(size(Ix));
orientation = zeros(size(Ix));

features = [];

for i = 1:size(Iy, 1)
    for j = 1:size(Ix, 2)
        
        magnitude(i, j) = sqrt(Ix(i,j)^2 + Iy(i,j)^2);
        
%Calculate the Oreinetation
        orientOfGradient = atand(Iy(i,j) / Ix(i,j));
        
        %not considered a gradient
        if (isnan(orientOfGradient))
            orientOfGradient = 0;
        end
        
        %Find the correct bin to place the gradinet orientation in
        if (orientOfGradient <= -67.5)
            orientation(i,j) = 1;
        elseif (orientOfGradient <= -45)
            orientation(i,j) = 2;
        elseif (orientOfGradient <= 22.5)
            orientation(i,j) = 3;
        elseif (orientOfGradient <= 0)
            orientation(i,j) = 4;
        elseif (orientOfGradient <= 22.5)
            orientation(i,j) = 5;
        elseif (orientOfGradient <= 45)
            orientation(i,j) = 6;
        elseif (orientOfGradient <= 67.5)
            orientation(i,j) = 7;
        else
            orientation(i,j) = 8;
        end
        
    end
end


%Compute feature values
for index = 1:size(scores,2)

    descriptor = zeros(8,1);

    row = y(1,index);
    col = x(1,index);
    
     if row <= 5 || col <= 5 || (size(magnitude,1) - row) <= 5 || (size(magnitude,2) - col) <= 5
         
         continue 
     end

    %calculate around the point
    for y_val = row-5:row+5
        for x_val = col-5:col+5
            %compute the magnitude and gradient, save them to descrptor
            mag = magnitude(y_val,x_val);
            orient = orientation(y_val, x_val);
            
            descriptor(orient, 1) = descriptor(orient, 1) + mag;
        end
    end
    
    
    features = cat(2, features, descriptor);
end

% normalize
for index = 1:size(features,2)
    f = features(:,index);
    f_normal = f(:)/sum(f);
    features(:, index) = f_normal;
end

%Clip to 0.2 
features( features > 0.2 ) = 0.2;

%normalize
for index = 1:size(f_normal,2)
    f = features(:,index);
    f_normal = f(:)/sum(f);
    features(:, index) = f_normal;
end


end