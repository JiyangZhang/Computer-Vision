function newImg = Kirsch(img, t)
[width, length] = size(img);
baseImg = zeros(width+2, length+2);  
baseImg(2:width+1, 2:length+1) = img;  % add zeros to the picture
for i = 2:width+1
    for j = 2:length+1
       d1 =(5*baseImg(i-1,j-1)+5*baseImg(i-1,j)+5*baseImg(i-1,j+1)-3*baseImg(i,j-1)-3*baseImg(i,j+1)-3*baseImg(i+1,j-1)-3*baseImg(i+1,j)-3*baseImg(i+1,j+1))^2; 
       d2 =((-3)*baseImg(i-1,j-1)+5*baseImg(i-1,j)+5*baseImg(i-1,j+1)-3*baseImg(i,j-1)+5*baseImg(i,j+1)-3*baseImg(i+1,j-1)-3*baseImg(i+1,j)-3*baseImg(i+1,j+1))^2;  
       d3 =((-3)*baseImg(i-1,j-1)-3*baseImg(i-1,j)+5*baseImg(i-1,j+1)-3*baseImg(i,j-1)+5*baseImg(i,j+1)-3*baseImg(i+1,j-1)-3*baseImg(i+1,j)+5*baseImg(i+1,j+1))^2; 
       d4 =((-3)*baseImg(i-1,j-1)-3*baseImg(i-1,j)-3*baseImg(i-1,j+1)-3*baseImg(i,j-1)+5*baseImg(i,j+1)-3*baseImg(i+1,j-1)+5*baseImg(i+1,j)+5*baseImg(i+1,j+1))^2; 
       d5 =((-3)*baseImg(i-1,j-1)-3*baseImg(i-1,j)-3*baseImg(i-1,j+1)-3*baseImg(i,j-1)-3*baseImg(i,j+1)+5*baseImg(i+1,j-1)+5*baseImg(i+1,j)+5*baseImg(i+1,j+1))^2; 
       d6 =((-3)*baseImg(i-1,j-1)-3*baseImg(i-1,j)-3*baseImg(i-1,j+1)+5*baseImg(i,j-1)-3*baseImg(i,j+1)+5*baseImg(i+1,j-1)+5*baseImg(i+1,j)-3*baseImg(i+1,j+1))^2; 
       d7 =(5*baseImg(i-1,j-1)-3*baseImg(i-1,j)-3*baseImg(i-1,j+1)+5*baseImg(i,j-1)-3*baseImg(i,j+1)+5*baseImg(i+1,j-1)-3*baseImg(i+1,j)-3*baseImg(i+1,j+1))^2; 
       d8 =(5*baseImg(i-1,j-1)+5*baseImg(i-1,j)-3*baseImg(i-1,j+1)+5*baseImg(i,j-1)-3*baseImg(i,j+1)-3*baseImg(i+1,j-1)-3*baseImg(i+1,j)-3*baseImg(i+1,j+1))^2; 
       d =  max([d1,d2,d3,d4,d5,d6,d7,d8]);
       if d>t
           img(i-1, j-1) = 255;
       else
           img(i-1, j-1) = 0;
       end
    end
end
newImg = img;
