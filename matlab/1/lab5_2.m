I=imread('door2.jpg');
points = harris_laplace(I);
draw_points(I,points);
I2=imread('door1.jpg');
I2 = imrotate(I2, 35, 'bilinear');
I2=I2( 50:140, 50:150,:);
points2 = harris_laplace(I2);
draw_points(I2,points2);