function [ featureExtraction ] = normalisasi( featureExtraction, min,max )
for ii=1:size(featureExtraction,1)
    for jj=1:size(featureExtraction,2)
        if(min(jj)==0 && max(jj)==0)
           featureExtraction(ii,jj)=0 ;
        else
            featureExtraction(ii,jj)= (featureExtraction(ii,jj)-min(jj))/(max(jj)-min(jj));
        end

    end
end