%softmax多类别分类

function W = softmax(ex1tra, ex2tra, ex3tra, ex1test, ex2test, ex3test)

%有O个样本，N个特征，M个分类
%X为样本矩阵，O行N列，每行为每个样本的数据
%W为权重样本，M行N列，每行为每类特征的分类器
%P为标签矩阵，O行M列，每行为该样本的类别数据
%X*W'为O行M列，每行为每个样本的经过各分类器得到的分类信息
%Q为softmax之后得到的矩阵，O行M列，每行为每个样本的经过各分类器得到的分类信息进行归一化后的结果

ex1num = size(ex1tra, 1);
ex2num = size(ex1tra, 1);
ex3num = size(ex1tra, 1);
X = [ex1tra; ex2tra; ex3tra];
X = [ones(ex1num + ex2num + ex3num , 1), X];
[exnum, numParam] = size(X);

E1 = ones(3, 1);

W = zeros(3, numParam);

P = zeros(exnum, 3);
P(1:30, 1) = ones(30, 1);
P(31:60, 2) = ones(30, 1);
P(61:90, 3) = ones(30, 1);

itCount = 0;
while itCount < 10000
    G = exp(X*W');
    Q = G./(G*E1);
    W = W - 0.1*((Q - P)'*X)/exnum;
    itCount = itCount + 1;
end

rate = testsoftmax(W, ex1test, ex2test, ex3test);
fprintf('\n错误率：%f\n',rate);