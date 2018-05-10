  
img_origin=imread('D:\����\ѧϰ\������\ͼ����������Ӿ�\ʵ��\ʵ����\grid.bmp');  
d0=50;  %��ֵ  
%img_noise=imnoise(img_origin,'salt'); % �ӽ�������  
img_noise=imnoise(img_origin,'gaussian'); % �Ӹ�˹����  
img_f=fftshift(fft2(double(img_origin)));  %����Ҷ�任�õ�Ƶ��  
[m, n]=size(img_f);  
m_mid=fix(m/2);  %�ǲ��ǿ���������ȡ����ʽ��  
n_mid=fix(n/2);    
img_lpf=zeros(m,n);  
for i=1:m  
    for j=1:n  
        d=sqrt((i-m_mid)^2+(j-n_mid)^2);   %�����ͨ�˲��������  
        if d<=d0  
            h(i,j)=1;  
        else  
            h(i,j)=0;  
        end  
        img_lpf(i,j)=h(i,j)*img_f(i,j);    
    end  
end  
  
img_lpf1=ifftshift(img_lpf);    %������Ҷ�任  
img_lpf2=uint8(real(ifft2(img_lpf1)));  %ȡʵ������  
  
subplot(2,2,1);imshow(img_origin);title('ԭͼ');  
subplot(2,2,2);imshow(img_noise);title('����ͼ');  
subplot(2,2,3);imshow(img_lpf2);title('�����ͨ�˲�');  