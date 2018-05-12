img = imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验三\cave.jpg');
[M,N] = size(img);
% LN function of img
img_ln = zeros(M, N);
for i = 1:M
    for j = 1:N
        if log(double(img(i,j))) > 255
            img_ln(i,j) = 255;
        elseif log(double(img(i,j))) < 0
            img_ln(i,j) = 0;
        else
            img_ln(i,j) = log(double(img(i,j)));
        end
    end
end
% FFt transformation
Z = fftshift(fft2(img_ln));
% calculate the H(x)
D=zeros(M,N);
for i=1:M
    for j=1:N  
        D(i,j)=sqrt(((i-floor(M/2)-1)^2+(j-floor(N/2)-1)^2)); 
    end                 
end 
c=1;   %sharpen parameter 
Do=0.2; %usually the variance(cut-off frequency of the filter) 
H=(0.3 - 0.1)*(1-exp(-c*(D.^2/(Do^2))))+0.1; %function 

% apply the H to image
S = H.* Z;
s =ifft2(ifftshift(S));
% exponential
result = exp(abs(s)-0.01);
imshow(result, []);
