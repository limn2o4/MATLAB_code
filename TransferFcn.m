% дһ�����ݺ���
num = conv([30],[1 6]);
den = conv([1 0 0],conv([1 3],[1 3 2])); 
sys = tf(num,den)

%�㼫��ģ�� ��Ӧ��㣬���㣬����
num1 = conv([10 1],conv([1 5],[2 9])); %ע��conv������Ƕ�׹���
den1 = conv([1 2],conv([1 4],[1 7]));
[z,p,k] = residue(num1,den1)
sys1 = zpk(z,p,k);
figure(1);
pzmap(sys1); %�㼫��ͼ

% ʱ������� ��Ծ�ź�
num2 = conv([1 1],[1 3]);
den2 = conv([1 10],conv([1 15],[1 20]));

sys = tf(num2,den2)
t = 1:0.01:10; %����ʱ��
figure(2);
step(num2,den2,t); %��Ծ��Ӧͼ ��ɢʹ��dstep ����impluse 

%������� ���켣ͼ
num3 = conv([1 1],[1 2]);
den3 = conv([1 3],conv([1 4],conv([1 5],[1 6])));
figure(3);
rlocus(num,den);

%Ƶ������� ������p192
wn = 10;
kesi = 0.8;
num4 = wn * wn;
den4 = [1 2*kesi*wn,wn*wn];
%�����񵴻��� Ƿ����״̬
figure(4);
bode(num4,den4)          
% ����ͼ
figure(5);
nichols(num4,den4);
% ��ƶ�˹ͼ
figure(6);
nyquist(num4,den4);
% �ο�˹��ͼ
figure(7);
margin(num4,den4);
%[gm,pm,wp,wg] = margin(num4,den4)
%������λԣ�Ⱥ����� ��ǰ��������ķ����Ų��ܳ�ͼ