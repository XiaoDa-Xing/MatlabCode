%梯度下降法
function [] = lrah1(ex1,ex2,iota)

figure('Name','lra1','NumberTitle','off');
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
ex = [ones(ex1num + ex2num,1),ex];
w = zeros(numParam+1, 1);

y1 = ones(ex1num,1); 
y2 = -ones(ex2num,1); 
y = [y1; y2];

itCount = 0;


while itCount <100
    dLin = zeros(numParam+1, 1);
    Lin = 0;
    
    for i = 1 : exnum
        dLin = dLin + (w'*(ex(i, :)') - y(i))*ex(i, :)';
        Lin = Lin + power(w'*ex(i, :)' - y(i), 2);
    end
    
    dLin = dLin / exnum;
    
    if itCount == 0
        Linp = Lin / exnum;
    else
        Linp = [Linp, Lin/exnum];
    end
    
    if dLin == 0
        break;
    end
    
    w = w - iota * dLin;
    itCount = itCount + 1;
    
    
end

g=sprintf('%d ', w);
fprintf('\n当前w = %s\n\n',g);
a=-10:10;
b=-(w(2)/w(3))*a-w(1)/w(3);
plot(a, b);
hold on;

figure('Name','epoch','NumberTitle','off');
Linpx = 1 : 100;
plot(Linpx, Linp);

fprintf('lra itCount:%d,result w: %s\n', itCount);
