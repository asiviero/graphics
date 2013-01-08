function grayImage = rgb2gray_new(rgbMatrix)
%rgb2gray_new Converts a RGB image to Grayscale
%   This follows MATLAB's own implementation of rgb2gray
%   with an weighted sum of the factors
%   0.2989 * R + 0.5870 * G + 0.1140 * B 

    aux_size = size(rgbMatrix);
    if(aux_size(3) ~= 3 || (aux_size(1) ~= aux_size(2)))
        error('Not a valid RGB input');
    end
    grayImage = zeros(aux_size(1),aux_size(2));
    for i = 1:aux_size(1)
       for j = 1:aux_size(2)
           grayImage(i,j) =  0.2989 * rgbMatrix(i,j,1) + 0.5870 * rgbMatrix(i,j,2) + 0.1140 * rgbMatrix(i,j,3);                       
       end                
    end
    max_m = max(max(grayImage))
    for i = 1:aux_size(1)
       for j = 1:aux_size(2)
           grayImage(i,j) = grayImage(i,j)/max_m;
       end                
    end
end

