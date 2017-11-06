clear all;

% Plot two 1D-gaussian funcitons
figure;
x = -1000:1000;
y_1 = gaussian_1d(x, 0, 5);
y_2 = gaussian_1d(x, 0, 150);
subplot(2,1,1);
plot(x,y_1);
title('1D-Gaussian function with mu, sigma = (0,5)');
subplot(2,1,2);
plot(x,y_2);
title('1D-Gaussian function with mu, sigma = (0,150)');

% Plot 3x3(mu=0, sigma=1) gaussian filter and 3x3(mu=0, sigma=4) gaussian
% filter
gaussian_3x3_sig1_kernel = gaussian_2dkernel([3,3],[1,1]);
gaussian_3x3_sig1_kernel
gaussian_3x3_sig4_kernel = gaussian_2dkernel([3,3],[4,4]);
gaussian_3x3_sig4_kernel
figure;
subplot(1,2,1);
imshow(gaussian_3x3_sig1_kernel);
title('3x3 Gaussian filter with mu, sigma = (0, 1)');
subplot(1,2,2);
imshow(gaussian_3x3_sig4_kernel);
title('3x3 Gaussian filter with mu, sigma = (0, 4)');

% Apply 3x3 and 7x7 gaussian filter on an image. With sigma=1.0, mu=0.0
origin_img = imread('./Koala.bmp');
% origin_img = imread('./Lenna.tiff');

gaussian_3x3x3_kernel = gaussian_2dkernel([3,3],[1,1]);
gaussian_3x3x3_kernel = reshape(repmat(gaussian_3x3x3_kernel, 1,3), 3, 3, 3);
gaussian_7x7x3_kernel = gaussian_2dkernel([7,7],[1,1]);
gaussian_7x7x3_kernel = reshape(repmat(gaussian_7x7x3_kernel, 1,3), 7, 7, 3);
gaussian_11x11x3_kernel = gaussian_2dkernel([11,11],[4,4]);
gaussian_11x11x3_kernel = reshape(repmat(gaussian_11x11x3_kernel, 1,3), 11, 11, 3);

modified_img_3x3 = my_conv(origin_img, gaussian_3x3x3_kernel);
modified_img_3x3 = uint8(round(modified_img_3x3));
modified_img_7x7 = my_conv(origin_img, gaussian_7x7x3_kernel);
modified_img_7x7 = uint8(round(modified_img_7x7));
modified_img_11x11 = my_conv(origin_img, gaussian_11x11x3_kernel);
modified_img_11x11 = uint8(round(modified_img_11x11));

figure;
imshow(origin_img);
title('Original image');
figure;
imshow(modified_img_3x3);
title('Applied 3x3 gaussian filter with sigma=1.0');
figure;
imshow(modified_img_7x7);
title('Applied 7x7 gaussian filter with sigma=1.0');
figure;
imshow(modified_img_11x11);
title('Applied 11x11 gaussian filter with sigma=4.0');
figure;
xlim=500:500+300;
ylim=300:300+100;
% xlim=99:324;
% ylim=379:477;
subplot(4,1,1);
imshow(origin_img(ylim,xlim,:));
title('Original image(crop)');
subplot(4,1,2);
imshow(modified_img_3x3(ylim,xlim,:));
title('Applied 3x3 gaussian filter with sigma=1.0(crop)');
subplot(4,1,3);
imshow(modified_img_7x7(ylim,xlim,:));
title('Applied 7x7 gaussian filter with sigma=1.0(crop)');
subplot(4,1,4);
imshow(modified_img_11x11(ylim,xlim,:));
title('Applied 11x11 gaussian filter with sigma=4.0(crop)');