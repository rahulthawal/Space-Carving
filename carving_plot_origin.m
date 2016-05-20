
tic;
% clean up memory and close all figures
close all;
clear all;

% Projection matrix from the calibration file
P = [ 1.483215e+03 -7.953666e+02 -9.153119e+02 4.046004e+03; ...
     -5.395400e+01 -1.719494e+03  3.606972e+02 3.961539e+03; ...
     -6.991278e-02 -9.069575e-01 -1.063456e+00 4.753082e+00 ];


% Index for image points
i = 1;

% Display origin of the World coordinate system onto the image
Origin = [ 0 -.5 0 1 ]';

% Project 3-D points to image points 
x = P * Origin;
            
% Transform homogeneous coords into cartesian 
u( i ) = x(1)/x(3);            
v( i ) = x(2)/x(3);


% Read and display image. 
im = imread('silhouettes/Silhouette1_0000.png');
figure, imshow(im);

hold on; 
plot(u,v,'yo','LineWidth',3)

toc;