
load('att_face.mat');

num_training = size(id_training, 1);
num_testing = size(id_testing, 1);

id_predict = zeros(size(id_testing));

scale = 1;

for i = 1:num_testing
    
    %% extract testing image
    img_test = face_testing(:, :, i);
    
    %% convert testing image to feature vector
    vec_test = img_test(:);
    vec_test = multiscale_sobel_feature(img_test, scale);
    
    error = zeros(num_training, 1);
    for j = 1:num_training
        
        %% extract training image
        img_train = face_training(:, :, j);
        
        %% convert training image to feature vector
        vec_train = img_train(:);
        vec_train = multiscale_sobel_feature(img_train, scale);
        
        %% compute the square error between feature vectors
        diff = vec_train - vec_test;
        error(j) = sum( diff .^2 );
        
    end
    
    %% find the image id with minimal error
    [~, min_id] = min(error);
    id_predict(i) = min_id;
    
end

%% compute accuracy
accuracy = sum(id_testing == id_predict)/num_testing;
fprintf('Accuracy = %f\n', accuracy);

%---------------------------------------%
%---------- Fill in this form ----------%
%---------------------------------------%
%
% Using gradient magnitude as features:
%---------------------------------------%
% Scale |  Accuracy
%---------------------------------------%
%   1   |   0.531250
%---------------------------------------%
%   2   |   0.550000
%---------------------------------------%
%   3   |   0.593750
%---------------------------------------%
%
% Using gradient orientation as features:
%---------------------------------------%
% Scale |  Accuracy
%---------------------------------------%
%   1   |   0.081250
%---------------------------------------%
%   2   |   0.087500
%---------------------------------------%
%   3   |   0.093750
%---------------------------------------%



