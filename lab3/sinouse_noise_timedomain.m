img = imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验三\lena.bmp');
[m, n] = size(img);
x = 1:m; y = 1:n;
A = meshgrid(x,y);
img_noise = zeros(m,n);

for i = 1:m
    for j = 1:n
        noise = 60*(sin(50*A(i,j)));
        if img(i,j) + noise > 255
             img_noise(i,j) = 255;
         elseif img(i,j) + noise < 0
             img_noise(i,j) = 0;
        else
             img_noise(i,j) = img(i,j) + noise;
         end
     end
end
im = fft2(double(img_noise));
im = fftshift(im);

imshow(uint8(img_noise));
