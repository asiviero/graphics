Ehsv = rgb2hsv(E);
teste = equalizeHue(uint8(Ehsv(:,:,1)*255));
teste = double(teste)/255;
Ehsv(:,:,1) = teste;
imshow(Ehsv)