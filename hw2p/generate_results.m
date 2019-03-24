function [] = generate_results(filename, reduceAmt, reduceWhat)

im = imread(filename);


if isequal(reduceWhat,'WIDTH')
    altered = im;
    for index=1:reduceAmt
        if index == 1
           altered = reduceWidth(altered,true);
        else
           altered = reduceWidth(altered,false);
        end
    end
     
else
altered= im;
     for index=1:reduceAmt
        if index == 1
          altered=  reduceHeight(altered,true);
        else
           altered= reduceHeight(altered,false);
        end
     end
    
end
        figure;
        s(1) = subplot(1, 3, 1); imshow(im);
        title(s(1),'Original','fontsize',8 )
        s(2) = subplot(1, 3, 2); imshow(altered);
        word = ['Content-Aware, reduced ' num2str(reduceAmt) ' pixels'];
        
        title(s(2), word,'fontsize',8 )

        if isequal(reduceWhat,'WIDTH')

            s(3) = subplot(1, 3, 3); imshow(imresize(im,[size(im,1),size(im,2)- reduceAmt]));
        else
            s(3) = subplot(1, 3, 3); imshow(imresize(im,[size(im,1)- reduceAmt,size(im,2)]));
        end
        word2 = ['Standard, reduced ' num2str(reduceAmt) ' pixels'];

        title(s(3),word2,'fontsize',8 )
        
        %saveas(gcf, 'interesting.png');
                %imwrite(altered,'mall_width_reduced.png')

end