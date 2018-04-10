% add three kinds of noise to lena
lena = imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验一\lena.bmp');  
% read the lena image
[M, N, Z] = size(lena);

J1 = imnoise(lena, 'salt & pepper', 0.02);
% add salt & pepper noise to the image

J2 = imnoise(lena,'gaussian',0,0.01);
% add gaussian noise to the image 

J3 = lena;
for i = 1 : M
        for j = 1 : N
            if rand < 0.01
                J3(i, j) = 255;
            end
        end
end
% add random impulse noise to the image

figure;
subplot(2,2,1); imshow(lena); title('原图像');
subplot(2,2,2); imshow(J1); title('加入椒盐噪声');
subplot(2,2,3); imshow(J2); title('加入高斯噪声');
subplot(2,2,4); imshow(J3); title('加入随机噪声');


