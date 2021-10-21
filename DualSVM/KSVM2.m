%对偶支撑向量机
function [] = KSVM2(ex1, ex2)

figure('Name','DSVM','NumberTitle','off');
hold on;
set(gca,'YTick',-10:1:10);
ylim([-10 10]);
set(gca,'XTick',-10:1:10);
xlim([-10 10]);
plot(ex1(:, 1), ex1(:, 2), 'b.', 'MarkerSize',20 );
plot(ex2(:, 1), ex2(:, 2), 'r.', 'MarkerSize',20 );

ex1num = size(ex1, 1);
ex2num = size(ex2, 1);
ex = [ex1; ex2];
exnum = size(ex, 1);
exz = [ones(exnum , 1), ex, ex(:, 1).*ex(:, 1), ex(:, 1).*ex(:, 2), ex(:, 2).*ex(:, 2)];
numParam = size(exz, 2);

y1 = ones(ex1num,1); 
y2 = -ones(ex2num,1); 
y = [y1; y2];
kp = zeros(exnum);
Q = zeros(exnum);
for i = 1 : exnum
    for j = 1 : exnum
        kp(i, j) = 1 + ex(i, :) * ex(j, :)' + (ex(i, :) * ex(j, :)')* (ex(i, :) * ex(j, :)');
        Q(i,j) = y(i)*y(j)*kp(i, j);
    end
end

A = -eye(exnum);
b = zeros(exnum, 1);
p = -ones(exnum, 1);
Aeq = y';
beq = 0;

alpha = quadprog(Q, p, A, b, Aeq, beq);
w = zeros(numParam, 1);

for i = 1 : exnum
    if alpha(i) > 1e-5
        w = w + alpha(i)*y(i)*exz(i, :)';
    end
end

sumsv = 0;
for i = 1 : exnum
    if alpha(i) > 1e-5
        for j = 1 : exnum
            if alpha(j) > 1e-5
                sumsv = sumsv + alpha(j) * y(j) * kp(j, i);
            end
        end
        c = y(i) - sumsv;
        break;
    end
end

fun = @(x,y) c + w(1) + w(2).*x + w(3).*y + w(4).*x.^2 + w(5).*x.*y + w(6).*y.^2;
fimplicit(fun);

g=sprintf('%d ', w);
fprintf('\n当前w = %s\n\n',g);
a=-10:10;
z=-(w(1)/w(2))*a-c/w(2);
%plot(a, z);
hold on;
