% kernelName;=['gaussian', 'linear','polynomial','rbf'];
allData = [];
for nilaiK=1:1
    if(nilaiK==1)
        kernelName='gaussian';
    elseif(nilaiK==2)
        kernelName='linear';
    elseif(nilaiK==3)
        kernelName='polynomial';
    else
        kernelName='rbf';
    end
    for kk=10:10
        matFile='lbpP16';
        nameFile=strcat(matFile,'R',num2str(kk),'Uniform.mat');
        load(nameFile)
        load('randomIndexKFold.mat')
        k=5;
        akurasiValidasiS = [];
        akurasiValidasiS = [];
        
        for ii=1:k
            validation = randomIndex==ii; train=~validation;
            dtVTest = featureExtractionTrain(find(validation==1),:);
            dtVTrain = featureExtractionTrain(find(train==1),:);
            svmParams = templateSVM('KernelFunction',kernelName, 'KernelScale', 'auto', 'Standardize', 1);
            svmModel = fitcecoc(dtVTrain, labelTrain(find(train==1)), 'Learners', svmParams, 'Coding', 'onevsall');
            predictS =predict(svmModel,dtVTest);
            [confusionM1,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
            allConfusion(ii,1).matrix = confusionM1;
            akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
        end
        disp('Performansi KNN')
        akurasiS =mean(akurasiValidasiS(:,1));
        f1ScoreS=mean(akurasiValidasiS(:,2));
        precisionS=mean(akurasiValidasiS(:,3));
        recallS=mean(akurasiValidasiS(:,4));
        f1ScoreS,precisionS,recallS
%         validasiName = 'hasilValidasiP8';     
        hasilValidasi.P=16;
        hasilValidasi.R=kk;
        hasilValidasi.f1Score=f1ScoreS;
        hasilValidasi.f1Score=precisionS;
        hasilValidasi.f1Score=recallS;
        hasilValidasi.pattern='Non Uniform'; 
        hasilValidasi.kernel=kernelName;
        
        allData=[allData;hasilValidasi];
%         saveFile=strcat(validasiName,'R',num2str(kk),'NiilaiK',num2str(nilaiK),'.mat');
%         save(saveFile,'f1ScoreS','precisionS','recallS','akurasiS','allConfusion');
        disp('sukses')
        clearvars -except nilaiK allData kernelName;
    end
%     disp('Uniform')
%     for kk=1:10
%         kk
%         matFile='lbpP4';
%         nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiS = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             svmParams = templateSVM('KernelFunction',kernelName, 'KernelScale', 'auto', 'Standardize', 1);
%             svmModel = fitcecoc(dtVTrain, labelTrain(find(train==1)), 'Learners', svmParams, 'Coding', 'onevsall');  predictS =predict(svmModel,dtVTest);
%             [confusionM1,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
%         end
%         disp('Performansi KNN')
%         akurasiS =mean(akurasiValidasiS(:,1));
%         f1ScoreS=mean(akurasiValidasiS(:,2));
%         precisionS=mean(akurasiValidasiS(:,3));
%         recallS=mean(akurasiValidasiS(:,4));
%         f1ScoreS,precisionS,recallS
%         
%         hasilValidasi.P=4;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreS;
%         hasilValidasi.f1Score=precisionS;
%         hasilValidasi.f1Score=recallS;
%         hasilValidasi.pattern='Uniform';
%         hasilValidasi.kernel=kernelName;
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP4';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NilaiK',num2str(nilaiK),'Uniform','.mat');
%         save(saveFile,'f1ScoreS','precisionS','recallS','akurasiS','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData kernelName;
%     end
%     for kk=1:10
%         kk
%         matFile='lbpP8';
%         nameFile=strcat(matFile,'R',num2str(kk),'.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiS = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             svmParams = templateSVM('KernelFunction',kernelName, 'KernelScale', 'auto', 'Standardize', 1); 
%             svmModel = fitcecoc(dtVTrain, labelTrain(find(train==1)), 'Learners', svmParams, 'Coding', 'onevsall');  predictS =predict(svmModel,dtVTest);
%             [confusionM1,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
%         end
%         disp('Performansi KNN')
%         akurasiS =mean(akurasiValidasiS(:,1));
%         f1ScoreS=mean(akurasiValidasiS(:,2));
%         precisionS=mean(akurasiValidasiS(:,3));
%         recallS=mean(akurasiValidasiS(:,4));
%         f1ScoreS,precisionS,recallS
%         
%         hasilValidasi.P=8;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreS;
%         hasilValidasi.f1Score=precisionS;
%         hasilValidasi.f1Score=recallS;
%         hasilValidasi.pattern='Non Uniform'; 
%         hasilValidasi.kernel=kernelName;
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP8';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NiilaiK',num2str(nilaiK),'.mat');
%         save(saveFile,'f1ScoreS','precisionS','recallS','akurasiS','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData kernelName;
%     end
%     disp('Uniform')
%     for kk=1:10
%         kk
%         matFile='lbpP8';
%         nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiS = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             svmParams = templateSVM('KernelFunction',kernelName, 'KernelScale', 'auto', 'Standardize', 1);
%             svmModel = fitcecoc(dtVTrain, labelTrain(find(train==1)), 'Learners', svmParams, 'Coding', 'onevsall');  predictS =predict(svmModel,dtVTest);
%             [confusionM1,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
%         end
%         disp('Performansi KNN')
%         akurasiS =mean(akurasiValidasiS(:,1));
%         f1ScoreS=mean(akurasiValidasiS(:,2));
%         precisionS=mean(akurasiValidasiS(:,3));
%         recallS=mean(akurasiValidasiS(:,4));
%         f1ScoreS,precisionS,recallS
%         
%         hasilValidasi.P=8;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreS;
%         hasilValidasi.f1Score=precisionS;
%         hasilValidasi.f1Score=recallS;
%         hasilValidasi.pattern='Uniform'; 
%         hasilValidasi.kernel=kernelName;
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP8';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NilaiK',num2str(nilaiK),'Uniform','.mat');
%         save(saveFile,'f1ScoreS','precisionS','recallS','akurasiS','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData kernelName;
%     end
%     for kk=2:5
%         kk
%         matFile='lbpP16';
%         nameFile=strcat(matFile,'R',num2str(kk),'.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiS = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             svmParams = templateSVM('KernelFunction',kernelName, 'KernelScale', 'auto', 'Standardize', 1);
%             svmModel = fitcecoc(dtVTrain, labelTrain(find(train==1)), 'Learners', svmParams, 'Coding', 'onevsall');  predictS =predict(svmModel,dtVTest);
%             [confusionM1,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
%         end
%         disp('Performansi KNN')
%         akurasiS =mean(akurasiValidasiS(:,1));
%         f1ScoreS=mean(akurasiValidasiS(:,2));
%         precisionS=mean(akurasiValidasiS(:,3));
%         recallS=mean(akurasiValidasiS(:,4));
%         f1ScoreS,precisionS,recallS
%         
%         hasilValidasi.P=16;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreS;
%         hasilValidasi.f1Score=precisionS;
%         hasilValidasi.f1Score=recallS;
%         hasilValidasi.pattern='Non Uniform'; 
%         hasilValidasi.kernel=kernelName;
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP16';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NiilaiK',num2str(nilaiK),'.mat');
%         save(saveFile,'f1ScoreS','precisionS','recallS','akurasiS','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData kernelName;
%     end
%     disp('Uniform')
%     for kk=2:5
%         kk
%         matFile='lbpP16';
%         nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiS = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             svmParams = templateSVM('KernelFunction',kernelName, 'KernelScale', 'auto', 'Standardize', 1);
%             svmModel = fitcecoc(dtVTrain, labelTrain(find(train==1)), 'Learners', svmParams, 'Coding', 'onevsall');  predictS =predict(svmModel,dtVTest);
%             [confusionM1,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
%         end
%         disp('Performansi KNN')
%         akurasiS =mean(akurasiValidasiS(:,1));
%         f1ScoreS=mean(akurasiValidasiS(:,2));
%         precisionS=mean(akurasiValidasiS(:,3));
%         recallS=mean(akurasiValidasiS(:,4));
%         f1ScoreS,precisionS,recallS
%         
%         hasilValidasi.P=16;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreS;
%         hasilValidasi.f1Score=precisionS;
%         hasilValidasi.f1Score=recallS;
%         hasilValidasi.pattern='Uniform'; 
%         hasilValidasi.kernel=kernelName;
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP16';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NilaiK',num2str(nilaiK),'Uniform','.mat');
%         save(saveFile,'f1ScoreS','precisionS','recallS','akurasiS','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData kernelName;
%     end
end
save('skenarioMenentukanKernelP=16UniformR10.mat','allData');