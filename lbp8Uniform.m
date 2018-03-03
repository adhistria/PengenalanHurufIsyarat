function [ histFix ] = lbp8Uniform( img,r )
% desimalM = [128,64,32;1,0,16;2,4,8];
desimalM = [128,64,32,16,8,4,2,1];
histM = [1,2,3,4,5,7,8,9,13,15,16,17,25,29,31,32,33,49,57,61,63,64,65,97,113,121,125,127,128,129,130,132,136,144,160,192,193,194,196,200,208,224,225,226,228,232,240,241,242,244,248,249,250,252,253,254,255,256];
histFix= zeros(1,length(histM)+1);
imgGrayScale = padarray(img,[r r]);
% hist2 = 0;
for ii=r+1:size(imgGrayScale,1)-r
    for jj=r+1:size(imgGrayScale,2)-r
        binaryM(1,1) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-r,jj-r);
        binaryM(1,2) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-r,jj);
        binaryM(1,3) =  imgGrayScale(ii,jj)<= imgGrayScale(ii-r,jj+r);
        binaryM(1,4) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj+r);
        binaryM(1,5) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj+r);        
        binaryM(1,6) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj);
        binaryM(1,7) =  imgGrayScale(ii,jj)<= imgGrayScale(ii+r,jj-r);
        binaryM(1,8) =  imgGrayScale(ii,jj)<= imgGrayScale(ii,jj-r);
        desM = sum(binaryM .* desimalM)+1;

%         if(sum(diff(binaryM)~=0)<=2)
%             histVal = sum(binaryM .* desimalM)+1;
%             hist(1,histVal) = (hist(1,histVal)+1);
%         else
%             hist2 = hist2+1;
%         end
        if(any(histM==desM)==1)
            [nilai,idx] = find(histM==desM);
            histFix(1,idx) = histFix(1,idx)+1;            
        else
           histFix(1,length(histFix))= histFix(1,length(histFix))+1; 
        end  
    end
end
% length(histFix)

end