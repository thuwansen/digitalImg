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

