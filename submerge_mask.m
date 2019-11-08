clear all

% grid
m=50;
n=50;
dx=2.0;
dy=2.0;
x=[0:(m-1)]*dx;
y=[0:(n-1)]*dy;
[X Y]=meshgrid(x,y);
maskp=zeros(size(X));
mask=zeros(size(X));
zr=zeros(size(X));
z_phy=zeros(size(X));
eta=zeros(size(X));
z_top=zeros(size(X));
z_bottom=zeros(size(X));
u_bottom=zeros(size(X));
v_bottom=zeros(size(X));
a_x=zeros(size(X));
a_y=zeros(size(X));


fid=fopen('mask3d_data.txt','w','n');

fprintf(fid,'%s\n','mask data');

dt=0.1;
speed=1.0;
total_time=20.0;

for kt=1:1:floor(total_time/dt);
time=(kt-1)*dt;
w=0.0;
a_w=0.0;
u_bottom(:,:)=0.0;
v_bottom(:,:)=0.0;
imask=floor(speed*time/dx)+10;

mask(:,:)=0;
icount=0;
for j=23:27
for i=min(m,imask+1):min(m,imask+4)
icount=icount+1;
mask(j,i)=1;
u_bottom(j,i)=speed;
v_bottom(j,i)=0.0;
end
end
% count in
number=icount;

fprintf(fid,'%s\n','TIME');
fprintf(fid,'%.2f\n',time);
fprintf(fid,'%s',num2str(number));
fprintf(fid,'%s\n','   number of mask points');
fprintf(fid,'%s\n',' i   j  k    u      v      w    ax    ay    aw');

for j=1:n
for i=1:m
if(mask(j,i)==1)
mask_i=i;
mask_j=j;
mask_k=10;
masks=[num2str(mask_i) '  ' num2str(mask_j) ' ' num2str(mask_k)];
u(1)=u_bottom(j,i);
u(2)=v_bottom(j,i);
u(3)=w;
a(1)=a_x(j,i);
a(2)=a_y(j,i);
a(3)=a_w;
fprintf(fid, '%s',masks);
%fprintf(fid, '  %.2f',surf);
fprintf(fid, '  %.2f',u,a);
fprintf(fid,'\n');
end  % end mask
end
end

end % end time

