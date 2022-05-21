% Test_Dataset.A=removevars(Test_Dataset.A,{'breast_density','abnormalityId','abnormalityType','massMargins','assessment','subtlety'});
% Test_Dataset.A=removevars(Test_Dataset.A,{'breast_density','abnormalityId','abnormalityType','massMargins','assessment','subtlety'});

load("Test_Dataset.mat");
for i=1:height(Test_Dataset.A)
    outputImage = dicominfo(string(Test_Dataset.A.croppedImageFilePath(i)));
    if outputImage.Height>1000
        disp("change");
        temp=string(Test_Dataset.A.ROIMaskFilePath(i));
        Test_Dataset.A.ROIMaskFilePath(i)=Test_Dataset.A.croppedImageFilePath(i);
        Test_Dataset.A.croppedImageFilePath(i)=cellstr(temp);
    end
end

% for i=1:height(Test_Dataset.A)
%     if (contains(string(Test_Dataset.A.pathology(i)),'BENIGN')==1)
%         Test_Dataset.A.pathology(i)=num2cell(0);
%     elseif (contains(string(Test_Dataset.A.pathology(i)),'MALIGNANT')==1)
%         Test_Dataset.A.pathology(i)=num2cell(1);   
%     end
% end
