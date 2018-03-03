%% getData Train dan DataTes
% path = '/Users/adhistria/Documents/TA2/FixDataset';
% [dataTrain,dataTest] = getData(path);
% save('dataset.mat','dataTrain','dataTest');
%% Ekstraksi Ciri
% load('dataset.mat');
% for ii=1:length(dataTrain)
% %     featureExtractionTrain(ii,:) = extractLBPFeatures(rgb2gray(dataTrain(ii).image),'NumNeighbors',8,'Radius',1);
%       [dataTrain(ii).newImage,dataTrain(ii).featureExtraction] = lbp4(rgb2gray(dataTrain(ii).image),8);
% %       dataTrain(ii).featureExtraction = lbp4Uniform(rgb2gray(dataTrain(ii).image),8);
%       featureExtractionTrain(ii,:) = dataTrain(ii).featureExtraction;
%       labelTrain(ii) = dataTrain(ii).label;
% end
% for jj=1:length(dataTest)
% %     featureExtractionTes(jj,:) = extractLBPFeatures(rgb2gray(dataTes(jj).image),'NumNeighbors',8,'Radius',1);
%       [dataTest(jj).newImage,dataTest(jj).featureExtraction] = lbp4(rgb2gray(dataTest(jj).image),8);
% %       dataTest(jj).featureExtraction = lbp4Uniform(rgb2gray(dataTest(jj).image),8);
%       featureExtractionTest(jj,:) = dataTest(jj).featureExtraction;
%       labelTest(jj)=dataTest(jj).label;
% end
% 
% % save('lbpP4R1.mat','dataTrain','dataTest','featureExtractionTrain','featureExtractionTest','labelTrain','labelTest');
% % %% normalisasi data
% % load('lbpP8R1Uniform.mat');
% 
% for ii=1:size(featureExtractionTrain,2)
%    minimum(ii) = min(featureExtractionTrain(:,ii));
%    maximum(ii) = max(featureExtractionTrain(:,ii));
% end
% featureExtractionTrainNorm = normalisasi(featureExtractionTrain,minimum,maximum);
% featureExtractionTestNorm = normalisasi(featureExtractionTest,minimum,maximum);
% for ii=1:size(featureExtractionTrain,1)
%     dataTrain(ii).normalizedFeature = featureExtractionTrainNorm(ii,:);
% end
% for jj=1:size(featureExtractionTest,1)
%    dataTest(jj).normalizedFeature = featureExtractionTestNorm(jj,:);
% end
% save('lbpP4R8HasilKedua.mat','dataTrain','dataTest','featureExtractionTrain','featureExtractionTest','labelTrain','labelTest','featureExtractionTrainNorm','featureExtractionTestNorm');

