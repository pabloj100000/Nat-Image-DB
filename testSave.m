function testSave(LUM_Image)
    imwrite(LUM_Image, 'test.png','PNG');
    imwrite(LUM_Image, 'test.tif','tif');
    imwrite(LUM_Image, 'test.jpg','jpg');
    
    fid = fopen('test.bin', 'w');
    fwrite(fid, LUM_Image, 'double');
    fclose(fid);

    
    