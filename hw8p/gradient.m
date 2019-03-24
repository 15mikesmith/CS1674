load('weights_samples.mat')

scores = {W1*x1; W1*x2; W1*x3; W1*x4 };

h = 0.0001;

%HINGE_LOSS for weight vector 1
W_loss = zeros(1,4);

for i =1:4
    W_loss(1,i) = hinge_loss(scores{i},i);
end

W_loss = sum(W_loss)/4;


G = zeros(100,1);

for x = 1:100
new_W = W1(:);
new_W(x) = new_W(x) + h;

tempW = reshape(new_W, [4,25]);

new_scores = {tempW*x1; tempW*x2; tempW*x3; tempW*x4 };

new_W_loss = zeros(1,4);

for i =1:4
    new_W_loss(1,i) = hinge_loss(new_scores{i},i);
end

new_W_loss = sum(new_W_loss)/4;


G(x) = (new_W_loss - W_loss)/0.0001;


end

disp("Gradient when h = 0.0001")
disp(G)


load('weights_samples.mat')

scores = {W1*x1; W1*x2; W1*x3; W1*x4 };

h = 0.001;



%HINGE_LOSS for weight vector 1
W_loss = zeros(1,4);

for i =1:4
    W_loss(1,i) = hinge_loss(scores{i},i);
end

W_loss = sum(W_loss)/4;


G2 = zeros(100,1);

for x = 1:100
new_W = W1(:);
new_W(x) = new_W(x) + h;

tempW = reshape(new_W, [4,25]);

new_scores = {tempW*x1; tempW*x2; tempW*x3; tempW*x4 };

new_W_loss = zeros(1,4);

for i =1:4
    new_W_loss(1,i) = hinge_loss(new_scores{i},i);
end

new_W_loss = sum(new_W_loss)/4;


G2(x) = (new_W_loss - W_loss)/0.0001;


end


disp("Gradient when h = 0.001")
disp(G2)

