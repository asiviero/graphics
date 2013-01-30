function eq_hist = equalizeHistogram(Image)


imsize = size(Image);
eq_hist = zeros(imsize);
% Acquiring Histogram
histogram = zeros(255,1);
for i = 1:imsize(1)
   for j = 1:imsize(2)
      histogram(Image(i,j)) = histogram(Image(i,j)) + 1;
   end
end
% Cummulative histogram
cum_histogram = cumsum(histogram);

for i = 1:imsize(1)
    for j = 1:imsize(2)
        eq_hist(i,j) = round(cum_histogram(Image(i,j))/prod(imsize) * 255);
    end    
end
eq_hist = uint8(eq_hist);
end

