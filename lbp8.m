function [newImg, hist ] = lbp8( img,r )
newImg = zeros(size(img,1),size(img,2));
desimalM = [128,64,32;1,0,16;2,4,8];
hist=zeros(1,256);
imgGrayScale = padarray(img,[r r]);
for ii=r+1:size(imgGrayScale,1)-r
    for jj=r+1:size(imgGrayScale,2)-r
        biner(1,1) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-r,jj-r);
        biner(1,2) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-r,jj);
        biner(1,3) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-r,jj+r);
        biner(2,1) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj-r);
        biner(2,2) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj);
        biner(2,3) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj+r);
        biner(3,1) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj-r);
        biner(3,2) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj);
        biner(3,3) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj+r);
        desM = biner .* desimalM;        
        histVal = sum(desM(:));
        newImg(ii-r,jj-r) = histVal;
        hist(1,histVal+1) = hist(1,histVal+1)+1;
    end
    
end
newImg = uint8(newImg);