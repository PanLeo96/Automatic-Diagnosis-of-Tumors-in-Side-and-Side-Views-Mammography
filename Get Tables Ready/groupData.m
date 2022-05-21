clc;
dataPath='C:/Users/.../CBIS-DDSM';

topLevelFolder = uigetdir(dataPath);
if topLevelFolder == 0
    return;
end
% Get list of all subfolders.
allSubFolders = genpath(topLevelFolder);
% Parse into a cell array.
remain = allSubFolders;
listOfFolderNames = {};
while true
    [singleSubFolder, remain] = strtok(remain, ';');
    if isempty(singleSubFolder)
        break;
    end
    listOfFolderNames = [listOfFolderNames singleSubFolder];
end
numberOfFolders = length(listOfFolderNames);
mass_test='mass_case_description_test_set.csv';
opts = detectImportOptions(mass_test,'NumHeaderLines',0);
A = readtable(mass_test,opts);
numberOfImages=size(A,1);

for i=1:numberOfImages
    str=A.imageFilePath(i);
    initialPath=strcat(extractBefore(str,'/'),'\');
    initialPath=strrep(initialPath,'/','\');
    for k = 1 : numberOfFolders
        thisFolder = listOfFolderNames{k};
        filePattern = sprintf('%s/*1-1.dcm', thisFolder);
        baseFileNames = dir(filePattern);
        numberOfImageFiles = length(baseFileNames);
        if numberOfImageFiles >= 1
            % Go through all those image files.
            for f = 1 : numberOfImageFiles
                fullFileName = fullfile(thisFolder, baseFileNames(f).name);
                index = strfind(fullFileName, initialPath);
                foundIt = ~isempty(index);
                if(foundIt==1)
                    A.imageFilePath(i)=cellstr(fullFileName);
                end
            end
        end
    end
end

for i=1:numberOfImages
    str=A.croppedImageFilePath(i);
    initialPath=strcat(extractBefore(str,'/'),'\');
    initialPath=strrep(initialPath,'/','\');
    for k = 1 : numberOfFolders
        thisFolder = listOfFolderNames{k};
        filePattern = sprintf('%s/*1-1.dcm', thisFolder);
        baseFileNames = dir(filePattern);
        numberOfImageFiles = length(baseFileNames);
        if numberOfImageFiles >= 1
            % Go through all those image files.
            for f = 1 : numberOfImageFiles
                fullFileName = fullfile(thisFolder, baseFileNames(f).name);
                index = strfind(fullFileName, initialPath);
                foundIt = ~isempty(index);
                if(foundIt==1)
                    A.croppedImageFilePath(i)=cellstr(fullFileName);
                end
            end
        end
    end
end

for i=1:numberOfImages
    str=A.ROIMaskFilePath(i);
    initialPath=strcat(extractBefore(str,'/'),'\');
    initialPath=strrep(initialPath,'/','\');
    for k = 1 : numberOfFolders
        thisFolder = listOfFolderNames{k};
        filePattern = sprintf('%s/*1-2.dcm', thisFolder);
        baseFileNames = dir(filePattern);
        numberOfImageFiles = length(baseFileNames);
        if numberOfImageFiles >= 1
            % Go through all those image files.
            for f = 1 : numberOfImageFiles
                fullFileName = fullfile(thisFolder, baseFileNames(f).name);
                index = strfind(fullFileName, initialPath);
                foundIt = ~isempty(index);
                if(foundIt==1)
                    A.ROIMaskFilePath(i)=cellstr(fullFileName);
                end
            end
        end
    end
end