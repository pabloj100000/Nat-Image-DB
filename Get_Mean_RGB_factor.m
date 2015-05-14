function [averageRGB] = Get_Mean_RGB_factor()
    % each image in the DB as been scaled by Image.RGB_scale_factor.
    % open all the AUX files and compute a mean Image.RGB_scale_factor
    
    try
        originalDir = pwd;
        cd('RawData')
        dirs = dir('cd*');

        averageRGB=0;
        filesN=0;

        % loop through all raw data dirs
        for i=1:length(dirs)
            cd(dirs(i).name);

            files = dir('DSC_*_AUX.mat');

            for j=1:length(files)
                load(files(i).name);
                if isfield(Image, 'RGB_scale_factor')
                    averageRGB = averageRGB + Image.RGB_scale_factor;
                    filesN = filesN + 1;
                end
            end
            cd ../  % back into "RawData" Folder
        end

        averageRGB = averageRGB/filesN
        cd .. % back into "Natural Imaged DB" FOlder
    catch
        cd(originalDir)
    end