%% 这个文件主要用于构建图像，并对图像进行傅里叶变换,显示变换后图像
clc,clear,close all;
a=zeros(50,40);
a(20:30,18:22)=1;
subplot(2,2,1),imshow(a);

%% 进行傅里叶变换，查看频域图像
A=fft2(a); %首先进行2维傅里叶变换
A_abs=abs(A);
subplot(2,2,2),imshow(A_abs,[]);
A_shift=fftshift(A_abs);
subplot(2,2,3),imshow(A_shift,[]);
A_log=log(1+abs(A_shift));
subplot(2,2,4),imshow(A_log,[]);