%% validasi 
% for kk=5:2:9
%    kk
%    matFile='lbpP8'
%    nameFile = strcat(matFile,'R',num2str(10),'Uniform.mat');
%    load(nameFile)
% % for ll=1:1
% %     if(ll==1)
% %         kernelName='gaussian';
% %     cleelseif(ll==2)
% %         kernelName='linear';
% %     elseif(ll==3)
% %         kernelName='polynomial';
% %     else
% %         kernelName='rbf';
% %     end
%     
% %     load('lbpP16R10Uniform.mat');
%     load('randomIndexKFold.mat')
%     k=5;
% %     randomIndex = crossvalind('Kfold', length(dataTrain), k);
%     akurasiValidasiK = [];
%     akurasiValidasiS = [];
%     svmParams = templateSVM('KernelFunction','gaussian', 'KernelScale', 'auto', 'Standardize', 1);
%     for ii=1:k
%         validation = randomIndex==ii; train=~validation;
%         dtVTest = featureExtractionTrain(find(validation==1),:);
%         dtVTrain = featureExtractionTrain(find(train==1),:);
%         predictK = KNN(dtVTest,dtVTrain,labelTrain(find(train==1)),1); 
% %             svmParams = templateSVM('KernelFunction','gaussian', 'KernelScale', 'auto', 'Standardize', 1);
%         svmModel = fitcecoc(dtVTrain, labelTrain(find(train==1)), 'Learners', svmParams, 'Coding', 'onevsall');
%         predictS =predict(svmModel,dtVTest);
%         [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTrain(find(validation==1)),predictK);
%         [confusion2,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTrain(find(validation==1)),predictS);
%         akurasiValidasiK = [akurasiValidasiK;akurasiK,rateK,precisionK,recallK];
%         akurasiValidasiS = [akurasiValidasiS;akurasiS,rateS,precisionS,recallS];
%     end
%     kk
%     disp('Performansi KNN')
%     disp('Akurasi K')
%     akurasiK =mean(akurasiValidasiK(:,1))
%     disp('F1 Score')
%     f1ScoreK=mean(akurasiValidasiK(:,2))
%     disp('Precision')
%     precisionK=mean(akurasiValidasiK(:,3))
%     disp('Recall')
%     recallK=mean(akurasiValidasiK(:,4))
%     disp('Performansi SVM')
%     disp('Akurasi S')
%     akurasiS =mean(akurasiValidasiS(:,1))
%     disp('F1 Score')
%     f1ScoreS=mean(akurasiValidasiS(:,2))
%     disp('Precision')
%     precisionS=mean(akurasiValidasiS(:,3))
%     disp('Recall')
%     recallS=mean(akurasiValidasiS(:,4))
% end
% end
% disp('Performansi SVM')
% disp('Akurasi S')
% akurasiS =mean(akurasiValidasiS(:,1))
% disp('F1 Score')
% f1ScoreS=mean(akurasiValidasiS(:,2))
% disp('Precision')
% precisionS=mean(akurasiValidasiS(:,3))
% disp('Recall')
% recallS=mean(akurasiValidasiS(:,4))
% save('skenarioPengujianDataNormalisasi.mat','f1ScoreK','precisionK','recallK','f1ScoreS','precisionS','recallS','akurasiK','akurasiS');
% disp('sukses')
%% klasifikasi normalisasi
% disp('normalisasi');
% load('lbpP16R10Uniform.mat');
% Mdl = fitcknn(featureExtractionTrainNorm,labelTrain);
% predictK = predict(Mdl,featureExtractionTestNorm);
% [confusion1,akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
% rateK,precisionK,recallK
% % akurasiK*100
% % dtBenar = predictK -labelTest';
% % hasilBenar = find(dtBenar==0);
% % akurasi = length(hasilBenar)/length(labelTest);
% svmParams = templateSVM('KernelFunction','polynomial', 'KernelScale', 'auto', 'Standardize', 1);
% svmModel = fitcecoc(featureExtractionTrainNorm, labelTrain, 'Learners', svmParams, 'Coding', 'onevsall');
% predictS =predict(svmModel,featureExtractionTestNorm);
% [confusion2,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTest,predictS);
% rateS,precisionS,recallS
% dtBenar = predictS -labelTest';
% hasilBenar2 = find(dtBenar==0);
% akurasi2 = length(hasilBenar2)/length(labelTest);
% akurasiS*100
%% normalisasi data p=16
for ii=2:9
    load('lbpP4R8HasilKedua.mat')
    for ii=1:size(featureExtractionTrain,2)
       minimum(ii) = min(featureExtractionTrain(:,ii));
       maximum(ii) = max(featureExtractionTrain(:,ii));
    end
    featureExtractionTrainNorm = normalisasi(featureExtractionTrain,minimum,maximum);
    featureExtractionTestNorm = normalisasi(featureExtractionTest,minimum,maximum);
    for ii=1:size(featureExtractionTrain,1)
        dataTrain(ii).normalizedFeature = featureExtractionTrainNorm(ii,:);
    end
    for jj=1:size(featureExtractionTest,1)
       dataTest(jj).normalizedFeature = featureExtractionTestNorm(jj,:);
    end
    save('lbpP4R8HasilKedua.mat','dataTrain','dataTest','featureExtractionTrain','featureExtractionTest','labelTrain','labelTest','featureExtractionTrainNorm','featureExtractionTestNorm');
end
%% klasifikasi
% disp('Tanpa Normalisasi');
% load('lbpP16R10Uniform.mat');
% Mdl = fitcknn(featureExtractionTrain,labelTrain);
% predictK = predict(Mdl,featureExtractionTest);
% [akurasiK,rateK,precisionK,recallK] = confusionMatrix(labelTest,predictK);
% rateK
% precisionK
% recallK
% 
% load('lbpP16R10Uniform.mat');
% svmParams = templateSVM('KernelFunction','polynomial', 'KernelScale', 'auto', 'Standardize', 1);
% svmModel = fitcecoc(featureExtractionTrain, labelTrain, 'Learners', svmParams, 'Coding', 'onevsall');
% save('svmModellbpP16R10Uniform.mat','svmModel','svmParams');
% predictS = predict(svmModel,lbp16Uniform(rgb2gray(dataTest(459).image),10));
% featureExtractionTest(459,:));
% predictS =predict(svmModel,featureExtractionTest);
% [confusion2,akurasiS,rateS,precisionS,recallS] = confusionMatrix(labelTest,predictS);
% rateS
% precisionS
% recallS
% rate2 = 100 -(loss(Mdl2,featureExtractionTest,labelTest)*100)
%% pembangunan model classifier
%    svmParams = templateSVM('KernelFunction','polynomial', 'KernelScale', 'auto', 'Standardize', 1);
% for ii=1:10
%     ii
%     matFile='lbpP4';
%    nameFile = strcat(matFile,'R',num2str(ii),'HasilKedua.mat');
%    load(nameFile) 
%     svmModel = fitcecoc(featureExtractionTrain, labelTrain, 'Learners', svmParams, 'Coding', 'onevsall');
%     modelName = strcat('svmModel',matFile,'R',num2str(ii),'.mat');
%     save(modelName,'svmModel','-v7.3');
% end

