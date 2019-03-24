function [bow] = test2(descriptors, means)
%Nick Miller
%CS 1674
    [~, vocabSize] = size(means);
    
    size(descriptors', 2)
    size(means,2)
    %means = means'
    distMatrix = dist2(descriptors, means);
    
     % computing the index of the cluster center 
    
     %To get the smallest element of each matrix row. Which would be the
     %least distance. 
    [c inds] = min(distMatrix,[],2);
    
    %Histogram 
    bow = histc(inds, 1:vocabSize);
    
    %Normalized Bow
    bow = bow./sum(bow);
    
end