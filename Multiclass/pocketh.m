function w = pocketh(ex1,ex2)

ex = [ex1; ex2];
ex1num = size(ex1, 1);
%ex2num = size(ex2, 1);
[numSample, numParam] = size(ex);
minNumError = numSample;
w = zeros(numParam+1, 1); %假设threhold=0
itCount = 0;

while itCount<1000
    %找到所有错误点个数
    numError = 0;
    for i = 1:ex1num
        x = [1, ex(i, :)]';%x0=1
        if sign(w'*x) ~= 1
            if numError == 0 %记录错误记录用于随机选取
                Error = i;
            else
                Error = [Error , i];
            end
            numError=numError+1;
        end
    end
    for i = (ex1num + 1) : numSample
        x = [1, ex(i, :)]';%x0=1
        if sign(w'*x) ~= -1
            if numError == 0 %记录错误记录用于随机选取
                Error = i;
            else
                Error = [Error , i];
            end
            numError=numError+1;
        end
    end
    
    
    %更新最小错误点个数
    if minNumError > numError
        minNumError = numError;%更新最优解
        wbest = w;
        
    end
    if minNumError == 0
        break;
    end
    %用最后一个错误点更新W
    j = unidrnd(numError); 
    errorPos = Error(j);
    if errorPos > ex1num
        y = -1;
    else
        y = 1;
    end
    w = w + y*[1, ex(errorPos, :)]';
    itCount = itCount+1;
    
end
