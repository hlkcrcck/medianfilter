clc;clear all;close all;

n_foto=imread('noisy_foto.jpg');
gray_n_foto=rgb2gray(n_foto);
imwrite(gray_n_foto,'noisy_gray.jpeg');
clc;clear all;close all;
gray_n_foto=imread('noisy_gray.jpeg');

median1_gray=im_median_filter(gray_n_foto,3);
median2_gray=im_median_filter(gray_n_foto,9);
median3_gray=im_median_filter(gray_n_foto,13);

imwrite('median1_gray.jpg',median1_gray);
imwrite('median2_gray.jpg',median1_gray);
imwrite('median3_gray.jpg',median1_gray);
