

function [] = test(w, ex1, ex2)

figure('Name','test','NumberTitle','off');
hold on;
set(gca,'YTick',-10:1:10);
ylim([-10 10]);
set(gca,'XTick',-10:1:10);
xlim([-10 10]);
plot(ex1(:, 1), ex1(:, 2), 'b.', 'MarkerSize',20 );
plot(ex2(:, 1), ex2(:, 2), 'r.', 'MarkerSize',20 );

ex1num = size(ex1, 1);
ex2num = size(ex2, 1);
numError = 0;
exnum = ex1num + ex2num;


for i = 1:ex1num
    x = [1, ex1(i, :)]';
    if sign(w'*x) ~= 1
        numError = numError + 1;
        
    end
end
for i = 1:ex2num
    x = [1, ex2(i, :)]';
    if sign(w'*x) ~= -1
        numError = numError + 1;
        
    end
end

g=sprintf('%d ', w);
fprintf('\n当前w = %s\n\n',g);
a=-10:10;
b=-(w(2)/w(3))*a-w(1)/w(3);
plot(a, b);
hold on;

rate = numError / exnum;
fprintf(' %d 错误率：%f\n',numError,rate);