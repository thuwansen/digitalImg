%% ����ʱ�������˲���ʵ���Ǻ˺���Ϊ31x31 one������˲���
I=phantom;
imshow(I);
A=ones(31);
I_filt=imfilter(I,A);
figure,imshow(I_filt,[]);

%% imfilterʵ����ʱ���ڵľ��
I=imread('lena.jpg');
figure(1),imshow(I);
h=fspecial('gaussian',[15,15],10);
I_filter=imfilter(I,h,'conv');
figure(2),imshow(I_filter);