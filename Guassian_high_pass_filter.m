img = imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验三\cave.jpg');
[M, N] = size(img);
s=fftshift(fft2(img));
d0=30;                                				
n1=fix(M/2);                          				
n2=fix(N/2);        
for i=1:M 
    for j=1:N
        d=sqrt((i-n1)^2+(j-n2)^2);         			
        h=1 - exp(-1/2*(d^2/d0^2));  				
        s(i,j)=h*s(i,j);                   				
    end
end
s=ifftshift(s);                          				
s=uint8(real(ifft2(s)));    
imshow(s);
