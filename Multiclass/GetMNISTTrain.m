function [] = GetMNISTTrain()

filename = 'train-images-idx3-ubyte';
savename = 'train_x';
FID = fopen(filename,'r');

MagicNumber=readint32(FID);
NumberofImages=readint32(FID);
rows=readint32(FID);
colums=readint32(FID);


savePath = [savename,'.mat'];
train_x = zeros(NumberofImages,rows*colums);
for i = 1:NumberofImages
            temp = fread(FID,(rows*colums), 'uchar');
            train_x(i,:) = temp';
end
save(savePath,'train_x');

filename = 'train-labels-idx1-ubyte';
savename = 'train_y';
FID = fopen(filename,'r');

MagicNumber=readint32(FID);
NumberofImages=readint32(FID);


savePath = [savename,'.mat'];
train_y = zeros(NumberofImages,10);
for i = 1:NumberofImages
            temp = fread(FID,1);
            train_y(i,temp+1) = 1;
end
save(savePath,'train_y');