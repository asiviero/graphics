function [X, map] = gray2ind_new(Im,indexSize)

    if nargin < 1
        error('Sem parametros de Entrada');
    end

    if nargin == 1
       indexSize = 64 
    end

    % Fill index
    map = zeros(indexSize,3);
    for i = 1:indexSize
        aux = (i-1)/(indexSize-1);
        for j= 1:3
            map(i,j) = aux;
        end    
    end
    
    imsize = size(Im)
    X = zeros(imsize);
    
    for i = 1:imsize(1)
        for j=1:imsize(2)
            X(i,j) = round(indexSize*Im(i,j))+1; 
        end
    end
    

end

