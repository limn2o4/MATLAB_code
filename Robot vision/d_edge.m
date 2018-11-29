img = imread('lena.bmp');
G = rgb2gray(img);


E1 = edge(G,'Sobel');
E2 = edge(G,'prewitt');
E3 = edge(G,'roberts');
figure;
subplot(2,2,2),imshow(E1),title('sobel');
subplot(2,2,3),imshow(E2),title('prewitt');
subplot(2,2,4),imshow(E3),title('roberts');
subplot(2,2,1),imshow(img),title('orginal image');
% if you don't want see robert angle method ,just delete the code below
% figure;
% rob1 = [0 -1; 1 0];
% rob2 = [-1 0; 0 1];
% subplot(1,3,1),imshow(imfilter(G,rob1)),title('robert\theta=-45');
% subplot(1,3,2),imshow(imfilter(G,rob2)),title('robert\theta=45');