A = [1 3 5;2 4 6;7 8 9];

f1 = poly(A)
%f1 为多项式系数
f2 = poly2str(f1,'x')
% f2 为特征多项式的表达式
x1 = roots(f1)
% x1 为特征多项式的根
x2 = eig(A)
% x2 为特征向量
[d x3] = eig(A)
% d 为特征值
d
x3
svd(A)
% 求矩阵的奇异值