%% ����ʱ�������˲���ʵ���Ǻ˺���Ϊ31x31 one������˲���
I=phantom;
imshow(I);
A=ones(31);
I_filt=imfilter(I,A);
figure,imshow(I_filt,[]);

%% ��ͼ����и���Ҷ�任
