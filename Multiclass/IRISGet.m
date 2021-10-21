function [ex1tra,ex2tra,ex3tra,ex1test,ex2test,ex3test] = IRISGet()

ex = readmatrix('iris.csv','Range','A2:E151');
ex1 = ex(1:50,:);
ex2 = ex(51:100,:);
ex3 = ex(101:150,:);

ex1tra = ex1(randperm(50,30),:);
ex1tra = sortrows(ex1tra);
ex2tra = ex2(randperm(50,30),:);
ex2tra = sortrows(ex2tra);
ex3tra = ex3(randperm(50,30),:);
ex3tra = sortrows(ex3tra);

ex1test = zeros(20, 5);
ex2test = zeros(20, 5);
ex3test = zeros(20, 5);

j = 1;
for i = 1 : 50
    r = any(i == ex1tra(:,1)); 
    if r == 0
        ex1test(j,:) = ex1(i,:);
        j = j + 1;
    end
end

j = 1;
for i = 1 : 50
    r = any(i+50 == ex2tra(:,1)); 
    if r == 0
        ex2test(j,:) = ex2(i,:);
        j = j + 1;
    end
end

j = 1;
for i = 1 : 50
    r = any(i+100 == ex3tra(:,1)); 
    if r == 0
        ex3test(j,:) = ex3(i,:);
        j = j + 1;
    end
end

ex1tra(:,1) = [];
ex2tra(:,1) = [];
ex3tra(:,1) = [];
ex1test(:,1) = [];
ex2test(:,1) = [];
ex3test(:,1) = [];