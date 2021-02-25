function robt310_project2_histogram_equalize(input_file_name)
fun = @(block_struct) histeq(block_struct.data);
img = imread(input_file_name);
img2 = blockproc(img,[40 40],fun);
J = histeq(img);
figure();
subplot(1,2,1)
imshow(img);
title('Initial image')
subplot(1,2,2)
imhist(img,64)
figure;
subplot(1,2,1)
imshow(J)
title('Global histogram equalization')
subplot(1,2,2)
imhist(J,64)
figure;
subplot(1,2,1)
imshow(img2);
title('Local histogram equalization')
subplot(1,2,2)
imhist(img2,64)
end



