
%[1 pts] Read in the cardinal, leopard, and panda images from HW2P, and resize them to 100x100.
%[2 pts] Use the code you wrote above to compute three image representations (bow_repr, texture_repr_concat, and texture_repr_mean) for each image.
%[6 pts] Compute and print the ratio average_within_class_distance / average_between_class_distance for each representation. To do so, use one vector to store within-category distances (distances between images that are of the same animal category), and another to store between-category distances (distance between images showing different animal categories). Compute the mean of each of the two vectors, then compute the ratio of the means.
%[3 pts] In addition to your code, answer the following questions in a file answers.txt. For which of the three representations is the within-between ratio smallest? Is this what you expected? Why or why not? Which of the three types of descriptors that you used is the best one? How can you tell?

   
c1 = imread('cardinal1.jpg');    
c1 = imresize(c1, [100 100]);

c2 = imread('cardinal2.jpg'); 
c2 = imresize(c2, [100 100]);

l1 = imread('leopard1.jpg'); 
l1 = imresize(l1, [100 100]);

l2 = imread('leopard2.jpg'); 
l2 = imresize(l2, [100 100]);


p1 = imread('panda1.jpg');   
p1 = imresize(p1, [100 100]);

p2 = imread('panda2.jpg');  
p2 = imresize(p2, [100 100]);

fil = makeLMfilters();

%compute 3 image representations for c1
[ x, y, scores, Ix, Iy ] = extract_keypoints(c1);
[ features, x, y, scores ] = compute_features( x, y, scores, Ix, Iy );
c1_bow_repr = computeBOWRepr( features, means );
[c1_texture_repr_concat, c1_texture_repr_mean] = computeTextureReprs(c1,fil);

%compute 3 image representations for c2
[ x, y, scores, Ix, Iy ] = extract_keypoints(c2);
[ features, x, y, scores ] = compute_features( x, y, scores, Ix, Iy );
c2_bow_repr = computeBOWRepr( features, means );
[c2_texture_repr_concat, c2_texture_repr_mean] = computeTextureReprs(c2,fil);



%compute 3 image representations for l1
[ x, y, scores, Ix, Iy ] = extract_keypoints(l1);
[ features, x, y, scores ] = compute_features( x, y, scores, Ix, Iy );
l1_bow_repr = computeBOWRepr( features, means );
[l1_texture_repr_concat, l1_texture_repr_mean] = computeTextureReprs(l1,fil);

%compute 3 image representations for l2
[ x, y, scores, Ix, Iy ] = extract_keypoints(l2);
[ features, x, y, scores ] = compute_features( x, y, scores, Ix, Iy );
l2_bow_repr = computeBOWRepr( features, means );
[l2_texture_repr_concat, l2_texture_repr_mean] = computeTextureReprs(l2,fil);


%compute 3 image representations for p1
[ x, y, scores, Ix, Iy ] = extract_keypoints(p1);
[ features, x, y, scores ] = compute_features( x, y, scores, Ix, Iy );
p1_bow_repr = computeBOWRepr( features, means );
[p1_texture_repr_concat, p1_texture_repr_mean] = computeTextureReprs(p1,fil);

%compute 3 image representations for p2
[ x, y, scores, Ix, Iy ] = extract_keypoints(p2);
[ features, x, y, scores ] = compute_features( x, y, scores, Ix, Iy );
p2_bow_repr = computeBOWRepr( features, means );
[p2_texture_repr_concat, p2_texture_repr_mean] = computeTextureReprs(p2,fil);

%Compute the mean of each for for each image (bow_repr, texture_repr_concat, and texture_repr_mean)




%Computing average for bow_repr
average_within_class_distance_bow_repr = zeros(1,3);

%Use eclidiean distance to compute within class distance
average_within_class_distance_bow_repr(1,1) = eucl(mean(c1_bow_repr),mean(c2_bow_repr));
%disp(average_within_class_distance_bow_repr(1,1));

average_within_class_distance_bow_repr(1,2) = eucl(mean(l1_bow_repr),mean(l2_bow_repr));
%disp(average_within_class_distance_bow_repr(1,2));

average_within_class_distance_bow_repr(1,3) = eucl(mean(p1_bow_repr),mean(p2_bow_repr));
%disp(average_within_class_distance_bow_repr(1,3));


