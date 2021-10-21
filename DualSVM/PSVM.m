%支撑向量机
function [] = PSVM(ex1, ex2)

figure('Name','PSVM','NumberTitle','off');
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
[exnum, numParam] = size(ex);

y1 = ones(ex1num,1); 
y2 = -ones(ex2num,1); 
y = [y1; y2];

o = zeros(numParam, 1);
ot = zeros(1, numParam);
I = eye(numParam, numParam);

u = [0,ot];
d = [o,I];
Q = [u; d];

p = zeros(numParam + 1, 1);
a = (y.*[ones(exnum,1),ex]);
c = ones(exnum , 1);

w = quadprog(Q, p, -a, -c);

g=sprintf('%d ', w);
fprintf('\n当前w = %s\n\n',g);
a=-10:10;
b=-(w(2)/w(3))*a-w(1)/w(3);
plot(a, b);
hold on;