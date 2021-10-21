function rate = testovo(w1, w2, w3, ex1, ex2, ex3)

ex1num = size(ex1, 1);
ex2num = size(ex2, 1);
ex3num = size(ex3, 1);
exnum = ex1num + ex2num + ex3num;
numError = 0;

for i = 1:ex1num
    score = zeros(3,1);
    x = [1, ex1(i, :)]';
    if sign(w1'*x) == 1
        score(1) = score(1) + 1;
    else
        score(2) = score(2) + 1;
    end
    if sign(w2'*x) == 1
        score(1) = score(1) + 1;
    else
        score(3) = score(3) + 1;
    end
    if sign(w3'*x) == 1
        score(2) = score(2) + 1;
    else
        score(3) = score(3) + 1;
    end
    [~,pr] = max(score);
    if pr ~= 1
        numError = numError + 1;
    end
end
for i = 1:ex2num
    score = zeros(3,1);
    x = [1, ex2(i, :)]';
    if sign(w1'*x) == 1
        score(1) = score(1) + 1;
    else
        score(2) = score(2) + 1;
    end
    if sign(w2'*x) == 1
        score(1) = score(1) + 1;
    else
        score(3) = score(3) + 1;
    end
    if sign(w3'*x) == 1
        score(2) = score(2) + 1;
    else
        score(3) = score(3) + 1;
    end
    [~,pr] = max(score);
    if pr ~= 2
        numError = numError + 1;
    end
end
for i = 1:ex3num
    score = zeros(3,1);
    x = [1, ex3(i, :)]';
    if sign(w1'*x) == 1
        score(1) = score(1) + 1;
    else
        score(2) = score(2) + 1;
    end
    if sign(w2'*x) == 1
        score(1) = score(1) + 1;
    else
        score(3) = score(3) + 1;
    end
    if sign(w3'*x) == 1
        score(2) = score(2) + 1;
    else
        score(3) = score(3) + 1;
    end
    [~,pr] = max(score);
    if pr ~= 3
        numError = numError + 1;
    end
end

rate = numError / exnum;