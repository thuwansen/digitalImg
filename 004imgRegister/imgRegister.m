%% 图像配准主要是imregister和imregconfig函数，imregconfig是提供配准的条件 
clc,clear,close all;
fixImg=dicomread('knee1.dcm');
subplot(2,2,1),imshow(fixImg,[]);
moveImg=dicomread('knee2.dcm');
subplot(2,2,2),imshow(moveImg,[]);
subplot(2,2,3),imshowpair(fixImg,moveImg);

[optimizer,metric]=imregconfig('multimodal');
optimizer.MaximumIterations=500;
moveImg_post=imregister(moveImg,fixImg,'affine',optimizer,metric);
subplot(2,2,4),imshowpair(fixImg,moveImg_post);