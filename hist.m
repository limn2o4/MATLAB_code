I1 = imread('liumin01.jpg');
I2 = imread('liumin02.jpg');
I3 = imread('liumin03.jpg');
[histI,x]=imhist(I1);
R1 = histeq(I1);
[hist_r1,x] = imhist(R1);
figure(1);
subplot(2,2,1);imshow(I1);title('original image');
subplot(2,2,2);imhist(I1);title('original histogram');
subplot(2,2,3);imshow(R1);title('result image');
subplot(2,2,4);imhist(R1);title('result histogram');


B = I3;
[histB,x] = imhist(B);
R2 = histeq(I2,histB);
figure(2);
subplot(2,2,1);imhist(I2);title('original histogram');
subplot(2,2,2);imhist(B);title('generalized histogram');
subplot(2,2,3);imshow(R2);title('result image');
subplot(2,2,4);imhist(R2);title('result histogram');

R3 = imfilter(I3,fspecial('prewitt'),'same');
figure(3);
subplot(1,2,1);imshow(I3);title('original image');
subplot(1,2,2);imshow(I3-R3);title('result image');