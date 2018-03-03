function [ histFix ] = lbp16Uniform(img,r  )
% hist=zeros(1,2^16);
% img = rgb2gray(img);
desimalM = [2^15,2^14,2^13,2^12,2^11,2^10,2^9,2^8,2^7,2^6,2^5,2^4,2^3,2^2,2^1,2^0];
histM = [1,2,3,4,5,7,8,9,13,15,16,17,25,29,31,32,33,49,57,61,63,64,65,97,113,121,125,127,128,129,193,225,241,249,253,255,256,257,385,449,481,497,505,509,511,512,513,769,897,961,993,1009,1017,1021,1023,1024,1025,1537,1793,1921,1985,2017,2033,2041,2045,2047,2048,2049,3073,3585,3841,3969,4033,4065,4081,4089,4093,4095,4096,4097,6145,7169,7681,7937,8065,8129,8161,8177,8185,8189,8191,8192,8193,12289,14337,15361,15873,16129,16257,16321,16353,16369,16377,16381,16383,16384,16385,24577,28673,30721,31745,32257,32513,32641,32705,32737,32753,32761,32765,32767,32768,32769,32770,32772,32776,32784,32800,32832,32896,33024,33280,33792,34816,36864,40960,49152,49153,49154,49156,49160,49168,49184,49216,49280,49408,49664,50176,51200,53248,57344,57345,57346,57348,57352,57360,57376,57408,57472,57600,57856,58368,59392,61440,61441,61442,61444,61448,61456,61472,61504,61568,61696,61952,62464,63488,63489,63490,63492,63496,63504,63520,63552,63616,63744,64000,64512,64513,64514,64516,64520,64528,64544,64576,64640,64768,65024,65025,65026,65028,65032,65040,65056,65088,65152,65280,65281,65282,65284,65288,65296,65312,65344,65408,65409,65410,65412,65416,65424,65440,65472,65473,65474,65476,65480,65488,65504,65505,65506,65508,65512,65520,65521,65522,65524,65528,65529,65530,65532,65533,65534,65535,65536];
histFix= zeros(1,length(histM)+1);
imgGrayScale = padarray(img,[r r]);
Xr = fix(r/2);
for i=r+1:size(imgGrayScale,1)-r
    for j=r+1:size(imgGrayScale,2)-r
        binaryM(1,1) =  imgGrayScale(i,j)<= imgGrayScale(i-r+1,j-r+1);
        binaryM(1,2) =  imgGrayScale(i,j)<= imgGrayScale(i-r,j-Xr);
        binaryM(1,3) =  imgGrayScale(i,j)<= imgGrayScale(i-r,j);
        binaryM(1,4) =  imgGrayScale(i,j)<= imgGrayScale(i-r,j+Xr);
        binaryM(1,5) =  imgGrayScale(i,j)<= imgGrayScale(i-r+1,j+r-1);
        binaryM(1,6) =  imgGrayScale(i,j)<= imgGrayScale(i-Xr,j+r);
        binaryM(1,7) =  imgGrayScale(i,j)<= imgGrayScale(i,j+r);
        binaryM(1,8) =  imgGrayScale(i,j)<= imgGrayScale(i+Xr,j+r);
        binaryM(1,9) =  imgGrayScale(i,j)<= imgGrayScale(i+r-1,j+r-1);
        binaryM(1,10) =  imgGrayScale(i,j)<= imgGrayScale(i+r,j+Xr);
        binaryM(1,11) =  imgGrayScale(i,j)<= imgGrayScale(i+r,j);
        binaryM(1,12) =  imgGrayScale(i,j)<= imgGrayScale(i+r,j-Xr);
        binaryM(1,13) =  imgGrayScale(i,j)<= imgGrayScale(i+r-1,j-r+1);
        binaryM(1,14) =  imgGrayScale(i,j)<= imgGrayScale(i+Xr,j-r);
        binaryM(1,15) =  imgGrayScale(i,j)<= imgGrayScale(i,j-r);
        binaryM(1,16) =  imgGrayScale(i,j)<= imgGrayScale(i-Xr,j-r);
        desM = sum(binaryM .* desimalM)+1;
        if(any(histM==desM)~=0)
            [nilai,idx] = find(histM==desM);
            histFix(1,idx) = histFix(1,idx)+1;
        else
           histFix(1,length(histFix))= histFix(1,length(histFix))+1; 
        end  
    end
end
end

