function p = grid_search(img)
% parameters:  img: the input image to be used
% img = imread('4.jpg');
% img = rgb2gray(img);

min_error = inf;
min_a = 0;
min_b = 0;
[m, n] = size(img);

% the real pixel value of the white page
x = zeros(1,n);
for j=1:n
    x(1,j) = img(round(m/20),j);  %  use the pixel of row 180
end


for a=1000:100:(floor(n/100))*100
    for b=1000:100:1700
        fprintf('The testing parameters are "a:%d, b:%d"\n', a,b);
        z = z_axis(a,b, img);
        par = polyfit(z,x,2);
        error = sum((polyval(par, z) - x).^2)/1745;
        if error < min_error
            min_error = error;
            min_a = a;
            min_b = b;
        end
        fprintf('min(a):%d, min(b):%d, min(error): %f\n', min_a,min_b,min_error);
    end 
end
p = [min_a, min_b];

            