%% t
% for ii=1:length(featureExtractionTest)
%     euclid =[];
%     for jj=1:size(featureExtractionTrain,1)
%         euclid(jj,1) = norm(featureExtractionTest(ii,:)-featureExtractionTrain(jj,:));
% %         euclid(jj,1) = sqrt(sum((featureExtractionTes(ii,:) - featureExtractionTrain(jj,:)) .^ 2));
%     end
%     [euclidSorted,I] = sortrows(euclid);
%     kelas(ii,1)=(labelTrain(I(1)));
% end
% dtBenar = kelas -labelTest';
% hasilBenar = find(dtBenar==0);
% akurasi = length(hasilBenar)/length(labelTest);
% Mdl = fitcknn(featureExtractionTrain,labelTrain)
% label = predict(Mdl,featureExtractionTest)
% rate = 100 -(loss(Mdl,featureExtractionTest,Y2)*100)
% Mdl2 = fitcecoc(featureExtractionTrain,Y1)
% rate2 = 100 -(loss(Mdl2,featureExtractionTest,Y2)*100)
%% F1 Score
% load('lbpP4R1Uniform.mat');
% Mdl = fitcknn(featureExtractionTrain,labelTrain);
% 
% predicted = predict(Mdl,featureExtractionTest);
% [confusionMatrix,akurasi,f1Score,precision,recall,FN,FP] = confusionMatrix(labelTest,predicted);
% Mdl = fitcknn(featureExtractionTrain,labelTrain);
% predicted = predict(Mdl,featureExtractionTest);
% rate = 100 -(loss(Mdl,featureExtractionTest,labelTest)*100)
% TP = 0;
% FP = 0;
% FN = 0;
% TN = 0;
% for ii=1:max(labelTrain)
%     actualLabel = find(labelTest==ii);
%     predictedLabel = find(predicted==ii);
%     TP = length(intersect(actualLabel,predictedLabel))+TP;
%     FN = length(setdiff(actualLabel,predictedLabel))+FN;
%     FP = length(setdiff(predictedLabel,actualLabel))+FP;
%     TN = length(intersect(find(labelTest~=ii),find(predicted~=ii)))+TN;
% end
% precision = TP / (TP+FP);
% recall = TP /(TP+FN);
% F1Score = 2 * ((precision*recall)/(precision+recall));
% [ confusionM,F1Score2,TP2,TN2,FP2,FN2 ] = confusionMatrix( labelTest,predicted)
% confusionM = zeros(max(labelTrain),max(labelTrain));
% for ii=1:max(labelTrain)
%     actualLabel = find(labelTest==ii);
%     for jj=1:max(labelTrain)
%         otherLabel= find(labelTest==jj);       
%         if(ii==jj)
%             confusionM(ii,jj)= length(find(predicted(otherLabel)==ii));
%         else
%             confusionM(ii,jj)= length(find(predicted(otherLabel)==ii));
%         end
%     end
% end
% for ii=1:max(labelTrain)
%     TP(ii) = confusionM(ii,jj);
%     FN(ii) = c = a==b; d=~c

% end
% TP = sum(diag(confusionM));
% FP = 
% precision = TP / (TP+FP);
% recall = TP /(TP+FN);
% F1Score = 2 * ((precision*recall)/(precision+recall));