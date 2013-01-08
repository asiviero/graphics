function  X = ind2rgb_new(Index,map)

    if nargin < 2
        error('Entradas Invalidas');
    end
    
    imsize = horzcat(size(Index),3);
    X = zeros(imsize);
    
    for i = 1:imsize(1)
        for j=1:imsize(2)
            %X(i,j) = round(indexSize*Im(i,j))+1; 
            %Index(i,j)
            rgbcoord = map(Index(i,j)+1,:);
            for k=1:3
               X(i,j,k) = rgbcoord(k)*255;
            end
        end
    end
    X = uint8(X);

end


