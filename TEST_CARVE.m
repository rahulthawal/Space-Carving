load('pixels.mat');

%% Read and display image. 
 im = imread('silhouettes/Silhouette2_0000.png');
 figure, imshow(im);
 hold on; 
 
 


pixels = impixel(im,u,v);
plot(u,v,'yo','LineWidth',3);