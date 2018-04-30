function maxTh = ostuTh(img)
grayImg = rgb2gray(img);
area = size(grayImg);
width = area(1);
lenth = area(2);
imgList = zeros(1, 256);
% calculate the number of each pixels
for i = 1:width
    for j = 1:lenth
        imgList(grayImg(i,j)+1) = imgList(grayImg(i,j)+1)+1;
    end
end
% calculate the freq
freqList = zeros(1, 256);
for i = 1:256
    freqList(i) = imgList(i)/(width*lenth);
end
% find the threshold
maxTh = 0;
maxDelt = 0;
for T = 1:256
    mut = 0;
    omigat = 0;
    for j = 1:T
        mut = mut + j*freqList(j);
        omigat = omigat + freqList(j);
    end
    mu0 = mut/omigat;
    mu = 0;
    for i = 1:256
        mu = mu + freqList(i) * i;
    end
    omiga1 = 1 - omigat;
    mu1 = (mu-mut) / (1-omigat);
    delt = omigat * omiga1 * (mu1-mu0)^2;
    if (delt > maxDelt)
        maxDelt = delt;
        maxTh = T-1;
    end
end

    
        
       
