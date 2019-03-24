%First, Encode all inputs and weights as matrices/vectors in Matlab. In our example, D=4, M=3, K=2.
x = [10 1 2 3];
z = [0 0 0];
y = [0 0];

w1 = [ 0.5 0.6 0.4 0.3;
            0.02 0.25 0.4 0.3;
            0.82 0.1 0.35 0.3];
w2 = [ 0.7 0.45 0.5;
            0.17 0.9 0.8];

%Second, write code to compute and print the value of z2, if a tanh activation is used. You can use Matlab's tanh function. 
%a2 = (w(1)21*x1)+(w(1)22*x2)+(w(1)23*x3)+(w(1)24*x4)

sumOfWeights = (w1(2,1) * x(1)) + (w1(2,2) * x(2)) + (w1(2,3) * x(3)) + (w1(2,4) * x(4));
z(2) = tanh(sumOfWeights);
disp(z(2))


%Third, write code to compute and print the value of y1


% Compute Z layer

for i=1:3

sumOfWeights = (w1(i,1) * x(1)) + (w1(i,2) * x(2)) + (w1(i,3) * x(3)) + (w1(i,4) * x(4));

if sumOfWeights < 0
    z(i) = 0;
else
    z(i) = sumOfWeights;
end

end


% Compute Y layer

sumOfWeights2 = (w2(1,1) * z(1)) + (w2(1,2) * z(2)) + (w2(1,3) * z(3));

%y(1) = exp(sumOfWeights2) / 1 + exp(sumOfWeights2)
y(1) = 1 / (1 + exp(-(sumOfWeights2)))


