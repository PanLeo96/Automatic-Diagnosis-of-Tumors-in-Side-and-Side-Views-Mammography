headers={'PatientID','RIGHTCC','LEFTCC','RIGHTMLO','LEFTMLO','RIGHTCC_Mask','LEFTCC_Mask','RIGHTMLO_Mask','LEFTMLO_Mask','Diagnosis'};
load ('Train_Dataset.mat');
load ('Test_Dataset.mat');

patientIDBeingStudied=Train_Dataset.A.patient_id(1);
lengthT=1;

DataLen=height(Train_Dataset.A);
DataLen1=height(Test_Dataset.A);

T.PatientID(lengthT)=Train_Dataset.A.patient_id(1);
T.Diagnosis(lengthT)=Train_Dataset.A.pathology(1);

data = cell(DataLen+DataLen1,10);
T = cell2table(data);
T.Properties.VariableNames = headers;
for i=1:DataLen
    if (strcmp(Train_Dataset.A.patient_id(i),patientIDBeingStudied)==1)
        T.PatientID(lengthT)=Train_Dataset.A.patient_id(i);
        T.Diagnosis(lengthT)=Train_Dataset.A.pathology(i);
        if (strcmp(Train_Dataset.A.leftOrRightBreast(i),"RIGHT")==1)
            if (strcmp(Train_Dataset.A.imageView(i),"CC")==1)
                T.RIGHTCC(lengthT)=Train_Dataset.A.imageFilePath(i);
                T.RIGHTCC_Mask(lengthT)=Train_Dataset.A.ROIMaskFilePath(i);
            else
                T.RIGHTMLO(lengthT)=Train_Dataset.A.imageFilePath(i);
                T.RIGHTMLO_Mask(lengthT)=Train_Dataset.A.ROIMaskFilePath(i);
            end
        else
            if (strcmp(Train_Dataset.A.imageView(i),"CC")==1)
                T.LEFTCC(lengthT)=Train_Dataset.A.imageFilePath(i);
                T.LEFTCC_Mask(lengthT)=Train_Dataset.A.ROIMaskFilePath(i);
            else
                T.LEFTMLO(lengthT)=Train_Dataset.A.imageFilePath(i);
                T.LEFTMLO_Mask(lengthT)=Train_Dataset.A.ROIMaskFilePath(i);
            end
        end
        lengthT=lengthT+1;
    else
        patientIDBeingStudied=Train_Dataset.A.patient_id(i);
    end
end

patientIDBeingStudied=Test_Dataset.A.patient_id(1);

for i=1:DataLen1
    if (strcmp(Test_Dataset.A.patient_id(i),patientIDBeingStudied)==1)
        T.PatientID(lengthT)=Test_Dataset.A.patient_id(i);
        T.Diagnosis(lengthT)=Test_Dataset.A.pathology(i);
        if (strcmp(Test_Dataset.A.leftOrRightBreast(i),"RIGHT")==1)
            if (strcmp(Test_Dataset.A.imageView(i),"CC")==1)
                T.RIGHTCC(lengthT)=Test_Dataset.A.imageFilePath(i);
                T.RIGHTCC_Mask(lengthT)=Test_Dataset.A.ROIMaskFilePath(i);
            else
                T.RIGHTMLO(lengthT)=Test_Dataset.A.imageFilePath(i);
                T.RIGHTMLO_Mask(lengthT)=Test_Dataset.A.ROIMaskFilePath(i);
            end
        else
            if (strcmp(Test_Dataset.A.imageView(i),"CC")==1)
                T.LEFTCC(lengthT)=Test_Dataset.A.imageFilePath(i);
                T.LEFTCC_Mask(lengthT)=Test_Dataset.A.ROIMaskFilePath(i);
            else
                T.LEFTMLO(lengthT)=Test_Dataset.A.imageFilePath(i);
                T.LEFTMLO_Mask(lengthT)=Test_Dataset.A.ROIMaskFilePath(i);
            end
        end
        lengthT=lengthT+1;
    else
        patientIDBeingStudied=Test_Dataset.A.patient_id(i);
    end
end
    