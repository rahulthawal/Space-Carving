tic;

% clean up memory and close all figures
close all;
clear all;

% Projection matrix from the calibration file
P = [ 1.483215e+03 -7.953666e+02 -9.153119e+02 4.046004e+03; ...
     -5.395400e+01 -1.719494e+03  3.606972e+02 3.961539e+03; ...
     -6.991278e-02 -9.069575e-01 -1.063456e+00 4.753082e+00 ];

% Sample 3-D points within a cube shape centered at the origin
[ Xi Yi Zi ] = meshgrid( -1:.1:1, -1:.1:1, -1:.1:1 );  
 
% Number of points
M = size( Xi(:), 1 );

% Convert points to homogeneous coordinates. Transpose result so points are
% column vectors.
X =  [ Xi(:) Yi(:) Zi(:) ones( M, 1 ) ]';

% Project 3-D points to image points
x = P * X;

% Convert homogeneous coords back to cartesian. Notice that division is
% elementwise using ./ instead of /
u = x(1,:)./x(3,:);
v = x(2,:)./x(3,:);

% Read and display image. 
im = imread('silhouettes/Silhouette1_0000.png');
figure, imshow(im);

% Plot the (u,v) points on the image
hold on; 

pixels = impixel(im,u,v)
if (pixels(:,:,:)==[0,0,0])
plot(u,v,'yo','LineWidth',3);
end





toc;