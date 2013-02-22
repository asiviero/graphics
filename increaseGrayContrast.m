function cont = increaseGrayContrast(img,s)

imsize = size(img);
avg = zeros(imsize);
img;

for i=2:(imsize(1)-1)
   for j=2:(imsize(2)-1)
      avg(i,j) = round((img(i-1,j+1) +  img(i,j+1) + img(i+1,j+1) + img(i-1,j) + img(i+1,j) + img(i-1,j-1) + img(i,j-1) + img(i+1,j-1))/8);
   end
end
avg = uint8(avg);
cont = (1-s)*avg + s*img;
end