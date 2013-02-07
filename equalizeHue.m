function eq_hist = equalizeHue(Image)


imsize = size(Image);
eq_hist = zeros(imsize);
% Acquiring Histogram
histogram = zeros(256,1);
for i = 1:imsize(1)
   for j = 1:imsize(2)
      histogram(Image(i,j)+1) = histogram(Image(i,j)+1) + 1;
   end
end
% Cummulative histogram
cum_histogram = cumsum(histogram);

for i = 1:imsize(1)
    for j = 1:imsize(2)
        eq_hist(i,j) = round(cum_histogram(Image(i,j)+1)/prod(imsize) * 85) + 170;
    end    
end
eq_hist = uint8(eq_hist);
end

