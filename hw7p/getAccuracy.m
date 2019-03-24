function [accuracy] = getAccuracy(trueLabels, predictedLabels)
    
    correct_count = 0;

    for i = (1 : length(trueLabels))
        
        if trueLabels(i,1) == predictedLabels(i,1)
            correct_count = correct_count + 1;
        end
    end

    accuracy = correct_count / length(trueLabels);

end
