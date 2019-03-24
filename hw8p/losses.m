load('weights_samples.mat')

s1 = [W1*x1; W1*x2; W1*x3; W1*x4 ];
s2 = [W2*x1; W2*x2; W2*x3; W2*x4 ];
s3 = [W3*x1; W3*x2; W3*x3; W3*x4 ];


%HINGE_LOSS
h1_loss = zeros(1,4);

index = 1;
for i =1:4:16
    h1_loss(1,index) = hinge_loss(s1(i:i+3),index);
    index = index + 1;
end

h1_loss = sum(h1_loss)/4;

disp("Hinge Loss for W1")
disp(h1_loss)


h2_loss = zeros(1,4);

index = 1;
for i =1:4:16
    h2_loss(1,index) = hinge_loss(s2(i:i+3),index);
    index = index + 1;
end

h2_loss = sum(h2_loss)/4;

disp("Hinge Loss for W2")
disp(h2_loss)

h3_loss = zeros(1,4);

index = 1;
for i =1:4:16
    h3_loss(1,index) = hinge_loss(s3(i:i+3),index);
    index = index + 1;
end

h3_loss = sum(h3_loss)/4;

disp("Hinge Loss for W3")
disp(h3_loss)



%CROSS_ENTROPY

ce1_loss = zeros(1,4);

index = 1;
for i =1:4:16
    ce1_loss(1,index) = cross_entropy_loss(s1(i:i+3),index);
    index = index + 1;
end

ce1_loss = sum(ce1_loss)/4;

disp("Cross Entropy Loss for W1")
disp(ce1_loss)

ce2_loss = zeros(1,4);

index = 1;
for i =1:4:16
    ce2_loss(1,index) = cross_entropy_loss(s2(i:i+3),index);
    index = index + 1;
end

ce2_loss = sum(ce2_loss)/4;

disp("Cross Entropy Loss for W2")
disp(ce2_loss)

ce3_loss = zeros(1,4);

index = 1;
for i =1:4:16
    ce3_loss(1,index) = cross_entropy_loss(s3(i:i+3),index);
    index = index + 1;
end

ce3_loss = sum(ce3_loss)/4;

disp("Cross Entropy Loss for W3")
disp(ce3_loss)