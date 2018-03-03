function [ newImg,hist ] = lbp4( img,r)
newImg = zeros(size(img,1),size(img,2));
hist=zeros(1,16);
desimalM = [8,4,2,1];
imgGrayScale = padarray(img,[r r]);
hist2 = 0;
for ii=r+1:size(imgGrayScale,1)-r
    for jj=r+1:size(imgGrayScale,2)-r
        binaryM(1,1) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-r,jj);
        binaryM(1,2) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj+r);
        binaryM(1,3) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj);
        binaryM(1,4) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj-r);
        histVal = sum(binaryM.*desimalM);
        newImg(ii-r,jj-r) = histVal;
        hist(1,histVal+1) = hist(1,histVal+1)+1;
    end
end
newImg = uint8(newImg);
end

