addpath('/u/caffe/matlab/')

net = caffe.Net('/u/caffe/hw_cs1674/models/deploy.prototxt', '/u/caffe/hw_cs1674/models/alexnet.caffemodel', 'test');

image_mean = caffe.io.read_mean('/u/caffe/hw_cs1674/models/mean227.binaryproto');

images = imageSet('/u/caffe/hw_cs1674/data/scenes_lazebnik/', 'recursive');


fc6s = {};
fc7s = {};

imLabels = [];

currIm = 1;
for categoryNum = 1:size(images,2)
    for imageNum = 1:size(images(categoryNum).ImageLocation,2)
        
        imFeatures = caffe.io.load_image(images(categoryNum).ImageLocation{imageNum});
        imLabel = images(categoryNum).Description;
        
        imFeatures =  cat(3,imFeatures, imFeatures, imFeatures);

        resizeIm = imresize(imFeatures, [227,227]);
        resizeIm2 = resizeIm - image_mean;

        imToForward = net.forward({resizeIm2});

        %net.blobs(feature_name).get_data();
        
        fc7 = net.blobs('fc7').get_data();
        fc6 = net.blobs('fc6').get_data();
        

        
        fc7s(currIm).Label = imLabel;
        fc7s(currIm).Vector = fc7;
        
        fc6s(currIm).Label = imLabel;
        fc6s(currIm).Vector = fc6;
        
        imLabels(currIm) = categoryNum;
        
        currIm = currIm + 1;
    end
end


%Training and Testing

trainingLabels = [];
testingLabels = [];

fc6TrainingData = [];
fc6TestingData = [];

fc7TrainingData = [];
fc7TestingData = [];


trainCount = 1;
testCount = 1;

for currImage = 1:size(fc7s,2)
    
    training_sample = 0;
    
    r = rand();  
    if r <= 0.5
        training_sample = 1;
    end
    
    if training_sample == 1;
        trainingLabels(trainCount) = imLabels(currImage);
        fc7TrainingData = [fc7TrainingData; fc7s(currImage).Vector'];
        fc6TrainingData = [fc6TrainingData; fc6s(currImage).Vector'];

        
        trainCount = trainCount + 1;
    else
        testingLabels(testCount) = imLabels(currImage);
        fc7TestingData = [fc7TestingData; fc7s(currImage).Vector'];
        fc6TestingData = [fc6TestingData; fc6s(currImage).Vector'];
        
        testCount = testCount + 1;
    end
end

fc7SVM = fitcecoc(fc7TrainingData, trainingLabels);
fc6SVM = fitcecoc(fc6TrainingData, trainingLabels);

fc6Incorrect = 0.0;
fc6Correct = 0.0;

fc7Incorrect = 0.0;
fc7Correct = 0.0;



for image_index = 1:size(testingLabels, 2)

    fc6List = fc6TestingData(image_index, :);
    fc7List = fc7TestingData(image_index, :);
    
    trueLabel = testingLabels(image_index);
    
    fc6Label = predict(fc6SVM, fc6List);
    fc7Label = predict(fc7SVM, fc7List);

    if fc6Label == trueLabel
        fc6Correct = fc6Correct + 1.0;
    else
        fc6Incorrect = fc6Incorrect + 1.0;
    end
    
   
    if fc7Label == trueLabel
        fc7Correct = fc7Correct + 1.0;
    else
        fc7Incorrect = fc7Incorrect + 1.0;
    end
    
end

%Display output

disp('FC6 - Accuracy = ')
disp(fc6Correct/(fc6Correct + fc6Incorrect))

disp('FC7 - Accuracy = ')
disp(fc7Correct/(fc7Correct + fc7Incorrect))


