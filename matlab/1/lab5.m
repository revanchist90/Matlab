I=imread('house1.jpg');
points = harris_laplace(I);
draw_points(I,points);
I2=imread('house2.jpg');
I2 = imrotate(I2, 35, 'bilinear');
I2=I2(250:400,250:350,:);
points2 = harris_laplace(I2);
draw_points(I2,points2);