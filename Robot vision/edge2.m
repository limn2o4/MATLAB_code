I = imread('lena.bmp');
G = rgb2gray(I);
J1 = edge(G,'log',[],2.0);
J2 = edge(G,'log',[],1.5);
J3 = edge(G,'log',[],3.0);
C1 = edge(G,'canny');
figure('Name','your name here1','NumberTitle','off');
subplot(1,3,2);imshow(J1);title('\sigma=2.0');
subplot(1,3,1);imshow(J2);title('\sigma=1.5');
subplot(1,3,3);imshow(J3);title('\sigma=3.0');
figure('Name','your name here2','NumberTitle','off');
imshow(C1);title('canny');

