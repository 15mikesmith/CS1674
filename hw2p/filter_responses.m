filenames = {'cardinal1.jpg','cardinal2.jpg','leopard1.jpg','leopard2.jpg','panda1.jpg','panda2.jpg'};

F = makeLMfilters;


for index = 1: 48
%for index = 1: 1

        figure;
        subplot(2, 4, 1); imagesc(F(:,:,index));
        subplot(2, 4, 2); 

for count = 1: length(filenames)

    im = imread(filenames{count});
    
    greyImage = double(rgb2gray(im));

    greyImage = imresize(greyImage,[100 100]);
    
    B = imfilter(greyImage,F(:,:,index),'corr');
       

        subplot(2, 4, count+2); imagesc(B); title([num2str(filenames{count})]);

                %saveas(gcf, 'different_animals_similar.png');

        
        end 
    end
    

