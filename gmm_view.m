% %number of samples
noise_samples=1000;
rx = 1;
ry = 2;
rz = 3;
vx = 4;
vy = 5;
vz = 6;
R = 1;

%multi-modal distribution
posx = pearsrnd(0.7,1.5,0.3,1.7,noise_samples, 1);
posy = pearsrnd(-2,4,0.3,1.5,noise_samples,1);
posz = pearsrnd(-0.5,3,0.3,1.5,noise_samples,1);
[f0,x0]=ksdensity(posx);
[f1,x1]=ksdensity(posy);
[f2,x2]=ksdensity(posz);
figure(1);
plot(x0,f0,x1,f1,x2,f2,'LineWidth',2);
legend('x-direction','y-direction','z-direction');
saveas(gcf, ['', num2str(1,'%04.f'), '.png']);

% pos1x = pearsrnd(0.2,1,0.3,1.5,noise_samples,1);
% pos1y = pearsrnd(0.2,1.5,0.3,1.5,noise_samples,1);
% pos1z = pearsrnd(1,1,0.3,1.5,noise_samples,1);
% [f0,x0]=ksdensity(pos1x);
% [f1,x1]=ksdensity(pos1y);
% [f2,x2]=ksdensity(pos1z);
% figure(1);
% plot(x0,f0,x1,f1,x2,f2,'LineWidth',2);
% legend('x-direction','y-direction','z-direction');
% saveas(gcf, ['', num2str(2,'%04.f'), '.png']);

% [f0,x0]=ksdensity(posz);
% [f1,x1]=ksdensity(pos1z);
% figure(1);
% plot(x0,f0,x1,f1,'LineWidth',2);
% legend('control','state');
% saveas(gcf, ['', num2str(3,'%04.f'), '.png']);

%pd =  posx.^2 + pos1x.^2 + posy.^2 + pos1y.^2 + posz.^2 + pos1z.^2;
% pd = ((rx+posx).*(vx+pos1x) + (ry+posy).*(vy+pos1y) + (rz+posz).*(vz+pos1z)).^2 + ... 
%          (R^2 - ( (rx+posx).^2 + (ry+posy).^2 + (rz+posz).^2 )).*( (vx+pos1x).^2 + (vy+pos1y).^2 + (vz+pos1z).^2 ); 
% [f1,x1]=ksdensity(pd);
% figure(2);
% plot(x1,f1,'LineWidth',2);
% legend('collision cone distribution');
% saveas(gcf, ['', num2str(4,'%04.f'), '.png']);


