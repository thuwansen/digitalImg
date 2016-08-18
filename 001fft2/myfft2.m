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

%% 频域内滤波 
clc,clear,close all;
img=imread('house.jpg');
img=double(img);
h=fspecial('sobel'); %检查竖直边缘的函数
[p,q]=size(img);
[a,b]=size(h);
IMG=fft2(img,p+a-1,q+b-1); % 填零，防止卷入重复
% IMG_shift=fftshift(abs(IMG));
H=freqz2(h,q+b-1,p+a-1);
H_shift=ifftshift(H);
IMG_filter=IMG.*H;

newImg=ifft2(ifftshift(IMG_filter));
resultImg=newImg(1:p,1:q);
subplot(1,3,1),imshow(img,[]);
subplot(1,3,2),imshow(resultImg,[]);
meanImg=resultImg;
meanImg(meanImg>mean(mean(resultImg)))=1;
meanImg(meanImg~=1)=0;
subplot(1,3,3),imshow(meanImg);
% 滤波器的步骤：
%  1、定义填零部分的大小（防止卷入）2、对原图fft2 3、用fspecial获得核函数h 4、将h转换到频域内 frequ2 5、
% 频域内的核函数进行 ifftshift 6、频域内相乘 7、ifft2转回时域

