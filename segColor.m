function [segImg,blueImg] = segColor(Img,colorV,T)

imsize = size(Img);
segImg = logical(zeros(imsize(1),imsize(2)));
blueImg = uint8(zeros(imsize));

for i=1:imsize(1)
   for j=1:imsize(2)
       rgbV = horzcat(Img(i,j,1),Img(i,j,2),Img(i,j,3));
       if(rgbV(1) == 53 && i == 474)
        %ij = horzcat(i,j)
        %rgbV
        %colorV
        %double(rgbV) - double(colorV)
        %norm(double(rgbV) - double(colorV))
       end
       segImg(i,j) = norm(double(rgbV) - double(colorV)) <= T;
   end
end

for i=1:imsize(1)
    for j = 1:imsize(2)
        %for k = 1:imsize(3)
            blueImg(i,j,1) = uint8(segImg(i,j))*0 + uint8(~segImg(i,j))*Img(i,j,1);
            blueImg(i,j,2) = uint8(segImg(i,j))*0 + uint8(~segImg(i,j))*Img(i,j,2);
            blueImg(i,j,3) = uint8(segImg(i,j))*255 + uint8(~segImg(i,j))*Img(i,j,3);
            %blueImg(i,j,2) = segImg(i,j)*0 + ~segImg(i,j)*Img(i,j,2);
            %blueImg(i,j,2) = segImg(i,j)*255 + ~segImg(i,j)*Img(i,j,3);
        %end
    end
end
end

