%[5 pts] Apply the SVM and KNN classifiers (i.e. call findLabelsSVM, findLabelsKNN) to predict labels on the test set, using the pyramid variable as the representation for each image. 
%For KNN, use the following values of k=1:2:15. Each value of k gives a different KNN classifier.

result_Test_SVM = findLabelsSVM(trainingSPM,train_labels, testingSPM);

result_Test_KNN = zeros(2400,1);

k=1;
for i=1:300:2400
    result_Test_KNN(i:i+299,1:1) = findLabelsKNN(trainingSPM,train_labels, testingSPM,k);
k = k + 2;
end



result_Train_SVM = findLabelsSVM(trainingSPM,train_labels, trainingSPM);

result_Train_KNN = zeros(2400,1);

k=1;
for i=1:300:2400
    result_Train_KNN(i:i+299,1:1) = findLabelsKNN(trainingSPM,train_labels, trainingSPM,k);
k = k + 2;
end


%[2 pts] Compute the accuracy of each classifier on (1) the training set, and (2) the test set, by comparing its predictions with the "ground truth" labels.

SVM_Test_Accuracy = getAccuracy(test_labels, result_Test_SVM);

KNN_Test_Accuracy = zeros(8,1);

count = 1;

for i=1:8
    KNN_Test_Accuracy(i,1) = getAccuracy(test_labels, result_Test_KNN(count:count+299));
    count = count + 300;
end


SVM_Train_Accuracy = getAccuracy(train_labels, result_Train_SVM);

KNN_Train_Accuracy = zeros(8,1);

count = 1;

for i=1:8
    KNN_Train_Accuracy(i,1) = getAccuracy(train_labels, result_Train_KNN(count:count+299));
    count = count + 300;
end

%[5 pts] Plot the training and test accuracy of both types of classifiers, using the values of k on the x-axis, and accuracy on the y-axis. 
%Since SVM does not depend on the value of k, plots its performance as a straight line. Save the result as results.png and submit it. 
%For reference, my plot is as follows, but I have omitted some values of k intentionally. Label your axes and show a legend. Useful functions: plot, xlabel, ylabel, legend.

k=1:2:15;
j=1:15;


figure;

plot(k,KNN_Train_Accuracy','-o')
hold on;

plot(k,KNN_Test_Accuracy','-x')
hold on;

plot(k,repmat(SVM_Train_Accuracy,8),'-o')
hold on;

plot(k,repmat(SVM_Test_Accuracy,8),'-x')
hold off;


xlabel('k values')
ylabel('accuracy')
legend('KNN Train Accuracy','KNN Test Accuracy','SVM Train Accuracy','SVM Test Accuracy')

saveas(gcf,'results.png')


%[3 pts] Finally, in a text file results2.txt, explain what you see in your plot (using the full range of k values), and explain the trends on the training and test sets you see as k increases. 