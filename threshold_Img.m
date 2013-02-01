function segImg = threshold_Img(Img)
% Function used to segmentate an image in which there're 2 main peaks
% in its histogram. It follows the algorithm described in Gonzales & Woods
% for Global Thresholding

T = 0.5*(double(min(Img(:))) + double(max(Img(:))));
done = false;
while ~done
    segImg = Img >= T;
    Tnext = 0.5*(mean(Img(segImg)) + mean(Img(~segImg)));    
    done = abs(T - Tnext) < 0.5;
    T = Tnext;
end
end

