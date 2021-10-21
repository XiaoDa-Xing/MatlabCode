

function [] = test4(w, c, ex1, ex2)

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
ex = [ex1; ex2];

y1 = ones(ex1num,1); 
y2 = -ones(ex2num,1); 
y = [y1; y2];

exz = [ones(exnum , 1), ex, ex(:, 1).*ex(:, 1), ex(:, 1).*ex(:, 2), ex(:, 2).*ex(:, 2),ex(:, 1).*ex(:, 1).*ex(:, 1), ex(:, 1).*ex(:, 1).*ex(:, 2), ex(:, 1).*ex(:, 2).*ex(:, 2), ex(:, 2).*ex(:, 2).*ex(:, 2),ex(:, 1).*ex(:, 1).*ex(:, 1).*ex(:, 1), ex(:, 1).*ex(:, 1).*ex(:, 1).*ex(:, 2), ex(:, 1).*ex(:, 1).*ex(:, 2).*ex(:, 2), ex(:, 1).*ex(:, 2).*ex(:, 2).*ex(:, 2), ex(:, 2).*ex(:, 2).*ex(:, 2).*ex(:, 2) ];


for i = 1:exnum
    if sign(w'*exz(i,:)' + c) ~= y(i)
        numError = numError + 1;
    end
end

fun = @(x,y) c + w(1) + w(2).*x + w(3).*y + w(4).*x.^2 + w(5).*x.*y + w(6).*y.^2 + w(7).*x.*x.*x + w(8).*x.*x.*y + w(9).*x.*y.*y + w(10).*y.*y.*y + w(11).*x.*x.*x.*x + w(12).*x.*x.*x.*y + w(13).*x.*x.*y.*y + w(14).*x.*y.*y.*y + w(15).*y.*y.*y.*y;
fimplicit(fun);

rate = numError / exnum;
fprintf(' %d 错误率：%f\n',numError,rate);