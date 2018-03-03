function [ hist ] = lbp( imgGrayScale )
% desimalM = [1,2,4;128,0,8;64,32,16];
desimalM = [128,64,32;1,0,16;2,4,8];
hist=zeros(1,256);
imgGrayScale = padarray(imgGrayScale,[1 1]);
for ii=2:size(imgGrayScale,1)-1
    for j=2:size(imgGrayScale,2)-1
        neighbour = (imgGrayScale(ii-1:ii+1,j-1:j+1));
        binaryM = neighbour >=neighbour(2,2);
        desM = binaryM .* desimalM;
        histVal = sum(desM(:))+1;
        hist(1,histVal) = hist(1,histVal)+1;
    end
end
% hist = hist./max(hist);