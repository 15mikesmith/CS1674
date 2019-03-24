function [Output] = my_pool(Input, Pool_Size)

%computes the output of max-pooling over Pool_SizexPool_Size regions of the input.
%Again, you are not allowed to use built-in Matlab functions that compute pooling. 

l = Pool_Size;

w = Pool_Size;


Output = zeros(size(Input,1)/Pool_Size);
index =1;
index2 = 1;
for i =1:Pool_Size:size(Input,1)-Pool_Size + 1
    %index = 1;
    index2 = 1;

    for j =1:Pool_Size:size(Input,1)-Pool_Size + 1
        Output(index,index2) = max(max(Input(i:i+Pool_Size-1,j:j+Pool_Size-1)));
        index2 = index2 +1;
    end
    index = index + 1;
end


end

