I = imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验三\lena.bmp');
F = fftshift(fft2(double(I)));
F(128 : 129, 120) = 20 * F(128 : 129, 120);
F(128 : 129, 137) = 20 * F(128 : 129, 137);
T = abs(F);
F = ifft2(ifftshift(F));
imshow(F, [])
title('载入正弦波的图片');