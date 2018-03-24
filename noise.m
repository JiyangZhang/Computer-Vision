lena = imread('D:\����\ѧϰ\������\ͼ����������Ӿ�\ʵ��\ʵ��һ\lena.bmp');  
% read the lena image

J1 = imnoise(lena, 'salt & pepper', 0.02);
% add salt & pepper noise to the image

J2 = imnoise(lena,'gaussian',0,0.01);
% add gaussian noise to the image 

h1 =fspecial('average',[3,3]);
% create a 3*3 predifined average filter
lena_1 = imfilter(J1, h1);
lena_2 = medfilt2(J1,[3 3]);  % ��ֵ�˲����ͼ

figure;
subplot(2,2,1); imshow(lena); title('ԭͼ��');
subplot(2,2,2); imshow(J1); title('���뽷������');
subplot(2,2,3); imshow(lena_1);  title('��ֵ�˲�');
subplot(2,2,4); imshow(lena_2); title('��ֵ�˲�');

