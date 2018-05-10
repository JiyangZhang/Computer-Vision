  
img_origin=imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验三\grid.bmp');  
d0=50;  %阈值  
%img_noise=imnoise(img_origin,'salt'); % 加椒盐噪声  
img_noise=imnoise(img_origin,'gaussian'); % 加高斯噪声  
img_f=fftshift(fft2(double(img_origin)));  %傅里叶变换得到频谱  
[m, n]=size(img_f);  
m_mid=fix(m/2);  %是不是可以有其他取整方式？  
n_mid=fix(n/2);    
img_lpf=zeros(m,n);  
for i=1:m  
    for j=1:n  
        d=sqrt((i-m_mid)^2+(j-n_mid)^2);   %理想低通滤波，求距离  
        if d<=d0  
            h(i,j)=1;  
        else  
            h(i,j)=0;  
        end  
        img_lpf(i,j)=h(i,j)*img_f(i,j);    
    end  
end  
  
img_lpf1=ifftshift(img_lpf);    %反傅里叶变换  
img_lpf2=uint8(real(ifft2(img_lpf1)));  %取实数部分  
  
subplot(2,2,1);imshow(img_origin);title('原图');  
subplot(2,2,2);imshow(img_noise);title('噪声图');  
subplot(2,2,3);imshow(img_lpf2);title('理想低通滤波');  