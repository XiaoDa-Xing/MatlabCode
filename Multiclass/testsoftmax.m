function rate = testsoftmax(w, ex1, ex2, ex3)

ex1num = size(ex1, 1);
ex2num = size(ex2, 1);
ex3num = size(ex3, 1);
exnum = ex1num + ex2num + ex3num;
numError = 0;
for i = 1 : 20
    x = [1, ex1(i, :)]';
    y = w*x;
    [~,pr] = max(y);
    fprintf('错误率：%d\n',pr);
    if pr ~= 1
        numError = numError + 1;
    end
end
for i = 1 : 20
    x = [1, ex2(i, :)]';
    y = w*x;
    [~,pr] = max(y);
    fprintf('错误率：%d\n',pr);
    if pr ~= 2
        numError = numError + 1;
    end
end
for i = 1 : 20
    x = [1, ex3(i, :)]';
    y = w*x;
    [~,pr] = max(y);
    fprintf('错误率：%d\n',pr);
    if pr ~= 3
        numError = numError + 1;
    end
end

rate = numError / exnum;