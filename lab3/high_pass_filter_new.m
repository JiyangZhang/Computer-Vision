img_origin=imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验三\grid.bmp');  
d0=50;  %阈值  
img_f=fftshift(fft2(double(img_origin)));  %傅里叶变换得到频谱  
[m, n]=size(img_f);  
m_mid=fix(m/2);  
n_mid=fix(n/2);    
d = zeros(m,n);
for i=1:m  
    for j=1:n  
        d(i,j)=sqrt((i-m_mid)^2+(j-n_mid)^2);   %理想低通滤波，求距离  
    end
end
mask = zeros(m,n);
mask(d>d0) = 1;
img_lpf = mask.*img_f;
img_lpf1=uint8(abs(ifft2(ifftshift(img_lpf)))); %取模
  
subplot(2,2,1);imshow(img_origin);title('原图');  
subplot(2,2,2);imshow(log(abs(img_f)), []);title('频谱');  
subplot(2,2,3);imshow(log(abs(img_lpf)),[]);title('滤波后频谱');  
subplot(2,2,4);imshow(img_lpf1,[]);title('滤波后的图片');