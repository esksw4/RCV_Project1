close all;
clear;
n = 4;
Harrah = imread('IMG_0519.png');
doubleHarrah1 = rgb2gray(im2double(Harrah));
Billboard = imread('billboard.jpg');
doubleBillboard1 = rgb2gray(im2double(Billboard));
figure(1);
hold on;
imshow(doubleBillboard1);
title('1. Billboard Image');
x = [191.8750 306.8750 331.8750 189.3750]';
y = [56.8750 66.8750 261.8750 274.3750]';
hold off;
figure(2);
hold on;
imshow(doubleHarrah1);
title('2. face Image: Harrah');
xprime = [1 3264 3264 1]';
yprime = [1 1 2448 2448]';
hold off;
% finding homography matrix
fprintf('--------------------------------------');
fprintf('\n %s','homography matrix (9x1):');
[q] = homog(n,x,y,xprime,yprime)
fprintf('--------------------------------------\n');
% warpin using homography
[regimg] = homogwarp(doubleHarrah1,doubleBillboard1,q);
figure(3);
subplot(2,1,1);
imshow(regimg);
title('3. Warped face Image');
maskBill1 = roipoly(doubleBillboard1,x,y);
maskBill2 = 1 - maskBill1;
Bill1 = maskBill1 .* regimg;
Bill2 = maskBill2 .* doubleBillboard1;

final = Bill1 + Bill2;
subplot(2,1,2);
imshow(final);
title('4. Warped face image on Billboard');