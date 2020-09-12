%% Q3
clc, clear;
%% e
load fisheriris
Xo1 = meas(1:30,1:4);
Xo2 = meas(51:80,1:4);
Xo3 = meas(101:130,1:4);
%% b
%Virginica vs setosa and versicolor
Xo = [Xo3;Xo1;Xo2];
[m n] = size(Xo);
X = Xo;
y = zeros(90,1);
for i = 1:m
    if i<=m/3 
        y(i) = 0;
        continue;
    end
        y(i) = 1;
end
num_iters=50000;
alpha=0.1;
[m,n]=size(X);
X1=[ones(m,1),X];
[theta0,J]=gradient_descent(X1,y,[0,0,0,0,0]',alpha,num_iters);
%Versicolor vs Setosa and Virginica
Xo = [Xo2;Xo1;Xo3];
[m n] = size(Xo);
X = Xo;
y = zeros(90,1);
for i = 1:m
    if i<=m/3 
        y(i) = 0;
        continue;
    end
        y(i) = 1;
end
num_iters=50000;
alpha=0.1;
[m,n]=size(X);
X2=[ones(m,1),X];
[theta1,J]=gradient_descent(X2,y,[0,0,0,0,0]',alpha,num_iters);
%Setosa vs Versicolor and Virginica
Xo = [Xo1; Xo2; Xo3];
[m n] = size(Xo);
X = Xo;
y = zeros(90,1);
for i = 1:m
    if i<=m/3 
        y(i) = 0;
        continue;
    end
        y(i) = 1;
end
num_iters=50000;
alpha=0.1;
[m,n]=size(X);
X3=[ones(m,1),X];
[theta2,J]=gradient_descent(X3,y,[0,0,0,0,0]',alpha,num_iters);
%% d
Xt1 = meas(31:50, 1:4);
Xt2 = meas(81:100, 1:4);
Xt3 = meas(131:150, 1:4);
Xt = [Xt1; Xt2; Xt3];
y= zeros(size(Xt,1), 1);
y(1:20)=1; y(20:40)=2;y(40:60)=3;
[~]=one_vs_all(Xt,theta2,theta1,theta0,y);
