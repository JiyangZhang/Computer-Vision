I = imread('D:\����\ѧϰ\������\ͼ����������Ӿ�\ʵ��\ʵ����\lena.bmp');
F = fftshift(fft2(double(I)));
F(128 : 129, 120) = 20 * F(128 : 129, 120);
F(128 : 129, 137) = 20 * F(128 : 129, 137);
T = abs(F);
F = ifft2(ifftshift(F));
imshow(F, [])
title('�������Ҳ���ͼƬ');