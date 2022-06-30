%% Surface temperature
clear
load T_and_V.mat
figure
contourf(XC,YC,T(:,:,1),[23:0.01:30],'LineStyle','none');
caxis([23 30]);
hold on 
contour(XC(:,1),YC(1,:),-D',[1 1]*0,'w');
hold off
shading flat;
set(gca,'fontsize',18);
xlabel('Longitude')
ylabel('Latitude')
colorbar
colormap("turbo");
set(gcf,'Units', 'centimeters','Position',[1 1 24 32])

%% Surface Velocity
figure
contourf(XC,YC,velocity(:,:,1),[0:0.01:1],'LineStyle','none');
caxis([0 1]);
hold on 
contour(XC(:,1),YC(1,:),-D',[1 1]*0,'w');
hold off
shading flat;
set(gca,'fontsize',18);
xlabel('Longitude')
ylabel('Latitude')
colorbar
ax=gca;
load('Red','red_colormap')
colormap(ax,red_colormap);
drawnow;
set(gcf,'Units', 'centimeters','Position',[1 1 24 32])

%% Depth profile
clear
load depth.mat
figure
plot(Draw_Lx.*1e3,Draw_y,'k');%Lombok Strait
hold on
plot(Draw_Fx.*1e3,Draw_y,'g');%Sape Strait
hold on
plot(Draw_Ox.*1e3,Draw_y,'r');%Ombai Strait
hold on;
plot(Draw_Tx.*1e3,Draw_y,'b');%Timor Passage
hold on
plot(Draw_Sx.*1e3,Draw_y,'k');%Sangihe
hold on
plot(Draw_Mx.*1e3,Draw_y,'k--');%Makassar Strait
hold on
plot(Draw_Bx.*1e3,Draw_y,'g--');%Maluku Sea
hold on
plot(Draw_Hx.*1e3,Draw_y,'r--');%Halmahera Sea
hold on;
xlabel('Eddy energy Flux, (MW/m)');
ylabel('Depth (m)')
legend('Lombok Strait','Sape Strait','Ombai Strait','Timor Passage','Sulawesi Sea','Makassar Strait','Maluku Sea','Halmahera Sea')
title('Eddy energy Flux')
axis([-6 14 -300 0])

%% Radiative Flux
clear
load radiative_flux.mat
load Red.mat
figure
contourf(XC,YC,log10(IFT),[-0.5:0.2:1.5],'LineStyle','none');
colorbar;
caxis([-0.5 1.5])
ax=gca;
load('Red','red_colormap')
colormap(ax,red_colormap)
hold on
[x,y]=meshgrid(0:1:300);
ii=3:9:800;
jj=3:9:600;
quiver(XC(ii,jj)', YC(ii,jj)', IFU(ii,jj)',IFV(ii,jj)',10,"k");
hold on 
contour(XC(:,1),YC(1,:),-D',[1 1]*0,'K');
hold off
shading flat;
set(gca,'fontsize',18);
xlabel('Longitude')
ylabel('Latitude')

%% Advective Flux
clear
load advective_flux.mat
load Red.mat
figure
contourf(XC,YC,log10(AF),[-2:0.2:1],'LineStyle','none');
caxis([-2 1]);
colorbar
ax=gca;
load('Red','red_colormap')  
colormap(ax,red_colormap);
hold on
[x,y]=meshgrid(0:1:300);
ii=3:9:800;
jj=3:9:600;
quiver(XC(ii,jj)',YC(ii,jj)',DHX(ii,jj)',DSY(ii,jj)',10,"k");
hold on 
contour(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
hold off
set(gca,'fontsize',18);
hold off
xlabel('Longitude')
ylabel('Latitude')

%% Divergence of eddy energy flux
clear
load divergence.mat
load blue_red_saturated.mat
figure
pcolor(XC,YC,DEF);% plot divergence
shading flat
caxis([-1 1]*2e-2);
colorbar;
colormap(map)
hold on 
contour(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
hold off
xlabel('Longitude')
ylabel('Latitude')
set(gca,'fontsize',18);