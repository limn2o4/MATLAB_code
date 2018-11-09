clear
ty = 0.05;
sys = tf([0.5 1],[0.06 0]);
dsys = c2d(sys,ty,'z');
[num,den] = tfdata(dsys,'v');

u = [0.0 0.0 0.0];
y = [0 0 0];
x = [0 0 0];
e = [0 0];
for k = 1 : 5000
    t(k) = k * ty;
    in(k) = 3;
    kp = 10;ki = 0.08;kd = 8;
    du(k) = kp*x(1) + kd *x(2) + ki *x(3);
    uu(k) = u(1) + du(k);
    if uu(k) >= 5
        uu(k) = 5;
    end
    if uu(k) <= -5
        uu(k) = -5;
    end
    out(k) = -den(1)*y(1)  + num(1)*u(1) + num(2)*u(2);
    
    ee = in(k) - out(k);
    u(3) = u(2);u(2) = u(1);u(1) = uu(k);
    y(3) = y(2);y(2) = y(1);y(1) = out(k);
    
    x(1) = ee - e(1);
    x(2) = ee - 2*e(1) + e(2);
    e(2) = e(1);
    e(1) = ee;
end
plot(t,in,'r',t,out,'b');

