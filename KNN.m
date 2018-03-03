function [ predicted] = KNN( featureExtractionTest,featureExtractionTrain,labelTrain,k)
Mdl = fitcknn(featureExtractionTrain,labelTrain,'NumNeighbors',k);
predicted= predict(Mdl,featureExtractionTest);

% for ii=1:length(featureExtractionTest)
%     euclid =[];
%     for jj=1:size(featureExtractionTrain,1)
%         euclid(jj,1) = norm(featureExtractionTest(ii,:)-featureExtractionTrain(jj,:));
% %         euclid(jj,1) = sqrt(sum((featureExtractionTes(ii,:) - featureExtractionTrain(jj,:)) .^ 2));
%     end
%     [euclidSorted,I] = sortrows(euclid);
%     predicted(ii,1)=(labelTrain(I(1)));
% end
% % dtBenar = predicted -labelTest';
% % hasilBenar = find(dtBenar==0);
% % akurasi = length(hasilBenar)/length(labelTest);
end

