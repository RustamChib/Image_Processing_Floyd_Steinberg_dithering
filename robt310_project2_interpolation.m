function robt310_project2_interpolation(input_file_name, output_file_name, scale_factor)

img = imread(input_file_name);
img = rgb2gray(img);
[rows, cols] = size(img);

x_new = round(scale_factor*(rows-1));
y_new = round(scale_factor*(cols-1));
M = zeros(x_new,y_new);

%Main algorithm
for r = 0:x_new    
    for c = 0:y_new
        M(r+1,c+1) = img(1+round(r./scale_factor),1+round(c./scale_factor));
    end 
end

subplot(1,2,1);
imagesc(img);
colormap gray;
subplot(1,2,2);
imagesc(M);
colormap gray;

%Write the images to files
imwrite(img,gray(256),'input.jpg');
imwrite(M,gray(256),output_file_name);

end
