%% ����ʱ�������˲�
I=phantom;
imshow(I);
A=ones(31);
I_filt=imfilter(I,A);
figure,imshow(I_filt,[])