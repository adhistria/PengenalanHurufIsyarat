%% normalisasi data 
load('dataset.mat');
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
save('lbpP4R1HasilKedua.mat','dataTrain','dataTest','featureExtractionTrain','featureExtractionTest','labelTrain','labelTest','featureExtractionTrainNorm','featureExtractionTestNorm');