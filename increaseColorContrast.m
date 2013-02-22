function rgbcont = increaseColorContrast(rgb,s)
%IncreaseColorContrast Apply increaseGrayContrast to RGB componentes

rgbcont = zeros(size(rgb));

rgbcont(:,:,1) = increaseGrayContrast(rgb(:,:,1),s);
rgbcont(:,:,2) = increaseGrayContrast(rgb(:,:,2),s);
rgbcont(:,:,3) = increaseGrayContrast(rgb(:,:,3),s);

rgbcont = uint8(rgbcont);
end

