function [ predicted] = SVM( featureExtractionTest,featureExtractionTrain,labelTrain)
Mdl = fitcecoc(featureExtractionTrain,labelTrain);
predicted= predict(Mdl,featureExtractionTest);
end

