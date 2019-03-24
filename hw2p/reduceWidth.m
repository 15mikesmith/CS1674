function [ reducedColorImage ] = reduceWidth( im, display_flag )

% generate a 1 x 3 subplot of the folliwng, energy image, culmatative
% energy image, optimal seam(using display seam
    
%SInce reduceHeight is already implemented just revrese to make it work for
%reduce width

energyImage = energy_image(im);
    M = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
    hs = find_optimal_vertical_seam(M);
    
    num_rows = size(im, 1);
    num_cols = size(im, 2);
    num_channels = size(im, 3);
    
     
    assert(length(hs) == num_rows);
        
    reducedColorImage = zeros([num_rows num_cols-1 num_channels]);

    for i = 1:num_rows
        for j = 1:num_channels
            this_row = im(i, :, j); 
            this_row(hs(i)) = [];
            reducedColorImage(i, :, j) = this_row;
        end      
    end
    
    reducedColorImage = uint8(reducedColorImage);
    
    if(display_flag)
        figure;
        subplot(1, 3, 1); imagesc(energyImage);
        subplot(1, 3, 2); imagesc(M);
                       % saveas(gcf, 'mall_energy.png');

        subplot(1, 3, 3); imshow(im); displaySeam(im, hs, 'VERTICAL')
    end
    
    



end

