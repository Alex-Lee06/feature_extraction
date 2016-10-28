% You can change anything you want in this script.
% It is provided just for your convenience.
clear; clc; close all;

img_path = './train/';
class_num = 30;
img_per_class = 60;
img_num = class_num .* img_per_class;
feat_dim = size(feature_extraction(imread('./val/Balloon/329060.JPG')),2);

folder_dir = dir(img_path);
feat_train = zeros(img_num,feat_dim);
label_train = zeros(img_num,1);
all_features = [];
for i = 1:length(folder_dir)-2
    
    img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
    if isempty(img_dir)
        img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
    end
    
    label_train((i-1)*img_per_class+1:i*img_per_class) = i;
    
   for j = 1:length(img_dir):5        
        img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
        img = rgb2gray(img);
        points = detectSURFFeatures(img);
        [features, valid_points] = extractFeatures(img, points);
        all_features = [all_features; features];
    end
    
end
[idx, centroid] = kmeans(all_features, 128, 'MaxIter', 10000, 'Replicates', 5);
save('model.mat','feat_train','label_train','centroid');