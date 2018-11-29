img = imread('lena.bmp');
G = rgb2gray(img);
glcm = graycomatrix(G);
ASM = sum(

