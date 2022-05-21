load('Test_Dataset.mat');
DataLen=height(Test_Dataset.A);
for i=1:DataLen
    
    filePath=string(Test_Dataset.A.imageFilePath(i));
    fileMask=string(Test_Dataset.A.ROIMaskFilePath(i));
    LeftRightfileName=string(Test_Dataset.A.leftOrRightBreast(i));
    CCMLOfileName=string(Test_Dataset.A.imageView(i));
    ChildtfileName=string(Test_Dataset.A.pathology(i));
    
    fileName=strcat(LeftRightfileName,CCMLOfileName,'/',ChildtfileName);
    if ~exist(strcat(LeftRightfileName,CCMLOfileName), 'dir')
        mkdir (strcat(LeftRightfileName,CCMLOfileName));
        if ~exist(fileName,'dir')
            mkdir(fileName)
        end
    end
    if ~exist(fileName,'dir')
        mkdir(fileName)
    end
    
        
    inputImage = dicomread(filePath);
    Mask=dicomread(fileMask);
    
    okind=find(Mask>0);
    [ii,jj]=ind2sub(size(Mask),okind);
    ymin=min(ii);
    ymax=max(ii);
    xmin=min(jj);
    xmax=max(jj);
    imCropped=imcrop(inputImage,[xmin,ymin,xmax-xmin+1,ymax-ymin+1]);
    [rows, columns, numberOfColorChannels] = size(imCropped);
    if numberOfColorChannels == 1
        imCropped = cat(3, imCropped, imCropped, imCropped);
    end
    targetSize=[224 224];
    try
        win1 = centerCropWindow2d(size(imCropped),targetSize);
        croppedImage = imcrop(imCropped,win1);
    catch
        croppedImage=imresize(imCropped,targetSize);
    end
    imwrite(croppedImage, fileName+'/'+'image'+string(i)+'.tif');
end