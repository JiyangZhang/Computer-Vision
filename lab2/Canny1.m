function newImag = Canny1(img, t)
[width, length, dim ] = size(img);
% turn into the gray picture
if dim>1
    img = rgb2gray(img);
end
baseImg = zeros(width+2, length+2);  
baseImg(2:width+1, 2:length+1) = img;  % add zeros to the picture
for i = 2:width+1
    for j = 2:length+1
        Gy = baseImg(i,j) + baseImg(i+1, j) - baseImg(i, j+1)  - baseImg(i+1, j+1);
        Gx = -baseImg(i, j) + baseImg(i+1, j) - baseImg(i, j+1) + baseImg(i+1, j+1);
        m = (Gx^2+Gy^2)^0.5; 
       % Ë«ãÐÖµ¼ì²â
       if m < t
           img(i-1,j-1) = 0;
       elseif m>t
           img(i-1,j-1) = 255;
       else
           tem =[baseImg(i-1,j-1), baseImg(i-1,j), baseImg(i-1,j+1);
                       baseImg(i,j-1),    baseImg(i,j),   baseImg(i,j+1);
                       baseImg(i+1,j-1), baseImg(i+1,j), baseImg(i+1,j+1)];
            temMax = max(tem);
            if temMax(1) > 2*t
                img(i-1,j-1) = 255;
            else
                img(i-1, j-1) = 0;
            end
       end
    end
end
newImag = img;