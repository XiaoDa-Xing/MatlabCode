%对偶支撑向量机
function [] = DSVM(ex1, ex2)

figure('Name','DSVM','NumberTitle','off');
hold on;
%set(gca,'YTick',-10:1:10);
%ylim([-10 10]);
%set(gca,'XTick',-10:1:10);
%xlim([-10 10]);
plot(ex1(:, 1), ex1(:, 2), 'b.', 'MarkerSize',20 );
plot(ex2(:, 1), ex2(:, 2), 'r.', 'MarkerSize',20 );

ex1num = size(ex1, 1);
ex2num = size(ex2, 1);
ex = [ex1; ex2];
[exnum, numParam] = size(ex);

y1 = ones(ex1num,1); 
y2 = -ones(ex2num,1); 
y = [y1; y2];

Q = zeros(exnum);
for i = 1 : exnum
    for j = 1 : exnum
        Q(i,j) = y(i)*y(j)*ex(i, :)*ex(j, :)';
    end
end

A = -eye(exnum);
b = zeros(exnum , 1);
p = -ones(exnum, 1);
Aeq = y';
beq = 0;

alpha = quadprog(Q, p, A, b, Aeq, beq);

w = zeros(numParam, 1);

for i = 1 : exnum
    if alpha(i) > 1e-5
        w = w + alpha(i)*y(i)*ex(i, :)';
        g=sprintf('%d ', ex(i, :));
        fprintf('\n支撑向量 %s\n',g);
        plot(ex(i, 1), ex(i, 2), 'm*', 'MarkerSize',23 );
    end
end

for i = 1 : exnum
    if alpha(i) > 1e-5
        c = y(i) - w'*ex(i, :)';
        break;
    end
end
w = [c; w];

g=sprintf('%d ', w);
fprintf('\n当前w = %s\n\n',g);
a=-10:100;
z=-(w(2)/w(3))*a-w(1)/w(3);
plot(a, z);
hold on;
