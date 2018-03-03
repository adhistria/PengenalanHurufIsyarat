allData = [];
nilaiK=1;
kernelName =''
for kk=1:10
    kk
    matFile='lbpP4';
    nameFile=strcat(matFile,'R',num2str(kk),'.mat');
    load(nameFile)
    load('randomIndexKFold.mat')
    k=5;
    akurasiValidasiK = [];
    akurasiValidasiS = [];
    for ii=1:k
        validation = randomIndex==ii; train=~validation;
        dtVTest = featureExtractionTrainNorm(find(validation==1),:);
        dtVTrain = featureExtractionTrainNorm(find(train==1),:);
        predictK = SVM(dtVTest,dtVTrain,labelTrain(find(train==1))); 
        [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
        allConfusion(ii,1).matrix = confusionM1;
        akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
    end
    disp('Performansi SVM')
    akurasiK =mean(akurasiValidasiK(:,1));
    f1ScoreK=mean(akurasiValidasiK(:,2));
    precisionK=mean(akurasiValidasiK(:,3));
    recallK=mean(akurasiValidasiK(:,4));
    f1ScoreK,precisionK,recallK
    validasiName = 'hasilValidasiP4';
    hasilValidasi.nilaiK=nilaiK;
    hasilValidasi.P=4;
    hasilValidasi.R=kk;
    hasilValidasi.f1Score=f1ScoreK;
    hasilValidasi.f1Score=precisionK;
    hasilValidasi.f1Score=recallK;
    hasilValidasi.pattern='Non Uniform';
    allData=[allData;hasilValidasi];
    saveFile=strcat(validasiName,'R',num2str(kk),'Normalisasi','.mat');
    save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
    disp('sukses')
    clearvars -except nilaiK allData
end
disp('Uniform')
for kk=1:10
    kk
    matFile='lbpP4';
    nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
    load(nameFile)
    load('randomIndexKFold.mat')
    k=5;
    akurasiValidasiK = [];
    akurasiValidasiS = [];
    for ii=1:k
        validation = randomIndex==ii; train=~validation;
        dtVTest = featureExtractionTrainNorm(find(validation==1),:);
        dtVTrain = featureExtractionTrainNorm(find(train==1),:);
        predictK = SVM(dtVTest,dtVTrain,labelTrain(find(train==1))); 
        [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
        allConfusion(ii,1).matrix = confusionM1;
        akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
    end
    disp('Performansi SVM')
    akurasiK =mean(akurasiValidasiK(:,1));
    f1ScoreK=mean(akurasiValidasiK(:,2));
    precisionK=mean(akurasiValidasiK(:,3));
    recallK=mean(akurasiValidasiK(:,4));
    f1ScoreK,precisionK,recallK
    hasilValidasi.nilaiK=nilaiK;
    hasilValidasi.P=4;
    hasilValidasi.R=kk;
    hasilValidasi.f1Score=f1ScoreK;
    hasilValidasi.f1Score=precisionK;
    hasilValidasi.f1Score=recallK;
    hasilValidasi.pattern='Uniform';
    allData=[allData;hasilValidasi];
    validasiName = 'hasilValidasiP4';
    saveFile=strcat(validasiName,'R',num2str(kk),'Normalisasi','Uniform','.mat');
    save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
    disp('sukses')
    clearvars -except nilaiK allData
end
for kk=1:10
    kk
    matFile='lbpP8';
    nameFile=strcat(matFile,'R',num2str(kk),'.mat');
    load(nameFile)
    load('randomIndexKFold.mat')
    k=5;
    akurasiValidasiK = [];
    akurasiValidasiS = [];
    for ii=1:k
        validation = randomIndex==ii; train=~validation;
        dtVTest = featureExtractionTrainNorm(find(validation==1),:);
        dtVTrain = featureExtractionTrainNorm(find(train==1),:);
        predictK = SVM(dtVTest,dtVTrain,labelTrain(find(train==1))); 
        [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
        allConfusion(ii,1).matrix = confusionM1;
        akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
    end
    disp('Performansi SVM')
    akurasiK =mean(akurasiValidasiK(:,1));
    f1ScoreK=mean(akurasiValidasiK(:,2));
    precisionK=mean(akurasiValidasiK(:,3));
    recallK=mean(akurasiValidasiK(:,4));
    f1ScoreK,precisionK,recallK
    hasilValidasi.nilaiK=nilaiK;
    hasilValidasi.P=8;
    hasilValidasi.R=kk;
    hasilValidasi.f1Score=f1ScoreK;
    hasilValidasi.f1Score=precisionK;
    hasilValidasi.f1Score=recallK;
    hasilValidasi.pattern='Non Uniform';
    allData=[allData;hasilValidasi];
    validasiName = 'hasilValidasiP8';
    saveFile=strcat(validasiName,'R',num2str(kk),'Normalisasi','.mat');
    save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
    disp('sukses')
    clearvars -except nilaiK allData
end
disp('Uniform')
for kk=1:10
    kk
    matFile='lbpP8';
    nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
    load(nameFile)
    load('randomIndexKFold.mat')
    k=5;
    akurasiValidasiK = [];
    akurasiValidasiS = [];
    for ii=1:k
        validation = randomIndex==ii; train=~validation;
        dtVTest = featureExtractionTrainNorm(find(validation==1),:);
        dtVTrain = featureExtractionTrainNorm(find(train==1),:);
        predictK = SVM(dtVTest,dtVTrain,labelTrain(find(train==1))); 
        [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
        allConfusion(ii,1).matrix = confusionM1;
        akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
    end
    disp('Performansi SVM')
    akurasiK =mean(akurasiValidasiK(:,1));
    f1ScoreK=mean(akurasiValidasiK(:,2));
    precisionK=mean(akurasiValidasiK(:,3));
    recallK=mean(akurasiValidasiK(:,4));
    f1ScoreK,precisionK,recallK
    hasilValidasi.nilaiK=nilaiK;
    hasilValidasi.P=8;
    hasilValidasi.R=kk;
    hasilValidasi.f1Score=f1ScoreK;
    hasilValidasi.f1Score=precisionK;
    hasilValidasi.f1Score=recallK;
    hasilValidasi.pattern='Uniform';
    allData=[allData;hasilValidasi];
    validasiName = 'hasilValidasiP8';
    saveFile=strcat(validasiName,'R',num2str(kk),'Normalisasi','Uniform','.mat');
    save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
    disp('sukses')
    clearvars -except nilaiK allData
end
for kk=2:5
    kk
    matFile='lbpP16';
    nameFile=strcat(matFile,'R',num2str(kk),'.mat');
    load(nameFile)
    load('randomIndexKFold.mat')
    k=5;
    akurasiValidasiK = [];
    akurasiValidasiS = [];
    for ii=1:k
        validation = randomIndex==ii; train=~validation;
        dtVTest = featureExtractionTrainNorm(find(validation==1),:);
        dtVTrain = featureExtractionTrainNorm(find(train==1),:);
        predictK = SVM(dtVTest,dtVTrain,labelTrain(find(train==1))); 
        [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
        allConfusion(ii,1).matrix = confusionM1;
        akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
    end
    disp('Performansi SVM')
    akurasiK =mean(akurasiValidasiK(:,1));
    f1ScoreK=mean(akurasiValidasiK(:,2));
    precisionK=mean(akurasiValidasiK(:,3));
    recallK=mean(akurasiValidasiK(:,4));
    f1ScoreK,precisionK,recallK
    hasilValidasi.nilaiK=nilaiK;
    hasilValidasi.P=16;
    hasilValidasi.R=kk;
    hasilValidasi.f1Score=f1ScoreK;
    hasilValidasi.f1Score=precisionK;
    hasilValidasi.f1Score=recallK;
    hasilValidasi.pattern='Non Uniform';
    allData=[allData;hasilValidasi];
    validasiName = 'hasilValidasiP16';
    saveFile=strcat(validasiName,'R',num2str(kk),'Normalisasi','.mat');
    save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
    disp('sukses')
    clearvars -except nilaiK allData
end
disp('Uniform')
for kk=2:5
    kk
    matFile='lbpP16';
    nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
    load(nameFile)
    load('randomIndexKFold.mat')
    k=5;
    akurasiValidasiK = [];
    akurasiValidasiS = [];
    for ii=1:k
        validation = randomIndex==ii; train=~validation;
        dtVTest = featureExtractionTrainNorm(find(validation==1),:);
        dtVTrain = featureExtractionTrainNorm(find(train==1),:);
        predictK = SVM(dtVTest,dtVTrain,labelTrain(find(train==1))); 
        [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
        allConfusion(ii,1).matrix = confusionM1;
        akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
    end
    disp('Performansi SVM')
    akurasiK =mean(akurasiValidasiK(:,1));
    f1ScoreK=mean(akurasiValidasiK(:,2));
    precisionK=mean(akurasiValidasiK(:,3));
    recallK=mean(akurasiValidasiK(:,4));
    f1ScoreK,precisionK,recallK
    hasilValidasi.nilaiK=nilaiK;
    hasilValidasi.P=16;
    hasilValidasi.R=kk;
    hasilValidasi.f1Score=f1ScoreK;
    hasilValidasi.f1Score=precisionK;
    hasilValidasi.f1Score=recallK;
    hasilValidasi.pattern='Uniform';
    allData=[allData;hasilValidasi];
    validasiName = 'hasilValidasiP16';
    saveFile=strcat(validasiName,'R',num2str(kk),'Normalisasi','Uniform','.mat');
    save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
    disp('sukses')
    clearvars -except nilaiK allData
end
save('skenarioHasilNormalisasiDataSVM.mat','allData');
