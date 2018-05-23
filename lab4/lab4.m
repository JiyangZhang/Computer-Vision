% imread the picture
i = imread('D:\北航\学习\大三下\图像处理与机器视觉\实验\实验四\cell2.BMP');
img = rgb2gray(i);
% 中值滤波
h=fspecial('average',[4,4]);     % create a 3*3 predifined average filter
img1 = imfilter(img, h);
% 均值滤波
img2 = medfilt2(img,[3 3]);   % median filter
% 形态学滤波
% 开运算
se = strel('disk',2);   
img3 = imopen(img, se);
% 闭运算a
img4 = imclose(img, se);
% imshow(img3);


% OSTU
level = graythresh(img4);  
a=~im2bw(img4,level);  


cc = bwconncomp(a); %返回连通域结构
[L, NUM] = bwlabel(a,8);%标志二值图中连通域

list1 = zeros(1, NUM);
list2 = zeros(1, NUM);

for k= 1:NUM
    [m,n] = size(find(L==k));
    list1(1,k) = m*m;
    list2(1,k) = m*m;
end

list1 = sort(list1,'descend');
th = list1(1,15);


for k=1:NUM
    if list2(1,k)<th
        [I,J] = find(L==k);
        L(I,J) = 0;
    end
end
 
l = logical(im2bw(L));
l =~l;
img4(l) = 255;
%subplot(121);imshow(img4);
% OSTU
level = graythresh(img4);  
a=~im2bw(img4,level);  

cc = bwconncomp(a); %返回连通域结构
[L, NUM] = bwlabel(a,8);%标志二值图中连通域
s = regionprops(L,'centroid');
centroids = cat(1, s.Centroid);
imshow(img4);hold on;


for i = 1 : size(centroids, 1)
    str = num2str(i);
    text(centroids(i, 1), centroids(i, 2), str, 'Color', 'White', 'Fontsize', 13, 'HorizontalAlignment', 'center');
end

pic = zeros(size(L));
coreArea = zeros(1,15);
cysArea = zeros(1,15);
proportion = zeros(1,15);
for i = 1 : cc.NumObjects
    threshold = graythresh(img4(L == i))-20/256;
%     threshold = graythresh(img4(L == i));
    pic1 = (im2bw(img4, threshold) == 0) .* (L == i);
    pic = pic + pic1;
    label = logical(pic1);
    STATS = regionprops(label,'area');
    corearea = STATS.Area;  % the area of core
    coreArea(1,i) = corearea;
    pic2 = a.*(L == i);
    label = logical(pic2);
    STATS = regionprops(label,'area');
    cysarea = STATS.Area;  % the area of cell
    cysArea(1,i) = cysarea;
    proportion(1,i) = corearea/cysarea;
end
% 提取所有细胞核的图片
imshow(pic);
