function [] = plah(ex1,ex2)

figure('Name','PLA','NumberTitle','off');
hold on;
set(gca,'YTick',-10:1:10);
ylim([-10 10]);
set(gca,'XTick',-10:1:10);
xlim([-10 10]);
plot(ex1(:, 1), ex1(:, 2), 'b.', 'MarkerSize',20 );
plot(ex2(:, 1), ex2(:, 2), 'r.', 'MarkerSize',20 );

[ex1num,paramnum] = size(ex1);
ex2num = size(ex2, 1);
itCount = 0;
w = zeros(paramnum+1,1);

while itCount < 100
    hasError = 0;
    for i = 1:ex1num
        x1 = [1, ex1(i, :)]';
        if sign(w'*x1) ~= 1
            w = w + 1*[1, ex1(i, :)]';
            hasError = 1;
            break;
        end
    end
    if hasError == 0
        for i = 1:ex2num
            x2 = [1, ex2(i,:)]';
            if sign(w'*x2) ~= -1
                w = w + (-1)*[1, ex2(i,:)]';
                hasError = 1;
                break;
            end
        end
    end
    if hasError == 0
        break;
    end
    itCount = itCount + 1;
end

g=sprintf('%d ', w);
fprintf('\n当前w = %s\n\n',g);
a=-10:10;
b=-(w(2)/w(3))*a-w(1)/w(3);
plot(a, b);
hold on;

fprintf('PLA itCount:%d,result w: %s\n', itCount);