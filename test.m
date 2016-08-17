% clc,clear,close all
% h=fspecial('gaussian',[5,5],0.5)
% h1=freqz2(h,5,5)
%% 这个程序的目的是将图像进行频域内高斯高通、低通滤波
clc,clear,close all;
% lena=imread('character2.jpg');
lena=phantom;
% lena=double(rgb2gray(lena));
% lena=le
figure(1),imshow(lena,[]);
[imgX,imgY]=size(lena);
% h=fspecial('gaussian',[imgX,imgY],15);
h=zeros(imgX,imgY);
h(round(imgX/2-20):round(imgX/2+20),round(imgY/2-20):round(imgY/2+20))=1;
h=1-h;
% [hX,hY]=size(h);
% dX=imgX+hX-1;
% dY=imgY+hY-1;
% H=freqz2(h,dX,dY);
% H=ifftshift(H);
% H=H';
% H=1-H;
LENA=fft2(lena,imgX,imgY);
LENA=fftshift(LENA);
temp=LENA.*h;
LENA=ifftshift(temp);
lenaLowFilterTemp=ifft2(temp);
lenaLowFilter=lenaLowFilterTemp(1:imgX,1:imgY);
figure(2),imshow(lenaLowFilter);