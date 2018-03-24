function img = histeql(ls)
area = size(ls);
width = area(1);
lenth = area(2);
gray = zeros(1, 256);
for i = 1:width
    for j = 1:lenth
        gray(ls(i,j)+1) = gray(ls(i,j)+1) + 1;
    end
end

for i = 2:256
        gray(i) = gray(i-1) + gray(i);
end

for i = 1:width
    for j = 1:lenth
        ls(i,j) = round((255/(width * lenth)) * gray(ls(i,j)+1));
    end
end

img = ls;





