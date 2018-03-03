function [histFix ] = lbpUniform( imgGrayScale)
desimalM = [128,64,32;1,0,16;2,4,8];
hist=zeros(1,256);
imgGrayScale = padarray(imgGrayScale,[1 1]);
hist2=0;

for ii=2:size(imgGrayScale,1)-1  
    for jj=2:size(imgGrayScale,2)-1
        biner=[];
        neighbour = (imgGrayScale(ii-1:ii+1,jj-1:jj+1));
        binaryM = neighbour >=neighbour(2,2);
        biner= [biner,binaryM(1,1:3)];
        biner= [biner,(binaryM(2:3,3)')];
        biner= [biner,fliplr(binaryM(3,1:2))];
        biner= [biner,binaryM(2,1)];
        if(sum(diff(biner(:))~=0)<=2)
            desM = single(binaryM .* desimalM);
            histVal = sum(desM(:))+1;
            hist(1,histVal) = single(hist(1,histVal)+1);
        else
            hist2 = hist2+1;
        end
    end
end
index = find(hist~=0);
histFix = hist(index);
histFix(1,59) = hist2;
% histFix  = histogram(histFix,'Normalization','probability');
histFix  = histFix ./norm(histFix);
end