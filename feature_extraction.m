function feat = feature_extraction(img)
% Output should be a fixed length vector [1*dimension] for a single image. 
% Please do NOT change the interface.


feat = 1800;
grayImage = rgb2gray(img);
scale = 1.3;
J = imresize(grayImage, scale);
theta = 31;
distorted = imrotate(J, theta);
points = detectSURFFeatures(distorted);

[feature, valid_points] = extractFeatures(grayImage, points);
imshow(grayImage); hold on;
plot(valid_points.selectStrongest(50));
end