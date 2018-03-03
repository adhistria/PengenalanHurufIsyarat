load('lbpP4R8.mat')
load('randomIndexKFold.mat')
k=5;
% randomIndex = crossvalind('Kfold', length(dataTrain), k);
akurasiValidasiK = [];
akurasiValidasiS = [];
    svmParams = templateSVM('KernelFunction','rbf', 'KernelScale', 'auto', 'Standardize', 1);
for ii=1:k
    validation = randomIndex==ii; train=~validation;
    dtVTest = featureExtractionTrain(find(validation==1),:);
    dtVTrain = featureExtractionTrain(find(train==1),:);
    svmModel = fitcecoc(dtVTrain, labelTrain(find(train==1)), 'Learners', svmParams, 'Coding', 'onevsall');
    predictS= predict(svmModel,dtVTest);
% 
%     predictS = SVM(dtVTest,dtVTrain,labelTrain(find(train==1)));
    [akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
    akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
end
disp('Performansi SVM')
disp('Akurasi S')
akurasiS =mean(akurasiValidasiS(:,1))
disp('F1 Score')
f1ScoreS=mean(akurasiValidasiS(:,2))
disp('Precision')
precisionS=mean(akurasiValidasiS(:,3))
disp('Recall')
recallS=mean(akurasiValidasiS(:,4))
save('hasilValidasiP4R8.mat','f1ScoreS','precisionS','recallS','akurasiS');
disp('sukses')