video = VideoWriter('yourvideo.avi'); %create the video object
open(video); %open the file for writing
% d = dir('run5\*.png');
% writeVideo(video,d);
for counter=1:99 %where N is the number of images
  I = imread('run5/*.png'); %read the next image
  writeVideo(video,I); %write the image to file
end

% imagefiles = dir('run5/*.png');      
% nfiles = length(imagefiles);    % Number of files found
% for ii=1:nfiles
%    currentfilename = imagefiles(ii).name;
%    currentimage = imread(currentfilename);
%    images{ii} = currentimage;
% end


close(video); %close the file