function [Output] = my_conv(Image, Filter, Padding, Stride)


% %Height
% size(Image,1)+Padding*2
% 
% %Width 
% size(Image,2)+Padding*2

%((N+2*Padding)-F)/stride+1
l = ((size(Image,1)+Padding*2)-size(Filter,1))/Stride+1;

w = ((size(Image,2)+Padding*2)-size(Filter,1))/Stride+1;



conv_Im = zeros(l,w);
new_IM = zeros(size(Image,1)+2*Padding,size(Image,2)+2*Padding);
new_IM(Padding+1:Padding+size(Image,1),Padding+1:Padding+size(Image,2)) = Image;

index = 1;
index2 =  1;
    for i =1:Stride:size(new_IM,1)-size(Filter,1)+1
        
        index2 = 1;
       for j = 1:Stride:size(new_IM,2)-size(Filter,2)+1
            
            currIM = new_IM(i:i+size(Filter,1)-1,j:j+size(Filter,2)-1);
            
            currF = Filter(1:size(Filter,1),1:size(Filter,2));
            
            tempSum = sum(currIM.*currF,2);
                      
            conv_Im(index,index2)= sum(tempSum);
        
           index2 = index2 +1;
       end
       index = index+1;
    end
    Output = conv_Im;
    %Output

end

