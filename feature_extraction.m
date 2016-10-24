% Continue to look through sift program to understand what needs to be
% called. Also look at bag of words in matlab to implement it.
function feat = feature_extraction(img)
% Output should be a fixed length vector [1*dimension] for a single image. 
% Please do NOT change the interface.

%%Read image and detect feature points.
imgData = imageDatastore(fullfile('val'), 'IncludeSubfolders', true, 'LabelSource', 'foldernames', 'FileExtensions', '.jpg');
%[trainingSets, testSets] = splitEachLabel(img, 60);
for i = 1:length(imgData.Files)
    data = readimage(imgData,i);
    grayData = rgb2gray(data);
    feat = detectSURFFeatures(grayData);
    [f1, vpts1] = extractFeatures(grayData, feat);
    
    
    idx3 = kmeans(X,3,'Distance', vpts1);
    %crop image for visual words
    for p = 1:length(vpts1)
        vWords = imcrop(grayData, vpts1);
    end
end





%%feature is working.

%grayImage = rgb2gray(img);

%scale = 1.3;
%J = imresize(grayImage, scale);
%theta = 31;
%distorted = imrotate(J, theta);
%figure
%imshow(distorted);


%%Extract features
%[f1,vpts1] = extractFeatures(grayImg1, feat);



%imageRead = readimage(img, 1);
%grayImage = rgb2gray(imageRead);
%imshow(grayImage);
%detect feature points




end