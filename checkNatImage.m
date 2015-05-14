function norm = checkNatImage(index, saveFlag)

path = 'RawData/cd01A/';

files = dir([path, '*LUM.mat']);

load([path, files(index).name]);

%lum16 = uint16(LUM_Image);
%imshow(lum16)

v_min = min(LUM_Image(:));
v_max = max(LUM_Image(:));

norm = uint8((LUM_Image-v_min)*255/(v_max-v_min));


figure(1);
imshow(norm)
title([path, files(index).name])

if (saveFlag)
   imsave; 
end