%Use eclidiean distance to compute between class distance
average_between_class_distance_bow_repr = zeros(1,3);

average_between_class_distance_bow_repr(1,1) = eucl(average_within_class_distance_bow_repr(1,1),average_within_class_distance_bow_repr(1,2));
%disp(average_between_class_distance_bow_repr(1,1));

average_between_class_distance_bow_repr(1,2) = eucl(average_within_class_distance_bow_repr(1,1),average_within_class_distance_bow_repr(1,3));
%disp(average_between_class_distance_bow_repr(1,2));

average_between_class_distance_bow_repr(1,3) = eucl(average_within_class_distance_bow_repr(1,2),average_within_class_distance_bow_repr(1,3));
%disp(average_between_class_distance_bow_repr(1,3));


disp(mean(average_within_class_distance_bow_repr)/mean(average_between_class_distance_bow_repr));




%Computing average for texture_repr_concat
average_within_class_distance_texture_repr_concat = zeros(1,3);

%Use eclidiean distance to compute within class distance
average_within_class_distance_texture_repr_concat(1,1) = eucl(mean(c1_texture_repr_concat),mean(c2_texture_repr_concat));
%disp(average_within_class_distance(1,1));

average_within_class_distance_texture_repr_concat(1,2) = eucl(mean(l1_texture_repr_concat),mean(l2_texture_repr_concat));
%disp(average_within_class_distance(1,2));

average_within_class_distance_texture_repr_concat(1,3) = eucl(mean(p1_texture_repr_concat),mean(p2_texture_repr_concat));
%disp(average_within_class_distance(1,3));


%Use eclidiean distance to compute between class distance
average_between_class_distance_texture_repr_concat = zeros(1,3);

average_between_class_distance_texture_repr_concat(1,1) = eucl(average_within_class_distance_texture_repr_concat(1,1),average_within_class_distance_texture_repr_concat(1,2));
%disp(average_between_class_distance(1,1));

average_between_class_distance_texture_repr_concat(1,2) = eucl(average_within_class_distance_texture_repr_concat(1,1),average_within_class_distance_texture_repr_concat(1,3));
%disp(average_between_class_distance(1,2));

average_between_class_distance_texture_repr_concat(1,3) = eucl(average_within_class_distance_texture_repr_concat(1,2),average_within_class_distance_texture_repr_concat(1,3));
%disp(average_between_class_distance(1,3));


disp(mean(average_within_class_distance_texture_repr_concat)/mean(average_between_class_distance_texture_repr_concat));








%Computing average for texture_repr_mean
average_within_class_distance_texture_repr_mean = zeros(1,3);

%Use eclidiean distance to compute within class distance
average_within_class_distance_texture_repr_mean(1,1) = eucl(mean(c1_texture_repr_mean),mean(c2_texture_repr_mean));
%disp(average_within_class_distance(1,1));

average_within_class_distance_texture_repr_mean(1,2) = eucl(mean(l1_texture_repr_mean),mean(l2_texture_repr_mean));
%disp(average_within_class_distance(1,2));

average_within_class_distance_texture_repr_mean(1,3) = eucl(mean(p1_texture_repr_mean),mean(p2_texture_repr_mean));
%disp(average_within_class_distance(1,3));


%Use eclidiean distance to compute between class distance
average_between_class_distance_texture_repr_mean = zeros(1,3);

average_between_class_distance_texture_repr_mean(1,1) = eucl(average_within_class_distance_texture_repr_mean(1,1),average_within_class_distance_texture_repr_mean(1,2));
%disp(average_between_class_distance(1,1));

average_between_class_distance_texture_repr_mean(1,2) = eucl(average_within_class_distance_texture_repr_mean(1,1),average_within_class_distance_texture_repr_mean(1,3));
%disp(average_between_class_distance(1,2));

average_between_class_distance_texture_repr_mean(1,3) = eucl(average_within_class_distance_texture_repr_mean(1,2),average_within_class_distance_texture_repr_mean(1,3));
%disp(average_between_class_distance(1,3));


disp(mean(average_within_class_distance_texture_repr_mean)/mean(average_between_class_distance_texture_repr_mean));



