function [ bow_repr ] = computeBOWRepr( descriptors, means )


%    [1 pt] A bag-of-words histogram has as many dimensions as the number of clusters k, so initialize the bow variable accordingly.
%    [3 pts] Next, for each feature (i.e. each row in features), compute its distance to each of the cluster means, and find the closest mean. A feature is thus conceptually "mapped" to the closest cluster. You can do this efficiently using the provided dist2 function, whose use is described at the top of the function.
%    [3 pts] To compute the bag-of-words histogram, count how many features are mapped to each cluster.
%    [1 pts] Finally, normalize the histogram by dividing each entry by the sum of the entries.


%Transpose both means and descriptor
means_transpose = means;
descriptors = descriptors';

%Verify sizes
size(descriptors, 2);
size(means_transpose,2);

%Calculate distances
distances_list = dist2(means_transpose, descriptors);

[min_values, cluster_indices] = min(distances_list, [], 1);

range = 1:size(means,1); 
  
                         
BOWunfiltered = histc(cluster_indices, range);

%normalize the BOW
BOWnormalized = BOWunfiltered / sum(BOWunfiltered);

%Transpose
bow_repr = BOWnormalized;

end