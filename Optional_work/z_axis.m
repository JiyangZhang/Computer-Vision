function z = z_axis(a,b,img)

[~,n] = size(img);
syms y;
h = b*sqrt(1-((y-a)^2/a^2));
z = ones(1,n)*b;
for i=1:a
    z(1,i) = subs(h,i);
    if mod(i,200) == 0
        fprintf('column number:%d\n', i);
    end
end


        
