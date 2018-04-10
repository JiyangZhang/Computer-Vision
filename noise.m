% add three kinds of noise to lena
lena = imread('D:\����\ѧϰ\������\ͼ����������Ӿ�\ʵ��\ʵ��һ\lena.bmp');  
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
subplot(2,2,1); imshow(lena); title('ԭͼ��');
subplot(2,2,2); imshow(J1); title('���뽷������');
subplot(2,2,3); imshow(J2); title('�����˹����');
subplot(2,2,4); imshow(J3); title('�����������');


