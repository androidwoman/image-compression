% Specify the path to the image
imagePath = 'my_image.jpg';

% Read the image
rgbImage = imread(imagePath);


% Convert the image to YCbCr color space
ycbcrImage = rgb2ycbcr(rgbImage);

% Extract the luminance component Y
YComponent = ycbcrImage(:,:,1);


% Display the original image and its histogram
figure;
subplot(2,2,1);
imshow(rgbImage);
title('Original Image');

subplot(2,2,2);
imhist(rgb2gray(rgbImage));
title('Histogram of the Original Image');

% Display the Y component and its histogram before computing differences
subplot(2,2,3);
imshow(YComponent, []);
title('Y Component Before Differences');

subplot(2,2,4);
imhist(YComponent);
title('Histogram of Y Component Before Differences');

% Compute pixel differences
pixelDifferences = diff(double(YComponent), 1, 2);

% Display histogram after computing differences
figure;
subplot(1,1,1);
histogram(pixelDifferences);
title('Histogram of Pixel Differences');
