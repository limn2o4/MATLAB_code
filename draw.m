%��ͬ����ͼ�����ʾ
t = linspace(0,4*pi,100);
% �൱����x��
y1 = sin(t);
y2 = cos(t);
figure(1); %�¿�һ�����ڣ�����Ҫ
plot(t,y1,'g-',t,y2,'r-')
title('ͼ������')
xlabel('x = 0 to 4\pi','Fontsize',12)
ylabel('��ֵ','Fontsize',12)
legend('sin(x)','cos(x)')

%һ��ͼ����ʾ�ĸ���ʾ
y3 = tan(t);
y4 = cot(t);
figure(2);
%2��2�е�һ��
subplot(2,2,1);
plot(t,y1);
subplot(2,2,2);
plot(t,y2);
subplot(2,2,3);
plot(t,y3);
subplot(2,2,4);
plot(t,y4);

%��άͼ����ʾ
[X,Y,Z] = peaks(30);
% ����������ĿҪ��д
figure(3);
subplot(1,3,1);
plot3(X,Y,Z); % ����
subplot(1,3,2);
mesh(X,Y,Z); % ����
subplot(1,3,3);
surf(X,Y,Z); % ����


%ʵ�ڲ������Լ��ٶ�ezplot
