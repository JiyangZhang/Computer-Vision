function value = distortion_correction(img_path, img_type)

%  parameters: img_path: the direct path of the picture
%              img_type: specify whether the page is the left page or right page 

%  imread the image
img = imread(img_path);
img = rgb2gray(img);
if strcmpi(img_type,'left')
    img = img(:,end:-1:1);
end

%  grid find the best parameters
output = grid_search(img);
%  parameters of the model
% a = 1200;
% b = 1700;
a = output(1);
b = output(2);
x0 = a;

% the estimated function 
syms x;
h = sqrt((a^2-(x-x0)^2)/(a^2+((b^2/a^2)-1) * (x-x0)^2));
[m,n] = size(img);

% iteration, only correct 1/3 of the picture
% suppose 1/3 has the worst distortion
stopos = round(n/2);
pos = zeros(1,stopos);

for i=1:1
    pos(i,1) = 1;
    for j=2:2*n
        d = subs(h,pos(i,j-1));
        pos(i,j) = pos(i,j-1) + d; % 对应畸变图像上的坐标
        fprintf('collum is:%d\n', j);
        if pos(i,j) >= stopos
            fprintf('the pos is:%f', pos(i,j));
            pos(i,j) = stopos;
            break;
        end
    end
end

[~,len] = size(pos);
% 1/3 needs correction

% interpolation
value = zeros(m,len+n-stopos);
for i=1:m
    value(i,1:len)=interp1(double((1:stopos)),double(img(i,1:stopos)),double(pos(1,:)),'linear');
    value(i,len+1:end) = img(i,stopos+1:end);
    fprintf('at collum number:%d\n', i);
end

%  decide which kind of image it is
if strcmpi(img_type,'left')
    value = value(:,end:-1:1);
end

imshow(value,[]);
imwrite(value/255,'correctionb3.jpg');