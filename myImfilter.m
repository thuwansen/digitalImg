%% 进行时域现行滤波
I=phantom;
imshow(I);
A=ones(31);
I_filt=imfilter(I,A);
figure,imshow(I_filt,[])