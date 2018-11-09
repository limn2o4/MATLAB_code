%不同线性图像的演示
t = linspace(0,4*pi,100);
% 相当于是x轴
y1 = sin(t);
y2 = cos(t);
figure(1); %新开一个窗口，很重要
plot(t,y1,'g-',t,y2,'r-')
title('图像名称')
xlabel('x = 0 to 4\pi','Fontsize',12)
ylabel('幅值','Fontsize',12)
legend('sin(x)','cos(x)')

%一幅图上显示四个演示
y3 = tan(t);
y4 = cot(t);
figure(2);
%2行2列第一个
subplot(2,2,1);
plot(t,y1);
subplot(2,2,2);
plot(t,y2);
subplot(2,2,3);
plot(t,y3);
subplot(2,2,4);
plot(t,y4);

%三维图像演示
[X,Y,Z] = peaks(30);
% 函数按照题目要求写
figure(3);
subplot(1,3,1);
plot3(X,Y,Z); % 曲线
subplot(1,3,2);
mesh(X,Y,Z); % 网线
subplot(1,3,3);
surf(X,Y,Z); % 曲面


%实在不会请自己百度ezplot
