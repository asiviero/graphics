function decimg = DecStretch(Img)
%DecStretch Função criada para melhorar o contraste de imagens coloridas
imsize = size(Img);
n = prod(imsize);
sumx = zeros(3);
summ = zeros(3,1);

for l = 1:3
   for m = 1:3
      sumx(l,m) = sum(sum( Img(:,:,l).*Img(:,:,m) ));
   end
   summ = sum(Img(l,:,:));
end

covm = zeros(3);
for l = 1:3
   for m = 1:3
      covm(l,m) = (sumx(l,m) - summ(l)*summ(m)/n)/(n-1);
   end
end

corr = zeros(3);
for l = 1:3
   for m = 1:3
      corr(l,m) = covm(l,m)/sqrt(covm(l,l)*covm(m,m));
   end
end

[R,eigenv] = eig(corr);

stretchv = 1./(R.^(0.5));

T = abs(R'*stretchv*R);

decimg = uint8(zeros(imsize));

for i = 1:imsize(1)
    for j = 1:imsize(2)
        aux = vertcat(Img(i,j,1),Img(i,j,2),Img(i,j,3));
        decimg(i,j,:) = uint8(T*double(aux));
    end
end

end

