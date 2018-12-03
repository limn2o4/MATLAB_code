clear all;
% reference of https://blog.csdn.net/liyuefeilong/article/details/45217335
% his work is really good
w1 = unifrnd(-100,10,30,2);
w2 = unifrnd(1,100,30,2);
figure;
plot(w1(:,1),w1(:,2),'ro');
hold on;
grid on;
plot(w2(:,1),w2(:,2),'b*');
one = ones(30,1);
y1 = [one w1];
y2 = [one w2];
w12 = [y1 ; -y2];
y = zeros(size(w12,1),1);
a = [0 0 0];
Eta = 1;
time = 0;
while any(y<=0)
    for i =  1:size(y,1)
        y(i) = a*w12(i,:)';
    end
    a = a + sum(w12(find(y<=0),:));
    time = time +1;
    if (time > 300) 
        break;
    end
end
if (time >= 300) 
    disp("Converge failed");
    disp(num2str(a));
else
    disp(["Converge succeed:",num2str(a)]);
    disp(["With:",num2str(time),"iteratoration."]);
end
xmin = min(min(w1(:,1)),min(w2(:,1)));
xmax = max(max(w1(:,1)),max(w2(:,1)));
xindex = xmin-1:(xmax-xmin)/1000:xmax+1;
yindex = -a(2)*xindex/a(3)-a(1)/a(3);
plot(xindex,yindex);

    