lena = imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验一\lena.bmp');  
% read the lena image
[M, N, Z] = size(lena);

%J1 = imnoise(lena, 'salt & pepper', 0.02);
J1 = imnoise(lena,'gaussian',0,0.01);
% add salt & pepper noise to the image

h1 =fspecial('average',[3,3]);
% create a 3*3 predifined average filter
lena_1 = imfilter(J1, h1);   % 均值滤波后的图
lena_2 = medfilt2(J1,[3 3]);  % 中值滤波后的图

subplot(2,2,1); imshow(lena); title('原图像');
subplot(2,2,2); imshow(J1); title('加入椒盐噪声');
subplot(2,2,3); imshow(lena_1);  title('均值滤波');
subplot(2,2,4); imshow(lena_2); title('中值滤波');