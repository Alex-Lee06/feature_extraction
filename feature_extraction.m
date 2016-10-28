function feat = feature_extraction(img)
% Output should be a fixed length vector [1*dimension] for a single image. 
% Please do NOT change the interface.
%% use only for training.
img = rgb2gray(img);
points = detectSURFFeatures(img);
% points = points.selectStrongest(128);
[features, valid_points] = extractFeatures(img, points);
[a,b] = size(features);
feat = b;
%% use during testing
% load('model.mat','centroid');
% [r, c] = size(features);
% [row, col] = size(centroid);
% feat = zeros(1, row);
% [D,I] = pdist2(centroid, features, 'euclidean', 'Smallest', 5);
% for i = 1:r
%     feat(1, I(1,i)) = feat(1, I(1,i)) + 1;
% end

end

