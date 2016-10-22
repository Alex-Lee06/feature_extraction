% Continue to look through sift program to understand what needs to be
% called. Also look at bag of words in matlab to implement it.
function feat = feature_extraction(img)
% Output should be a fixed length vector [1*dimension] for a single image. 
% Please do NOT change the interface.

%%Read image, turn it gray and extract points.
img = imageDatastore(fullfile('feature_extraction-master', {'train', 'val'}), 'IncludeSubfolders', true, 'LabelSource', 'foldernames', 'FileExtensions', '.jpg');
img.Labels


[trainingSets, testSets] = splitEachLabel(img, 1);



end