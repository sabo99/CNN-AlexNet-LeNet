close all; clear all; clc
% Per folder
folder = ["Testing","Training","Validation"]
% folder = {'Testing','Training','Validation'}
subfolder = ["0L","0R","1L","1R","2L","2R","3L","3R","4L","4R","5L","5R"]

% path
fol = 1 
sub = 1

path = strcat(char(folder(fol)), '\', char(subfolder(sub)))

input = strcat('D:\MDP\Skripsi\Program\Fingers-Dataset\Original\', path)
output = strcat('D:\MDP\Skripsi\Program\Fingers-Dataset\Pre-Processing\', path)

f = ls(input)
f(1,:) = []
f(1,:) = []

for i=1:size(f)
    IM = imread(fullfile(input, f(i,:)))
    % Pre-processing (Threshold)
    x = graythresh(IM)
    I = imbinarize(IM, x)
    
    fileName = fullfile(f(i,:))
    newFileName = strrep(fileName, '.png', '_output.png')
    subplot(1,2,1), imshow(IM), title('Citra Grayscale')
    subplot(1,2,2), imshow(I), title('Citra Threshold')
%     imwrite(I, fullfile(output, newFileName))
    
    disp('>> -- Berhasil -- <<')
end


