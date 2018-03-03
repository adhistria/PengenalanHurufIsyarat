function [newImg, hist ] = lbp162( img,r )
hist=zeros(1,2^16);
desimalM = [2^15,2^14,2^13,2^12,2^11,2^10,2^9,2^8,2^7,2^6,2^5,2^4,2^3,2^2,2^1,2^0];
imgGrayScale = padarray(img,[r r]);
Xr = fix(r/2);
newImg = zeros(size(img,1),size(img,2));
for ii=r+1:size(imgGrayScale,1)-r
    for jj=r+1:size(imgGrayScale,2)-r
        binaryM(1,1) =  imgGrayScale(ii,jj)<=imgGrayScale(ii-r,jj-r);
        binaryM(1,2) =  imgGrayScale(ii,jj)<=imgGrayScale(ii-r,jj-Xr);
        binaryM(1,3) =  imgGrayScale(ii,jj)<=imgGrayScale(ii-r,jj);
        binaryM(1,4) =  imgGrayScale(ii,jj)<=imgGrayScale(ii-r,jj+Xr);
        binaryM(1,5) =  imgGrayScale(ii,jj)<=imgGrayScale(ii-r+1,jj+r-1);
        binaryM(1,6) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-Xr,jj+r);
        binaryM(1,7) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj+r);
        binaryM(1,8) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+Xr,jj+r);
        binaryM(1,9) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r-1,jj+r-1);
        binaryM(1,10) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj+Xr);
        binaryM(1,11) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj);
        binaryM(1,12) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj-Xr);
        binaryM(1,13) =  imgGrayScale(ii,jj)<=imgGrayScale(ii+r-1,jj-r+1);
        binaryM(1,14) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+Xr,jj-r);
        binaryM(1,15) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj-r);
        binaryM(1,16) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-Xr,jj-r);
        desM = sum(binaryM .* desimalM)+1;
        newImg(ii-r,jj-r) = sum(binaryM .* desimalM);

        hist(1,desM) = hist(1,desM)+1;
    end
end
newImg = uint8(newImg);
end

