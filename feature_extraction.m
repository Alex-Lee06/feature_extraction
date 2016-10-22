% Continue to look through sift program to understand what needs to be
% called. Also look at bag of words in matlab to implement it.
function feat = feature_extraction(img)
% Output should be a fixed length vector [1*dimension] for a single image. 
% Please do NOT change the interface.

%%Read image and extract points.
feat = img;
if isrgb(feat)
    grayFeat = rgb2gray(feat);
end

[rows, cols] = size(image); 

end