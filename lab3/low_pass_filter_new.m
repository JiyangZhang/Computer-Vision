img_origin=imread('D:\����\ѧϰ\������\ͼ����������Ӿ�\ʵ��\ʵ����\grid.bmp');  
d0=35;  %��ֵ  
%img_origin = imnoise(img_origin, 'salt & pepper', 0.02);
img_f=fftshift(fft2(double(img_origin)));  %����Ҷ�任�õ�Ƶ��  
[m, n]=size(img_f);  
m_mid=fix(m/2);  
n_mid=fix(n/2);    
d = zeros(m,n);
for i=1:m  
    for j=1:n  
        d(i,j)=sqrt((i-m_mid)^2+(j-n_mid)^2);   %�����ͨ�˲��������  
    end
end
mask = zeros(m,n);
mask(d<d0) = 1;
img_lpf = mask.*img_f;
img_lpf1=uint8(abs(ifft2(ifftshift(img_lpf)))); %ȡģ
  
subplot(2,2,1);imshow(img_origin);title('ԭͼ');  
subplot(2,2,2);imshow(log(abs(img_f)), []);title('Ƶ��');  
subplot(2,2,3);imshow(log(abs(img_lpf)),[]);title('�˲���Ƶ��');  
subplot(2,2,4);imshow(img_lpf1,[]);title('��ͨ�˲��������');