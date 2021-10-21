function [] = testsoftmax10(w, ex, ey)

exnum = randperm(10000,10);
ex = ex(exnum, :);
ey = ey(exnum, :);
numError = 0;
for i = 1 : 10
    x = [1, ex(i, :)]';
    y = w*x;
    [~,pr] = max(y);
    fprintf("该样本被测试为%d\n",pr-1);
    if ey(i, pr) ~= 1
        numError = numError + 1;
        true = max(ey(i, :));
        fprintf("分类错误,正确分类为%d\n\n",true);
    else
        fprintf("分类正确\n\n")
    end
end

rate = numError / 10;
fprintf("错误率为%.1f%%",rate*100);