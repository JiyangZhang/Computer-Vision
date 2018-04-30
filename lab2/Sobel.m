function newImg = Sobel(img, t)
[width, length] = size(img);
baseImg = zeros(width+2, length+2);  
baseImg(2:width+1, 2:length+1) = img;  % add zeros to the picture
for i = 2:width+1
    for j = 2:length+1
        Gy = -1*baseImg(i-1,j-1) + -2*baseImg(i-1,j) + -1*baseImg(i-1,j+1) + baseImg(i+1,j-1) + baseImg(i+1,j)*2 + baseImg(i+1,j+1);
        Gx = baseImg(i-1,j-1) + 2*baseImg(i,j-1) + baseImg(i+1,j-1) + -1*baseImg(i-1,j+1) + -2*baseImg(i,j+1) + -1*baseImg(i+1,j+1);
        m = abs(Gy) + abs(Gx);
        if m > t
            img(i-1, j-1) = 255;
        else
            img(i-1, j-1) = 0;
        end
    end
end
newImg = img;
end