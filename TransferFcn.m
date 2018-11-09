% 写一个传递函数
num = conv([30],[1 6]);
den = conv([1 0 0],conv([1 3],[1 3 2])); 
sys = tf(num,den)

%零极点模型 对应零点，极点，增益
num1 = conv([10 1],conv([1 5],[2 9])); %注意conv函数的嵌套规则
den1 = conv([1 2],conv([1 4],[1 7]));
[z,p,k] = residue(num1,den1)
sys1 = zpk(z,p,k);
figure(1);
pzmap(sys1); %零极点图

% 时域分析法 阶跃信号
num2 = conv([1 1],[1 3]);
den2 = conv([1 10],conv([1 15],[1 20]));

sys = tf(num2,den2)
t = 1:0.01:10; %持续时间
figure(2);
step(num2,den2,t); %阶跃响应图 离散使用dstep 脉冲impluse 

%复域分析 根轨迹图
num3 = conv([1 1],[1 2]);
den3 = conv([1 3],conv([1 4],conv([1 5],[1 6])));
figure(3);
rlocus(num,den);

%频域分析法 参数见p192
wn = 10;
kesi = 0.8;
num4 = wn * wn;
den4 = [1 2*kesi*wn,wn*wn];
%二阶振荡环节 欠阻尼状态
figure(4);
bode(num4,den4)          
% 波德图
figure(5);
nichols(num4,den4);
% 尼科尔斯图
figure(6);
nyquist(num4,den4);
% 奈奎斯特图
figure(7);
margin(num4,den4);
%[gm,pm,wp,wg] = margin(num4,den4)
%计算相位裕度和增益 ，前面有输出的方括号不能出图