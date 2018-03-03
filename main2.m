%% getData Train dan DataTes
% path = '/Users/adhistria/Documents/TA2/FixDataset';
% [dataTrain,dataTest] = getData(path);
% save('dataset.mat','dataTrain','dataTest');
%% Ekstraksi Ciri
% for aa=2:5
%     aa
%     load('dataset.mat');
%     for ii=1:length(dataTrain)
%     %     featureExtractionTrain(ii,:) = extractLBPFeatures(rgb2gray(dataTrain(ii).image),'NumNeighbors',8,'Radius',1);
%           [dataTrain(ii).newImage,dataTrain(ii).featureExtraction] = lbp16(rgb2gray(dataTrain(ii).image),aa);
% %           dataTrain(ii).featureExtraction = lbp16(rgb2gray(dataTrain(ii).image),aa);
%           featureExtractionTrain(ii,:) = dataTrain(ii).featureExtraction;
%           labelTrain(ii) = dataTrain(ii).label;
%     end
%     for jj=1:length(dataTest)
%     %     featureExtractionTes(jj,:) = extractLBPFeatures(rgb2gray(dataTes(jj).image),'NumNeighbors',8,'Radius',1);
%           [dataTest(jj).newImage,dataTest(jj).featureExtraction ]= lbp16(rgb2gray(dataTest(jj).image),aa);
% %           dataTest(jj).featureExtraction= lbp16Uniform(rgb2gray(dataTest(jj).image),2);
%           featureExtractionTest(jj,:) = dataTest(jj).featureExtraction;
%           labelTest(jj)=dataTest(jj).label;
%     end
% 
%     % save('lbpP4R1.mat','dataTrain','dataTest','featureExtractionTrain','featureExtractionTest','labelTrain','labelTest');
%     % %% normalisasi data
%     % load('lbpP8R1Uniform.mat');
% 
%     for ii=1:size(featureExtractionTrain,2)
%        minimum(ii) = min(featureExtractionTrain(:,ii));
%        maximum(ii) = max(featureExtractionTrain(:,ii));
%     end
%     featureExtractionTrainNorm = normalisasi(featureExtractionTrain,minimum,maximum);
%     featureExtractionTestNorm = normalisasi(featureExtractionTest,minimum,maximum);
%     for ii=1:size(featureExtractionTrain,1)
%         dataTrain(ii).normalizedFeature = featureExtractionTrain(ii,:);
%     end
%     for jj=1:size(featureExtractionTest,1)
%        dataTest(jj).normalizedFeature = featureExtractionTest(jj,:);
%     end 
%     matFile='lbpP16';
%     nameFile=strcat(matFile,'R',num2str(aa),'HasilKedua','.mat');
%     save(nameFile,'dataTrain','dataTest','featureExtractionTrain','featureExtractionTest','labelTrain','labelTest','featureExtractionTrainNorm','featureExtractionTestNorm');
%     clear
% end
% for aa=4:2:10
%     aa
%         load('dataset.mat');
%     for ii=1:length(dataTrain)
%     %     featureExtractionTrain(ii,:) = extractLBPFeatures(rgb2gray(dataTrain(ii).image),'NumNeighbors',8,'Radius',1);
%           [dataTrain(ii).newImage,dataTrain(ii).featureExtraction] = lbp8(rgb2gray(dataTrain(ii).image),aa);
% %           dataTrain(ii).featureExtraction = lbp8(rgb2gray(dataTrain(ii).image),aa);
%           featureExtractionTrain(ii,:) = dataTrain(ii).featureExtraction;
%           labelTrain(ii) = dataTrain(ii).label;
%     end
%     for jj=1:length(dataTest)
%     %     featureExtractionTes(jj,:) = extractLBPFeatures(rgb2gray(dataTes(jj).image),'NumNeighbors',8,'Radius',1);
%           [dataTest(jj).newImage,dataTest(jj).featureExtraction ]= lbp8(rgb2gray(dataTest(jj).image),aa);
% %           dataTest(jj).featureExtraction= lbp16Uniform(rgb2gray(dataTest(jj).image),2);
%           featureExtractionTest(jj,:) = dataTest(jj).featureExtraction;
%           labelTest(jj)=dataTest(jj).label;
%     end
% 
%     % save('lbpP4R1.mat','dataTrain','dataTest','featureExtractionTrain','featureExtractionTest','labelTrain','labelTest');
%     % %% normalisasi data
%     % load('lbpP8R1Uniform.mat');
% 
%     for ii=1:size(featureExtractionTrain,2)
%        minimum(ii) = min(featureExtractionTrain(:,ii));
%        maximum(ii) = max(featureExtractionTrain(:,ii));
%     end
%     featureExtractionTrainNorm = normalisasi(featureExtractionTrain,minimum,maximum);
%     featureExtractionTestNorm = normalisasi(featureExtractionTest,minimum,maximum);
%     for ii=1:size(featureExtractionTrain,1)
%         dataTrain(ii).normalizedFeature = featureExtractionTrain(ii,:);
%     end
%     for jj=1:size(featureExtractionTest,1)
%        dataTest(jj).normalizedFeature = featureExtractionTest(jj,:);
%     end
%     matFile='lbpP8';
%     nameFile=strcat(matFile,'R',num2str(aa),'HasilKedua','.mat');
%     save(nameFile,'dataTrain','dataTest','featureExtractionTrain','featureExtractionTest','labelTrain','labelTest','featureExtractionTrainNorm','featureExtractionTestNorm');
%     clear
% end
%% validasi 
%   disp('Non Uniform')
% for kk=2:5
%     kk
%     matFile='lbpP16';
%     nameFile=strcat(matFile,'R',num2str(kk),'.mat');
%     load(nameFile)
% %     load('lbpP4R6Uniform.mat')
%     load('randomIndexKFold.mat')
%     k=5;
%     % randomIndex = crossvalind('Kfold', length(dataTrain), k);
%     akurasiValidasiK = [];
%     akurasiValidasiS = [];
%     for ii=1:k
%         validation = randomIndex==ii; train=~validation;
%         dtVTest = featureExtractionTrain(find(validation==1),:);
%         dtVTrain = featureExtractionTrain(find(train==1),:);
%         predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1))); 
%         predictS = SVM(dtVTest,dtVTrain,labelTrain(find(train==1)));
%         [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%         [confusionM2,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
%         allConfusion(ii,1).matrix = confusionM1;
%         allConfusion(ii,2).matrix = confusionM2;
%         akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
%     end
%     disp('Performansi KNN')
%     akurasiK =mean(akurasiValidasiK(:,1));
%     f1ScoreK=mean(akurasiValidasiK(:,2));
%     precisionK=mean(akurasiValidasiK(:,3));
%     recallK=mean(akurasiValidasiK(:,4));
%     f1ScoreK,precisionK,recallK
%     disp('Performansi SVM')
%     akurasiS =mean(akurasiValidasiS(:,1));
%     f1ScoreS=mean(akurasiValidasiS(:,2));
%     precisionS=mean(akurasiValidasiS(:,3));
%     recallS=mean(akurasiValidasiS(:,4));
%     f1ScoreS,precisionS,recallS
%     validasiName = 'hasilValidasiP16';
%     saveFile=strcat(validasiName,'R',num2str(kk),'.mat');
%     save(saveFile,'f1ScoreK','precisionK','recallK','f1ScoreS','precisionS','recallS','akurasiK','akurasiS','allConfusion');
%     disp('sukses')
%     clear
% end
%     disp('Uniform')
% for kk=2:5
%     kk
%     matFile='lbpP16';
%     nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
%     load(nameFile)
% %     load('lbpP4R6Uniform.mat')
%     load('randomIndexKFold.mat')
%     k=5;
%     % randomIndex = crossvalind('Kfold', length(dataTrain), k);
%     akurasiValidasiK = [];
%     akurasiValidasiS = [];
%     for ii=1:k
%         validation = randomIndex==ii; train=~validation;
%         dtVTest = featureExtractionTrain(find(validation==1),:);
%         dtVTrain = featureExtractionTrain(find(train==1),:);
%         predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1))); 
%         predictS = SVM(dtVTest,dtVTrain,labelTrain(find(train==1)));
%         [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%         [confusionM2,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
%         allConfusion(ii,1).matrix = confusionM1;
%         allConfusion(ii,2).matrix = confusionM2;
%         akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
%     end
%     disp('Performansi KNN')
%     akurasiK =mean(akurasiValidasiK(:,1));
%     f1ScoreK=mean(akurasiValidasiK(:,2));
%     precisionK=mean(akurasiValidasiK(:,3));
%     recallK=mean(akurasiValidasiK(:,4));
%     f1ScoreK,precisionK,recallK
%     disp('Performansi SVM')
%     akurasiS =mean(akurasiValidasiS(:,1));
%     f1ScoreS=mean(akurasiValidasiS(:,2));
%     precisionS=mean(akurasiValidasiS(:,3));
%     recallS=mean(akurasiValidasiS(:,4));
%     f1ScoreS,precisionS,recallS
%     validasiName = 'hasilValidasiP16';
%     saveFile=strcat(validasiName,'R',num2str(kk),'Uniform','.mat');
%     save(saveFile,'f1ScoreK','precisionK','recallK','f1ScoreS','precisionS','recallS','akurasiK','akurasiS','allConfusion');
%     disp('sukses')
%     clear
% end

%% Validasi k
% featureExtractionTrainNorm
% allData = [];
% for nilaiK=3:2:9
%     for kk=1:10
%         kk
%         matFile='lbpP4';
%         nameFile=strcat(matFile,'R',num2str(kk),'.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiK = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1)),nilaiK); 
%             [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         end
%         disp('Performansi KNN')
%         akurasiK =mean(akurasiValidasiK(:,1));
%         f1ScoreK=mean(akurasiValidasiK(:,2));
%         precisionK=mean(akurasiValidasiK(:,3));
%         recallK=mean(akurasiValidasiK(:,4));
%         f1ScoreK,precisionK,recallK
%         validasiName = 'hasilValidasiP4';
%         hasilValidasi.nilaiK=nilaiK;
%         hasilValidasi.P=4;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreK;
%         hasilValidasi.f1Score=precisionK;
%         hasilValidasi.f1Score=recallK;
%         hasilValidasi.pattern='Non Uniform';
%         allData=[allData;hasilValidasi];
%         saveFile=strcat(validasiName,'R',num2str(kk),'NiilaiK',num2str(nilaiK),'.mat');
%         save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData
%     end
%     disp('Uniform')
%     for kk=1:10
%         kk
%         matFile='lbpP4';
%         nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiK = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1)),nilaiK); 
%             [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         end
%         disp('Performansi KNN')
%         akurasiK =mean(akurasiValidasiK(:,1));
%         f1ScoreK=mean(akurasiValidasiK(:,2));
%         precisionK=mean(akurasiValidasiK(:,3));
%         recallK=mean(akurasiValidasiK(:,4));
%         f1ScoreK,precisionK,recallK
%         hasilValidasi.nilaiK=nilaiK;
%         hasilValidasi.P=4;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreK;
%         hasilValidasi.f1Score=precisionK;
%         hasilValidasi.f1Score=recallK;
%         hasilValidasi.pattern='Uniform';
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP4';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NilaiK',num2str(nilaiK),'Uniform','.mat');
%         save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData
%     end
%     for kk=1:10
%         kk
%         matFile='lbpP8';
%         nameFile=strcat(matFile,'R',num2str(kk),'.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiK = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1)),nilaiK); 
%             [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         end
%         disp('Performansi KNN')
%         akurasiK =mean(akurasiValidasiK(:,1));
%         f1ScoreK=mean(akurasiValidasiK(:,2));
%         precisionK=mean(akurasiValidasiK(:,3));
%         recallK=mean(akurasiValidasiK(:,4));
%         f1ScoreK,precisionK,recallK
%         hasilValidasi.nilaiK=nilaiK;
%         hasilValidasi.P=8;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreK;
%         hasilValidasi.f1Score=precisionK;
%         hasilValidasi.f1Score=recallK;
%         hasilValidasi.pattern='Non Uniform';
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP8';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NiilaiK',num2str(nilaiK),'.mat');
%         save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData
%     end
%     disp('Uniform')
%     for kk=1:10
%         kk
%         matFile='lbpP8';
%         nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiK = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1)),nilaiK); 
%             [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         end
%         disp('Performansi KNN')
%         akurasiK =mean(akurasiValidasiK(:,1));
%         f1ScoreK=mean(akurasiValidasiK(:,2));
%         precisionK=mean(akurasiValidasiK(:,3));
%         recallK=mean(akurasiValidasiK(:,4));
%         f1ScoreK,precisionK,recallK
%         hasilValidasi.nilaiK=nilaiK;
%         hasilValidasi.P=8;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreK;
%         hasilValidasi.f1Score=precisionK;
%         hasilValidasi.f1Score=recallK;
%         hasilValidasi.pattern='Uniform';
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP8';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NilaiK',num2str(nilaiK),'Uniform','.mat');
%         save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData
%     end
%     for kk=2:5
%         kk
%         matFile='lbpP16';
%         nameFile=strcat(matFile,'R',num2str(kk),'.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiK = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1)),nilaiK); 
%             [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         end
%         disp('Performansi KNN')
%         akurasiK =mean(akurasiValidasiK(:,1));
%         f1ScoreK=mean(akurasiValidasiK(:,2));
%         precisionK=mean(akurasiValidasiK(:,3));
%         recallK=mean(akurasiValidasiK(:,4));
%         f1ScoreK,precisionK,recallK
%         hasilValidasi.nilaiK=nilaiK;
%         hasilValidasi.P=16;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreK;
%         hasilValidasi.f1Score=precisionK;
%         hasilValidasi.f1Score=recallK;
%         hasilValidasi.pattern='Non Uniform';
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP16';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NiilaiK',num2str(nilaiK),'.mat');
%         save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData
%     end
%     disp('Uniform')
%     for kk=2:5
%         kk
%         matFile='lbpP16';
%         nameFile=strcat(matFile,'R',num2str(kk),'Uniform','.mat');
%         load(nameFile)
%         load('randomIndexKFold.mat')
%         k=5;
%         akurasiValidasiK = [];
%         akurasiValidasiS = [];
%         for ii=1:k
%             validation = randomIndex==ii; train=~validation;
%             dtVTest = featureExtractionTrain(find(validation==1),:);
%             dtVTrain = featureExtractionTrain(find(train==1),:);
%             predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1)),nilaiK); 
%             [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%             allConfusion(ii,1).matrix = confusionM1;
%             akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         end
%         disp('Performansi KNN')
%         akurasiK =mean(akurasiValidasiK(:,1));
%         f1ScoreK=mean(akurasiValidasiK(:,2));
%         precisionK=mean(akurasiValidasiK(:,3));
%         recallK=mean(akurasiValidasiK(:,4));
%         f1ScoreK,precisionK,recallK
%         hasilValidasi.nilaiK=nilaiK;
%         hasilValidasi.P=16;
%         hasilValidasi.R=kk;
%         hasilValidasi.f1Score=f1ScoreK;
%         hasilValidasi.f1Score=precisionK;
%         hasilValidasi.f1Score=recallK;
%         hasilValidasi.pattern='Uniform';
%         allData=[allData;hasilValidasi];
%         validasiName = 'hasilValidasiP16';
%         saveFile=strcat(validasiName,'R',num2str(kk),'NilaiK',num2str(nilaiK),'Uniform','.mat');
%         save(saveFile,'f1ScoreK','precisionK','recallK','akurasiK','allConfusion');
%         disp('sukses')
%         clearvars -except nilaiK allData
%     end
% end
% save('skenarioMenentukanNilaiK.mat','allData');

%% klasifikasi normalisasi
% load('lbpP8R1Uniform.mat');
% Mdl = fitcknn(featureExtractionTrainNorm,labelTrain);
% predictK = predict(Mdl,featureExtractionTestNorm);
% [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
% % akurasiK*100
% dtBenar = predictK -labelTest';
% hasilBenar = find(dtBenar==0);
% akurasi = length(hasilBenar)/length(labelTest);
% Mdl2 = fitcecoc(featureExtractionTrainNorm,labelTrain);
% predictS = predict(Mdl2,featureExtractionTestNorm);
% [confusion2,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTest,predictS);
% dtBenar = predictS -labelTest';
% hasilBenar2 = find(dtBenar==0);
% akurasi2 = length(hasilBenar2)/length(labelTest);
% akurasiS*100

%% klasifikasi

% load('lbpP8R1.mat');
% Mdl = fitcknn(featureExtractionTrain,labelTrain);
% predictK = predict(Mdl,featureExtractionTest);
% [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
% disp('F1 Score K')
% rateK
% disp('Precisoin K')
% precisionK
% disp('Recall K')
% recallK
% Mdl2 = fitcecoc(featureExtractionTrain,labelTrain);
% predictS = predict(Mdl2,featureExtractionTest);
% [confusion1,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTest,predictS);
% disp('F1 Score S')
% rateS
% disp('Precisoin S')
% precisionS
% disp('Recall S')
% recallS
% % rate2 = 100 -(loss(Mdl2,featureExtractionTest,labelTest)*100)
%% t
akurasiP8 = [];
akurasiPB8 = []'
for ii=2:5
    matFile='lbpP16';
    nameFile=strcat(matFile,'R',num2str(ii),'.mat');
    load(nameFile)
    Mdl = fitcknn(featureExtractionTrain,labelTrain);
    predictK = predict(Mdl,featureExtractionTest);
    [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
    akurasiP8=[akurasiP8;rateK];
    clearvars -except akurasiP8 akurasiPB8 ii;
    matFile='lbpP16';
    nameFile=strcat(matFile,'R',num2str(ii),'HasilKedua.mat');
    load(nameFile)
    Mdl = fitcknn(featureExtractionTrain,labelTrain);
    predictK = predict(Mdl,featureExtractionTest);
    [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
    akurasiPB8=[akurasiPB8;rateK];
    clearvars -except akurasiP8 akurasiPB8 ii ;
end
% for ii=4:2:10
%     matFile='lbpP16';
%     nameFile=strcat(matFile,'R',num2str(ii),'.mat');
%     load(nameFile)
%     Mdl = fitcknn(featureExtractionTrain,labelTrain);
%     predictK = predict(Mdl,featureExtractionTest);
%     [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
%     akurasiP8=[akurasiP8;rateK];
%     clearvars -except akurasiP8 akurasiPB8 ii;
%     matFile='lbpP16';
%     nameFile=strcat(matFile,'R',num2str(ii),'HasilKedua.mat');
%     load(nameFile)
%     Mdl = fitcknn(featureExtractionTrain,labelTrain);
%     predictK = predict(Mdl,featureExtractionTest);
%     [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
%     akurasiPB8=[akurasiPB8;rateK];
%     clearvars -except akurasiP8 akurasiPB8 ii;
% end

%% asd
% load('lbpP4R1.mat');
% Mdl = fitcknn(featureExtractionTrain,labelTrain);
% svmParams = templateSVM('KernelFunction','gaussian', 'KernelScale', 'auto', 'Standardize', 1);
% svmModel = fitcecoc(featureExtractionTrain, labelTrain, 'Learners', svmParams, 'Coding', 'onevsall');
% svmModel = fitcecoc(featureExtractionTrain,labelTrain);
% predictK = predict(svmModel,featureExtractionTest);
% [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
% [C,order] = confusionmat(labelTest,predictK)
% predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1))); 
% [confusionM1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);