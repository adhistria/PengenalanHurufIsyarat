function [confusionM,akurasi, F1Score,precision, recall] = confusionMatrix( labelTest,predicted)
confusionM = zeros(max(labelTest),max(labelTest));
for ii=1:max(labelTest)
    actualLabel = find(labelTest==ii);
    for jj=1:max(labelTest)
        otherLabel= find(labelTest==jj);       
        confusionM(ii,jj)= length(find(predicted(otherLabel)==ii));
    end
end
confusionM=confusionM';
TP = sum(diag(confusionM));
diagConfM = diag(diag(confusionM));
confusionM2 = confusionM-diagConfM;
for ii=1:max(labelTest)
    FN(ii) = sum(confusionM2(ii,:));
    FP(ii) = sum(confusionM2(:,ii));
    conf2 = confusionM; conf2(ii,:)=[];conf2(:,ii)=[];
    TN(ii) = sum(sum(conf2));
end
precision = TP/(TP+sum(FP));
recall = TP/(TP+sum(FN));
F1Score = 2 * ((precision*recall)/(precision+recall));
akurasi = TP/(sum(sum(confusionM)));
end

