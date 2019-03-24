%[5 pts] Call your computeSPMRepr to compute the spatial pyramid match representation on top of the extracted features, for all train/test images, and store the resulting representations in appropriate variables.

trainingSPM = zeros(size(train_images,1),250);

for i = 1:size(train_images,1)
    im = train_images{i,1};
    [pyramid] = computeSPMRepr(double(im),train_sift{i,1}, means);
    trainingSPM(i,:) = pyramid;

end


testingSPM = zeros(size(test_images,1),250);

for i = 1:size(test_images,1)
    im = test_images{i,1};
    [pyramid] = computeSPMRepr(double(im),test_sift{i,1}, means);
     testingSPM(i,:) = pyramid;

end


%[5 pts] Use an SVM classifier. Compare the quality of three representations, pyramid, level_0 and level_1.
%In other words, compare the full SPM representation to its constituent parts, which are the level-0 histogram and the concatenations of four histograms in level-1.
%Compute the accuracy at each level, by measuring what fraction of the images was assigned the correct label.
%In a file results1.txt, describe your findings, and give your explanation of the performance of the different representations.

%Quality for full pyramid

X = trainingSPM;
Y = train_labels;

X_test = trainingSPM;

model = fitcecoc(X, Y);

predicted_labels = zeros(size(X,1),1);

for i =1:size(X,1)
    label = predict(model, X_test(i,:));
    predicted_labels(i,1) = label;

end

trueLabels = Y;
predictedLabels = predicted_labels;

    correct_count = 0;

 for i = (1 : length(trueLabels))
        
        if trueLabels(i,1) == predictedLabels(i,1)
            correct_count = correct_count + 1;
        end
 end

    pyramid_accuracy = correct_count / length(trueLabels)


    
    
    %Compute accuracy for level 0
    

X = trainingSPM(1:50,1:50);
Y = train_labels(1:50,1);

X_test = trainingSPM(1:50,1:50);

model = fitcecoc(X, Y);

predicted_labels = zeros(size(X,1),1);

for i =1:size(X,1)
    label = predict(model, X_test(i,:));
    predicted_labels(i,1) = label;

end

trueLabels = Y;
predictedLabels = predicted_labels;

    correct_count = 0;

 for i = (1 : length(trueLabels))
        
        if trueLabels(i,1) == predictedLabels(i,1)
            correct_count = correct_count + 1;
        end
 end

    level_0_accuracy = correct_count / length(trueLabels)

       
    
      
 %Compute accuracy for level 1
    

X = trainingSPM(51:250,51:250);
Y = train_labels(51:250,1);

X_test = trainingSPM(51:250,51:250);

model = fitcecoc(X, Y);

predicted_labels = zeros(size(X,1),1);

for i =1:size(X,1)
    label = predict(model, X_test(i,:));
    predicted_labels(i,1) = label;
end

trueLabels = Y;
predictedLabels = predicted_labels;

    correct_count = 0;

 for i = (1 : length(trueLabels))
        
        if trueLabels(i,1) == predictedLabels(i,1)
            correct_count = correct_count + 1;
        end
 end

    level_1_accuracy = correct_count / length(trueLabels)
    