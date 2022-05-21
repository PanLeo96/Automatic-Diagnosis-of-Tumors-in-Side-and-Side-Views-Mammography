load('Labeled_Data_Everything.mat');
rows=497;

for i=1:rows
    if (cell2mat(Table.DataTable.T.LEFTCC(i))~=0 & cell2mat(Table.DataTable.T.LEFTCC(i))~=1)
        disp ('in');
        Table.DataTable.T.LEFTCC(i)=Table.DataTable.T.Diagnosis(i);
    end
    if (cell2mat(Table.DataTable.T.RIGHTCC(i))~=0 & cell2mat(Table.DataTable.T.RIGHTCC(i))~=1)
        disp ('in');
        Table.DataTable.T.RIGHTCC(i)=Table.DataTable.T.Diagnosis(i);
    end
    if (cell2mat(Table.DataTable.T.LEFTMLO(i))~=0 & cell2mat(Table.DataTable.T.LEFTMLO(i))~=1)
        disp ('in');
        Table.DataTable.T.LEFTMLO(i)=Table.DataTable.T.Diagnosis(i);
    end
    if (cell2mat(Table.DataTable.T.RIGHTMLO(i))~=0 & cell2mat(Table.DataTable.T.RIGHTMLO(i))~=1)
        disp ('in');
        Table.DataTable.T.RIGHTMLO(i)=Table.DataTable.T.Diagnosis(i);
    end
end

Table.DataTable.T(end,:)=[];
