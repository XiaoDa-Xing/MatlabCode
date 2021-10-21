%softmax多类别分类

function W = softmax2(train_x,train_y,test_x,test_y, num)

%有O个样本，N个特征，M个分类
%X为样本矩阵，O行N列，每行为每个样本的数据
%W为权重样本，M行N列，每行为每类特征的分类器
%P为标签矩阵，O行M列，每行为该样本的类别数据
%X*W'为O行M列，每行为每个样本的经过各分类器得到的分类信息
%Q为softmax之后得到的矩阵，O行M列，每行为每个样本的经过各分类器得到的分类信息进行归一化后的结果

exnum = size(train_x, 1);
X = [ones(exnum, 1), train_x];
numParam = size(X, 2);

E1 = ones(10, 1);

W = zeros(10, numParam);

P = train_y;

Loss = zeros(1, num);
ratetrain = zeros(1, num);
ratetest = zeros(1, num);

itCount = 1;
while itCount < num
    G = exp(X*W');
    Q = G./(G*E1);
    %W = W - 0.00001*((Q - P)'*X)/exnum;
    W = W - 0.000015*((Q - P)'*X)/exnum;
    %Loss(itCount) = E2*diag(-P*log(Q'))/exnum;
    for i = 1 : 60000
        Loss(itCount) = Loss(itCount) + (-P(i, :)*(log(Q(i, :)))')/exnum;
    end
    ratetrain(itCount) = testsoftmax2(W, train_x, train_y);
    ratetest(itCount) = testsoftmax2(W, test_x, test_y);
    itCount = itCount + 1;
end

for i = 1 : 60000
    Loss(num) = Loss(num) + (-P(i, :)*(log(Q(i, :)))')/exnum;
end
ratetrain(num) = testsoftmax2(W, train_x, train_y);
ratetest(num) = testsoftmax2(W, test_x, test_y);
Lossx = 1 : num;
ratetrainx = 1 : num;
ratetestx = 1 : num;
figure('Name','Loss','NumberTitle','off');
plot(Lossx, Loss);
figure('Name','ratetrain','NumberTitle','off');
plot(ratetrainx, ratetrain);
figure('Name','ratetest','NumberTitle','off');
plot(ratetestx, ratetest);

% rate = testsoftmax(W, ex1test, ex2test, ex3test);
% fprintf('\n错误率：%f\n',rate);