%% 这个程序的目的是将图像进行频域内高斯高通、低通滤波
clc,clear,close all;
lena=imread('../character2.jpg');
% lena=double(rgb2gray(lena));
% lena=le
figure(1),imshow(lena,[]);
h=fspecial('gaussian',[3,3],0.5);
[imgX,imgY]=size(lena);
[hX,hY]=size(h);
dX=imgX+hX-1;
dY=imgY+hY-1;
H=freqz2(h,dX,dY);
H=ifftshift(H);
H=H';
H=1-H;
LENA=fft2(lena,dX,dY);
temp=LENA.*H;
lenaLowFilterTemp=ifft2(temp);
lenaLowFilter=lenaLowFilterTemp(1:imgX,1:imgY);
figure(2),imshow(lenaLowFilter);