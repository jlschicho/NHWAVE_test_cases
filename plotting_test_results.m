clear all;
close all;
clc;

x = 0:0.2:299.8;
y = 0:0.2:99.8;



for i = 45
  
  if i<10
    eval(['eta',num2str(i),' = load(["./output/eta_000',num2str(i),'"]);'])
  elseif i<100
    eval(['eta',num2str(i),' = load(["./output/eta_00',num2str(i),'"]);'])
  else
    eval(['eta',num2str(i),' = load(["./output/eta_0',num2str(i),'"]);'])
  end
end
figure(1)

for i= 45
  eval(['eta = eta',num2str(i),';']) 

  [contours, fig(i)] = contourf(x,y,eta);
  colorbar;
  axis equal;
  caxis([-0.1 0.1])
  %axis([100 200 0 100])
  pause(0.1)
  
  if i<10
    filename = ['testing_fig00',num2str(i),'.jpg'];
  elseif i<100
    filename = ['testing_fig0',num2str(i),'.jpg'];
  else
    filename = ['testing_fig',num2str(i),'.jpg'];
  end
  
  
  saveas(fig(i),filename);
  
end


dep = load(['./output/depth']);

i_loc = 11:1:15;
j_loc = 23:1:27;

[all_i, all_j] = meshgrid(i_loc,j_loc);

all_k = -10*ones(5,5)

figure(2)
surf(x,y,-dep)
axis([0 300 -150 150 -31 0])
hold on;
plot3(all_i, all_j,all_k,'r*')
