function [] = fisherh(ex1, ex2)

figure('Name','fisher','NumberTitle','off');
hold on;
set(gca,'YTick',-10:1:10);
ylim([-10 10]);
set(gca,'XTick',-10:1:10);
xlim([-10 10]);
plot(ex1(:, 1), ex1(:, 2), 'b.', 'MarkerSize',20 );
plot(ex2(:, 1), ex2(:, 2), 'r.', 'MarkerSize',20 );
axis equal 

x1 = ex1';
x2 = ex2';

[row1,column1] = size(x1);
[row2,column2] = size(x2);
u1=sum(x1,2)/column1;
u2=sum(x2,2)/column2;
xw1=x1-u1;
xw2=x2-u2;
w1=zeros(row1,row1);
w2=zeros(row2,row2);
for i=1:column1
    w1 = w1 + xw1(:,i)*(xw1(:,i)');
end
for i=1:column2
    w2 = w2 + xw2(:,i)*(xw2(:,i)');
end
Sw=w1+w2;
W=inv(Sw)\(u1-u2);
s=(W'*(u1+u2))/2;

a=-10:10;
b = W(2)/W(1)*a;
plot(a , b);
hold on;
b=-(W(1)/W(2))*a-s/W(2);
plot(a , b);

g=sprintf('%d ',W);
fprintf('\nw = %s s = %d\n',g,s);