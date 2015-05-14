function resaveDB(format)
% not actually downloading but changing the .mat files into .bin
% 1. Create the folder /BinFiles/cd25A/ or whatever the name is
% 2. Run the script

inputPath = '/Users/jadz/Documents/Notebook/Matlab/Natural Images DB/RawData/';
inputPath = [uigetdir(inputPath,'Select folder with images to resize'), '/'];

outPath = '/Users/jadz/Documents/Notebook/Experiments/Simulations/Natural Images DB/BinFiles';
outPath = [uigetdir(outPath, 'Select folder to store resized images'), '/'];


% For each Dir in path with name accroding to cd##A, generate another
% folder under outPath with the same name and copy to files from path/cd##A
% to outPath/cd##A in binary form.

dirList = dir(inputPath);
for j = 1:length(dirList)
    if dirList(j).isdir
        folder = dirList(j).name;
        if regexp(folder, 'cd[0-9]+A')
            imagesPathIn = [inputPath, folder, '/'];
            imagesPathOut = [outPath, folder, '/'];
            
            % create output folder
            mkdir(imagesPathOut)
            
            list = dir(imagesPathIn);
            
            % loop through list and process each image
            for i = 1:length(list)
                file = list(i).name;
                if regexp(file, 'DSC_[0-9]+_LUM.mat')
                    name = file;
                    a = load([imagesPathIn,name]);
                    LUM_Image = a.LUM_Image;
                    
                    nameout = [imagesPathOut, name(1:end-3), format];
                    switch format
                        case 'png'
                            imwrite(LUM_Image, nameout, format);
                        case 'bin'
                            fid = fopen(nameout, 'w');
                            fwrite(fid, LUM_Image, 'double');
                            fclose(fid);
                            
                    end
                    
                end
            end
        end
    end
end