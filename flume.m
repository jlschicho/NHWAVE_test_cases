clear all
m=50;
n=50;
dep=zeros([n,m]);
dep(:,:)=30;

save -ASCII wave_flume.txt dep
