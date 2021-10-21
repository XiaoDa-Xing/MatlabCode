function [] = lrah(ex1,ex2)

figure('Name','lra','NumberTitle','off');
hold on;
set(gca,'YTick',-10:1:10);
ylim([-10 10]);
set(gca,'XTick',-10:1:10);
xlim([-10 10]);
plot(ex1(:, 1), ex1(:, 2), 'b.', 'MarkerSize',20 );
plot(ex2(:, 1), ex2(:, 2), 'r.', 'MarkerSize',20 );

ex1num = size(ex1, 1);
ex2num = size(ex2, 1);
X = [ex1; ex2];
X = [ones(ex1num + ex2num,1),X];

Y1 = ones(ex1num,1); 
Y2 = -ones(ex2num,1); 
Y = [Y1; Y2];

XT=((X.')*X)\(X.');

W=XT*Y;

g=sprintf('%d ',W);
fprintf('\nW = %s\n\n',g);
a=-10:10;
b=-(W(2)/W(3))*a-W(1)/W(3);
plot(a , b);