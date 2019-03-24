function [predicted_labels_test] = findLabelsSVM(pyramids_train, labels_train, pyramids_test)

predicted_labels_test = zeros(size(pyramids_train,1),1);
X = pyramids_train;

Y = labels_train;

X_test = pyramids_test;

model = fitcecoc(X, Y);

count = 1;

for i =1:size(pyramids_test,1)
    label = predict(model, X_test(count,:));
    predicted_labels_test(count,1) = label;
    count = count + 1;

end

end

