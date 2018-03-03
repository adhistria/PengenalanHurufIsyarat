function [ histFix,hist,binaryM ] = lbp4Uniform( img,r)
hist=zeros(1,16);
desimalM = [8,4,2,1];
imgGrayScale = padarray(img,[r r]);
hist2 = 0;
for i=r+1:size(imgGrayScale,1)-r
    for j=r+1:size(imgGrayScale,2)-r
        binaryM(1,1) =  imgGrayScale(i,j)<= imgGrayScale(i-r,j);
        binaryM(1,2) =  imgGrayScale(i,j)<= imgGrayScale(i,j+r);
        binaryM(1,3) =  imgGrayScale(i,j)<= imgGrayScale(i+r,j);
        binaryM(1,4) =  imgGrayScale(i,j)<= imgGrayScale(i,j-r);
        if(sum(diff(binaryM)~=0)<=2)
            histVal = sum(binaryM.*desimalM)+1;
            hist(1,histVal) = (hist(1,histVal)+1);
        else
            hist2 = hist2+1;
        end
    end
end
index = find(hist~=0);
histFix = hist(index);
histFix(1,length(index)+1) = hist2;
end

