%% 进行时域线性滤波，实质是核函数为31x31 one矩阵的滤波器
I=phantom;
imshow(I);
A=ones(31);
I_filt=imfilter(I,A);
figure,imshow(I_filt,[]);

%% 对图像进行傅里叶变换
