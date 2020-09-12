%% Q3
%this is Q3 from a-d
clc, clear;
%% a
load fisheriris
Xo1 = meas(1:30,3:4);
Xo2 = meas(51:80,3:4);
Xo3 = meas(101:130,3:4);
figure(1);
plot(Xo1(:,1),Xo1(:,2), 'ro','MarkerFaceColor', 'r'), hold on;
plot(Xo2(:,1),Xo2(:,2), 'go','MarkerFaceColor', 'g');
plot(Xo3(:,1),Xo3(:,2), 'bo','MarkerFaceColor', 'b'),grid, hold off;
title('Virginica and setosa and versicolor');
legend('Setosa', 'Versicolor', 'Virginica');
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
[theta0,J]=gradient_descent(X1,y,[0,0,0]',alpha,num_iters);
figure(2);
plotdata(X,y)
decision_boundary(X1,theta0);
title('Virginica vs setosa and versicolor');
legend('Virginica', 'Setosa & Versicolor');
hold off;
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
[theta1,J]=gradient_descent(X2,y,[0,0,0]',alpha,num_iters);
figure(3);
plotdata(X,y)
decision_boundary(X2,theta1);
title('Versicolor vs Setosa and Virginica');
legend('Versicolor', 'Setosa & Virginica');
hold off;
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
[theta2,J]=gradient_descent(X3,y,[0,0,0]',alpha,num_iters);
figure(4);
plotdata(X,y)
decision_boundary(X3,theta2);
title('Setosa vs Versicolor and Virginica');
legend('Setosa', 'Versicolor & Virginica');
hold off;
%% c
figure(5);
plot(Xo1(:,1),Xo1(:,2), 'ro','MarkerFaceColor', 'r'); hold on;
plot(Xo2(:,1),Xo2(:,2), 'go','MarkerFaceColor', 'g');
plot(Xo3(:,1),Xo3(:,2), 'bo','MarkerFaceColor', 'b'),grid;
decision_boundary(X2,theta1);
title('Versicolor vs Setosa and Virginica');
hold off;
figure(6);
plot(Xo1(:,1),Xo1(:,2), 'ro','MarkerFaceColor', 'r'); hold on;
plot(Xo2(:,1),Xo2(:,2), 'go','MarkerFaceColor', 'g');
plot(Xo3(:,1),Xo3(:,2), 'bo','MarkerFaceColor', 'b'),grid;
decision_boundary(X1,theta0);
title('Virginica vs setosa and versicolor');
hold off;
figure(7);
plot(Xo1(:,1),Xo1(:,2), 'ro','MarkerFaceColor', 'r'); hold on;
plot(Xo2(:,1),Xo2(:,2), 'go','MarkerFaceColor', 'g');
plot(Xo3(:,1),Xo3(:,2), 'bo','MarkerFaceColor', 'b'),grid;
decision_boundary(X3,theta2);
title('Setosa vs Versicolor and Virginica');
hold off;
%% d
Xt1 = meas(31:50, 3:4);
Xt2 = meas(81:100, 3:4);
Xt3 = meas(131:150, 3:4);
Xt = [Xt1; Xt2; Xt3];
y= zeros(size(Xt,1), 1);
y(1:20)=1; y(20:40)=2;y(40:60)=3;
[~]=one_vs_all(Xt,theta2,theta1,theta0,y);