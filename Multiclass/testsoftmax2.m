function rate = testsoftmax2(w, ex, ey)

exnum = size(ex, 1);
numError = 0;
for i = 1 : exnum
    x = [1, ex(i, :)]';
    y = w*x;
    [~,pr] = max(y);
    if ey(i, pr) ~= 1
        numError = numError + 1;
    end
end

rate = numError / exnum;