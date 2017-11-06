clear all;
origin_img = imread('./Koala.bmp');
% Some modify here
gaussian_3x3x3_kernel = gaussian_2dkernel([3,3],[1,1]);
gaussian_3x3x3_kernel = reshape(repmat(gaussian_3x3x3_kernel, 1,3), 3, 3, 3);
gaussian_7x7x3_kernel = gaussian_2dkernel([7,7],[1,1]);
gaussian_7x7x3_kernel = reshape(repmat(gaussian_7x7x3_kernel, 1,3), 7, 7, 3);
modified_img_3x3 = my_conv(origin_img, gaussian_3x3x3_kernel);
modified_img_3x3 = uint8(round(modified_img_3x3));
modified_img_7x7 = my_conv(origin_img, gaussian_7x7x3_kernel);
modified_img_7x7 = uint8(round(modified_img_7x7));
subplot(1,3,1);
imshow(origin_img);
subplot(1,3,2);
imshow(modified_img_3x3);
subplot(1,3,3);
imshow(modified_img_7x7);
