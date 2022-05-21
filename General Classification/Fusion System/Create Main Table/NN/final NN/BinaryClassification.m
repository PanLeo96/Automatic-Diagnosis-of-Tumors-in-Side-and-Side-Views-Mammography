load('Labeled_Data_Everything1.mat');
LEFTCC=cell2mat(Table.DataTable.T.LEFTCC);
RIGHTCC=cell2mat(Table.DataTable.T.RIGHTCC);
LEFTMLO=cell2mat(Table.DataTable.T.LEFTMLO);
RIGHTMLO=cell2mat(Table.DataTable.T.RIGHTMLO);

LEFTPREDICTION= [LEFTCC LEFTMLO];

RIGHTPREDICTION= [RIGHTCC RIGHTMLO];

LEFT_PRED=ceil(NN_L(LEFTPREDICTION));
RIGHT_PRED=ceil(NN_R(RIGHTPREDICTION));

PREDICTION=[LEFT_PRED RIGHT_PRED];
OUTPUT=cell2mat(Table.DataTable.T.Diagnosis);