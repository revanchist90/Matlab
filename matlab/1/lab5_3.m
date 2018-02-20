I=imread('building.jpg');
points = harris_laplace(I);
draw_points(I,points);
I = imrotate(I, 35, 'bilinear');
I=I( 50:500, 70:450,:);
points2 = harris_laplace(I);
draw_points(I,points2);