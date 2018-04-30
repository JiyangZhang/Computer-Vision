function Imag = Roberts(img,t)  % suppose the picture is gray
%grayImg = rgb2gray(img);
[width, length] = size(img);
% add zeros
baseImg = zeros(width+2, length+2);  
baseImg(2:width+1, 2:length+1) = img;
for i = 2:width+1
    for j = 2:length+1
        m = abs(baseImg(i,j) - baseImg(i+1,j+1)) + abs(baseImg(i+1,j) - baseImg(i,j+1));
        if m > t
            img(i-1, j-1) = 255;
        else
            img(i-1, j-1) = 0;
        end
    end
end
Imag = img;
        



