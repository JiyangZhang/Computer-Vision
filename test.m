ls = imread('D:\����\ѧϰ\������\ͼ����������Ӿ�\ʵ��\ʵ��һ\landscape.jpg');
R = ls(:,:,1);
G = ls(:, :, 2);
B = ls(:, :, 3);
Q = rgb2gray(ls);
R1 = histeql(R);
B1 = histeql(B);
G1 = histeql(G);
Img = cat(3, R1, G1, B1);
P = rgb2gray(Img);

figure;
subplot(2,1,1); imshow(ls); title('ԭͼ');
subplot(2,1,2); imshow(Img); title('ֱ��ͼ���⴦���');



