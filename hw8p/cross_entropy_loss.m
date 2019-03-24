function [loss] = cross_entropy_loss(scores, correct_class)

% exp values

scores = exp(scores);

%normalize values

%scores = scores/sum(scores)

%-log values

%loss = -log10(scores(correct_class))
loss= -log10(scores(correct_class)/sum(scores));

end

