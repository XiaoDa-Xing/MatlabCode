function [] = GetMNISTTest()

filename = 't10k-images-idx3-ubyte';
savename = 'test_x';
FID = fopen(filename,'r');

MagicNumber=readint32(FID);
NumberofImages=readint32(FID);
rows=readint32(FID);
colums=readint32(FID);


savePath = [savename,'.mat'];
test_x = zeros(NumberofImages,rows*colums);
for i = 1:NumberofImages
            temp = fread(FID,(rows*colums), 'uchar');
            test_x(i,:) = temp';
end
save(savePath,'test_x');

filename = 't10k-labels-idx1-ubyte';
savename = 'test_y';
FID = fopen(filename,'r');

MagicNumber=readint32(FID);
NumberofImages=readint32(FID);


savePath = [savename,'.mat'];
test_y = zeros(NumberofImages,10);
for i = 1:NumberofImages
            temp = fread(FID,1);
            test_y(i,temp+1) = 1;
end
save(savePath,'test_y');