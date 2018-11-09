%锅炉内胆水温定控制系统
ty = 10; %采样时间
ty = 5;
kp = 0.04;ki = 0.001;
K = 8;T = 200;tol = 100;  %增益和时间常数
u1	 = 0.0;u2 = 0.0;u3  =0.0;u4 = 0.0;u5 = 0.0;
e11 = 0;
e2 = 0.0;e21 = 0.0;
ei = 0;
xm1 = 0.0;ym1 = 0.0;
y1 = 0.0;

sys1 = tf([K],[T,1],'inputdelay',tol);
dsys1 = c2d(sys1,ty,'zoh');
[num1,den1] = tfdata(dsys1,'v');

sys2 = tf([K],[T,1],'inputdelay',tol);
dsys2 = c2d(sys2,ty,'zoh');
[num2,den2] = tfdata(dsys2,'v');

for k = 1:1:3000
    t(k) = k * ty;
    
    in(k)= 95;   %输入的值
    
    xm(k) = -den2(2)*xm1  + num2(2)*u1;
    ym(k) = -den2(2)*ym1 + num2(2) * u5;
    
    out(k) = -den1(2)*y1 + num1(2) * u5;
    
    e2(k) = in(k) - xm(k);
    ei = ei + ty * e2(k);
    u(k) = kp * e2(k) + ki * ei;
    e21 = e2(k);
    
    xm1 = xm(k);
    ym1 = ym(k);
    u5 = u4;u4 = u3;u3 = u2;u2 = u1;u1 = u(k);
    y1 = out(k);
end

plot(t,in,'r-',t,out,'b-')
legend('input','output')
    