mask = imdilate(threshold_Img(rgb2gray(edgecolor('fig6.tiff','canny',0.16))),ones(3));
pimentoes = imread('fig6.tiff');
for i = 1:512
    for j = 1:512
        if mask(i,j) == 1
        pimentoes(i,j,:) = [255 255 255];
        end
    end
end
imshow(pimentoes)