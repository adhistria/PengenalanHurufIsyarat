function [ dtTrain,dtTest] = getData(path)
openDir = dir(path);
dtTrain = [];
dtTest = [];
folderDataTrain = '/Users/adhistria/Documents/TA2/dataTrain';
folderDataTest ='/Users/adhistria/Documents/TA2/dataTest';
for ii=4:length(openDir)
    folderName = strcat(path,'/',openDir(ii).name);
    folder = dir(strcat(folderName,'/*.png'));
    idxDtTest = randperm(length(folder),21);
    pathFolderTrain=strcat(folderDataTrain,'/',openDir(ii).name);
    pathFolderTest=strcat(folderDataTest,'/',openDir(ii).name);
    mkdir(strcat(folderDataTrain,'/',openDir(ii).name));
    mkdir(strcat(folderDataTest,'/',openDir(ii).name));
    for jj=1:length(folder)
       imageName = folder(jj).name;
       imageFile = strcat(folderName,'/',imageName);
       imageData.image = imresize(imread(imageFile),[200 200]);
       imageData.label = ii-3;
       imageData.name = imageName;
        if(any(idxDtTest==jj)==0)
           dtTrain =[dtTrain;imageData];
           copyfile(imageFile,pathFolderTrain);
        else
           dtTest =[dtTest;imageData];
           copyfile(imageFile,pathFolderTest);
        end
    end
end

