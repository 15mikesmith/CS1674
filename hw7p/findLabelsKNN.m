function [predicted_labels_test] = findLabelsKNN(pyramids_train, labels_train, pyramids_test, k)

predicted_labels_test = zeros(size(pyramids_train,1),1);

    distance = [];
    

    for a = 1: size(pyramids_test,1)

        nearestNeighbors = zeros(300, 2);
        for b = 1:size(pyramids_train,1)
            
            distance = dist2(pyramids_test(a,:), pyramids_train(b,:));           
            nearestNeighbors(b,2) = labels_train(b);

            nearestNeighbors(b,1) = distance;
            
        end
        
        sorted = sortrows(nearestNeighbors,1);
        
        predicted_labels_test(a,1) = mode(sorted(1:k,2));

    end
end
