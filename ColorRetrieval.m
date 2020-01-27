
rootfolder = fullfile('101_ObjectCategories');
rootfolder=fullfile(rootfolder,'chair');
imds = imageDatastore(rootfolder,'IncludeSubfolder',true,'LabelSource','foldernames');

chairbag= bagOfFeatures(imds);

[training, testing] = splitEachLabel(imds,0.8,'randomize');

chairindex = indexImages(training,chairbag,'SaveFeatureLocations',false);
queryImage = readimage(testing,10);

[imageID,scores] = retrieveImages(queryImage,chairindex);
figure;
montage(training.Files(imageID),'ThumbNailSize',[200 200]);
