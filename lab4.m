% imread the picture
i = imread('D:\����\ѧϰ\������\ͼ����������Ӿ�\ʵ��\ʵ����\cell2.BMP');
img = rgb2gray(i);
% ��ֵ�˲�
h=fspecial('average',[4,4]);     % create a 3*3 predifined average filter
img1 = imfilter(img, h);
% ��ֵ�˲�
img2 = medfilt2(img,[3 3]);   % median filter
% ��̬ѧ�˲�
% ������
se = strel('disk',2);   
img3 = imopen(img, se);
% ������a
img4 = imclose(img, se);
% imshow(img3);


% OSTU
level = graythresh(img4);  
a=~im2bw(img4,level);  

cc = bwconncomp(a); %������ͨ��ṹ
[L, NUM] = bwlabel(a,8);%��־��ֵͼ����ͨ��

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

% OSTU
level = graythresh(img4);  
a=~im2bw(img4,level);  

cc = bwconncomp(a); %������ͨ��ṹ
[L, NUM] = bwlabel(a,8);%��־��ֵͼ����ͨ��
s = regionprops(L,'centroid');
centroids = cat(1, s.Centroid);
imshow(img4,[]);hold on;


for i = 1 : size(centroids, 1)
    str = num2str(i);
    text(centroids(i, 1), centroids(i, 2), str, 'Color', 'Blue', 'Fontsize', 13, 'HorizontalAlignment', 'right');
end

coreArea = zeros(1,15);
cysArea = zeros(1,15);
proportion = zeros(1,15);
for i = 1 : cc.NumObjects
    threshold = graythresh(img4(L == i));
    pic1 = zeros(size(L)) + (im2bw(img4, threshold) == 0) .* (L == i);
    label = logical(pic1);
    STATS = regionprops(label,'area');
    corearea = STATS.Area;  % the area of core
    coreArea(1,i) = corearea;
    %pic2 = zeros(size(L)) + (im2bw(img4, threshold) == 1).*(L == i)+ pic1;
    label = logical(a);
    STATS = regionprops(label,'area');
    cysarea = STATS.Area;  % the area of cell
    cysArea(1,i) = cysarea;
    proportion(1,i) = corearea/cysarea;
end

