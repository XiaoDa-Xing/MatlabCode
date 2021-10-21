%一对一多分类
function [] = ovo(ex1tra, ex2tra, ex3tra, ex1test, ex2test, ex3test)

w1 = pocketh(ex1tra,ex2tra);
w2 = pocketh(ex1tra,ex3tra);
w3 = pocketh(ex2tra,ex3tra);

rate = testovo(w1, w2, w3, ex1test, ex2test, ex3test);

fprintf('\n错误率：%f\n',rate);