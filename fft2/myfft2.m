%% ����ļ���Ҫ���ڹ���ͼ�񣬲���ͼ����и���Ҷ�任,��ʾ�任��ͼ��
clc,clear,close all;
a=zeros(50,40);
a(20:30,18:22)=1;
subplot(2,2,1),imshow(a);

%% ���и���Ҷ�任���鿴Ƶ��ͼ��
A=fft2(a); %���Ƚ���2ά����Ҷ�任
A_abs=abs(A);
subplot(2,2,2),imshow(A_abs,[]);
A_shift=fftshift(A_abs);
subplot(2,2,3),imshow(A_shift,[]);
A_log=log(1+abs(A_shift));
subplot(2,2,4),imshow(A_log,[]);

%% Ƶ�����˲� 
clc,clear,close all;
img=imread('house.jpg');
img=double(img);
h=fspecial('sobel'); %�����ֱ��Ե�ĺ���
[p,q]=size(img);
[a,b]=size(h);
IMG=fft2(img,p+a-1,q+b-1); % ���㣬��ֹ�����ظ�
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
% �˲����Ĳ��裺
%  1���������㲿�ֵĴ�С����ֹ���룩2����ԭͼfft2 3����fspecial��ú˺���h 4����hת����Ƶ���� frequ2 5��
% Ƶ���ڵĺ˺������� ifftshift 6��Ƶ������� 7��ifft2ת��ʱ��

