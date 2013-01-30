function pic_new = scale_image(pic,scale_zoom)

  oldSize = size(pic);                              
  newSize = max(floor(scale_zoom.*oldSize(1:2)),1)  
    
  % Define as novas coordenadas
  % Ainda nao tenho certeza sobre esses 0.5
  newX = (1:newSize(2))./scale_zoom
  newY = (1:newSize(1))./scale_zoom

  % Converte para Double para interpolar
  pic = double(pic);      
  
  % Tons de Cinza
  if numel(oldSize) == 2            
    pic_new = interp2(pic,newX,newY','cubic');
    
  % RGB  
  else
    pic_new = zeros([newSize 3]);  
    pic_new(:,:,1) = interp2(pic(:,:,1),newX,newY','cubic');  % R
    pic_new(:,:,2) = interp2(pic(:,:,2),newX,newY','cubic');  % G
    pic_new(:,:,3) = interp2(pic(:,:,3),newX,newY','cubic');  % B
  end

  pic_new = uint8(pic_new);

end