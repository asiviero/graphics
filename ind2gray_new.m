function  X = ind2gray_new(Index,map)

    if nargin < 2
        error('Entradas Invalidas');
    end
    
    imsize = size(Index);
    X = zeros(imsize);
    
    for i = 1:imsize(1)
        for j=1:imsize(2)
            %X(i,j) = round(indexSize*Im(i,j))+1; 
            %Index(i,j)
            graycoord = map(Index(i,j)+1);
            %for k=1:3
            X(i,j) = graycoord*255;
            %end
        end
    end
    X = uint8(X);

end


