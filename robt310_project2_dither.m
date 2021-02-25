function robt310_project2_dither(input_file_name, output_file_name, part)
%dither1 = dither(gray_img); %Comparing with ready function
image = imread(input_file_name);
gray_img = rgb2gray(image);
if (part == 0)
    new = gray_img;
    old = gray_img;
    quant_error = gray_img;
    [rows, columns] = size(gray_img);
    factor = 1;
    for c = 1:(columns-1)
        for r = 2:(rows-1)
            new(r,c) = uint8(round(factor*double(gray_img(r,c))/255) * double(255/factor));
            gray_img(r,c) = new(r,c);
            quant_error(r,c) = sqrt(sum(old(r,c).^2 - new(r,c).^2));
            
            gray_img(r+1,c) = gray_img(r+1,c) + quant_error(r,c) * 7/16;
            gray_img(r-1,c+1) = gray_img(r-1,c+1) + quant_error(r,c) * 3/16;
            gray_img(r,c+1) = gray_img(r,c+1) + quant_error(r,c) * 5/16;
            gray_img(r+1,c+1) = gray_img(r+1,c+1) + quant_error(r,c) * 1/16;
        end
    end
    subplot(1,2,1)
    imshow(old)
    title('Gray image')
    subplot(1,2,2)
    imwrite(gray_img,output_file_name)
    imshow(gray_img)
    title('Dithered image')
elseif(part == 1)
    subplot(1,2,1)
    imshow(gray_img)
    title('Gray image')
end
end
