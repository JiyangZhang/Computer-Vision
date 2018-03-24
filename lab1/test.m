ls = imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验一\landscape.jpg');
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
subplot(2,1,1); imshow(ls); title('原图');
subplot(2,1,2); imshow(Img); title('直方图均衡处理后');



