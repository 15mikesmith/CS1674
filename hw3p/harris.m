function [ x, y, scores, Ih, Iv ] = harris( image )
%EXTRACT_KEYPOINTS Extracts points with a high degree of 'cornerness' from
%RGB image matrix of type uint8
%   Input - image = NxMx3 RGB image matrix
%   Output - x = nx1 vector denoting the x location of each of n
%                detected keypoints 
%            y = nx1 vector denoting the y location of each of n 
%                detected keypoints
%            scores = an nx1 vector that contains the value (R) to which a
%            a threshold was applied, for each keypoint
%            Ih = A matrix with the same number of rows and columns as the
%            input image, storing the gradients in the x-direction at each
%            pixel
%            Iv = A matrix with the same nuimber of rwos and columns as the
%            input image, storing the gradients in the y-direction at each
%            pixel

% compute the gradients, re-use code from HW2P, use window size of 5px
% convert image to grayscale first
G = rgb2gray(image);

% convert to double
G2 = double(G);

% create X and Y Sobel filters
horizontal_filter = [1 0 -1; 2 0 -2; 1 0 -1];
vertical_filter = [1 2 1; 0 0 0 ; -1 -2 -1];

% using imfilter to get our gradient in each direction
filtered_x = imfilter(G2, horizontal_filter);
filtered_y = imfilter(G2, vertical_filter);

% store the values in our output variables, for clarity
Ih = filtered_x;
Iv = filtered_y;


Ih2 = Ih.^2;
Iv2 = Iv.^2;
Ihv = Ih.*Iv;
% Compute the values we need for the matrix...
% Using a gaussian blur, because I get more positive values after applying
% it, my values all skew negative for some reason...
%f = fspecial('gaussian');
%Ih2 = imfilter(Ix2, f);
%Iv2 = imfilter(Iy2, f);
%Ihv = imfilter(Ixy, f);

% set empirical constant between 0.04-0.06
k = 0.05;

num_rows = size(image,1);
num_cols = size(image,2);

% create a matrix to hold the Harris values
H = zeros(num_rows, num_cols);

% % get our matrix M for each pixel
for y = 6:size(image,1)-6
    for x = 6:size(image,2)-6
        % build a matrix using what we computed earlier
%         M = zeros(2,2);
%         M(1,1) = Ih2(y,x);
%         M(2,1) = Ihv(y,x);
%         M(1,2) = Ihv(y,x);
%         M(2,2) = Iv2(y,x);
%       
        % calculate means
        % Ih2 mean
        Ih2_matrix = Ih2(y-2:y+2,x-2:x+2);
        Ih2_mean = mean(Ih2_matrix(:));
        
        % Iv2 mean
        Iv2_matrix = Iv2(y-2:y+2,x-2:x+2);
        Iv2_mean = mean(Iv2_matrix(:));
        
        % Ihv mean
        Ihv_matrix = Ihv(y-2:y+2,x-2:x+2);
        Ihv_mean = mean(Ihv_matrix(:));
        
        Matrix = [Ih2_mean, Ihv_mean; 
                  Ihv_mean, Iv2_mean];
        R1 = det(Matrix) - (k * trace(Matrix)^2);
        
        
        % compute R, using te matrix we just created
        %R = det(M) - ( k * trace(M)^2 );
        %alt
        %R = (Ih2.*Iv2 - Ihv.^2) - k(Ih2+Iv2).^2;
        
        % store the R values in our Harris Matrix
       
        % H(y,x) = R;
        
        H(y,x) = R1;
       
    end
end

% set threshold of 'cornerness' to 5 times average R score
avg_r = mean(mean(H))
threshold = abs(5 * avg_r)

[row, col] = find(H > threshold);

scores = [];
%get all the values
for index = 1:size(row,1)
    %see what the values are
    r = row(index);
    c = col(index);
    
    %store the scores
    %score(index) = H(r,c);
    scores = cat(2, scores,H(r,c));
end

y = row;
x = col;


% This needs to be LAST
% non max suppression
% http://www.mathworks.com/help/images/ref/imregionalmax.html
% BW = imregionalmax(H);

% 7) Compute nonmax suppression
output = image > imdilate(image, [1 1 1; 1 0 1; 1 1 1]);

figure; imshow(image) 
hold on
for i = 1:size(scores,2)
    plot(x(i), y(i), 'ro', 'MarkerSize', scores(i) / 1000000000);
   % plot(x(i), y(i), 'ro', 'MarkerSize', scores(i) * 5);
    
end
%saveas(gcf,'hw04_pittsburgh_corners.png');
hold off

end
