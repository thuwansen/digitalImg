%% 进行时域线性滤波，实质是核函数为31x31 one矩阵的滤波器
I=phantom;
imshow(I);
A=ones(31);
I_filt=imfilter(I,A);
figure,imshow(I_filt,[]);

%% imfilter实质是时域内的卷积
I=imread('lena.jpg');
figure(1),imshow(I);
h=fspecial('gaussian',[15,15],10);
I_filter=imfilter(I,h,'conv');
figure(2),imshow(I_filter);