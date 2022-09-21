%% Fig 1 - Surface Temeperature
clear

load T_and_V.mat

T(T==0) = NaN;

figure

fa = [108 138 -14 8.5];

pcolor(XC,YC,T(:,:,10));
shading flat;
clb = colorbar;
clb.Label.String = 'Temperature (^oC)';
caxis([25 30]);
colormap(turbo);

hold on

[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.8);

lw = 1;
line([115 116.5],[-8.6 -8.6],'color','k','linewidth',lw) % Lombok
line([118.7 120],[-8.74 -8.74],'color','k','linewidth',lw) % Flore
line([125 125],[-8.3 -9.2],'color','k','linewidth',lw) % Ombai
line([127 127],[-8.5 -14],'color','k','linewidth',lw) % Timor
line([117.6 120.3],[0.66 0.66],'color','k','linewidth',lw) % Makassar

line([125 125],[6 1.5],'color','k','linewidth',lw) % Sulawesi
line([125 127.7],[1.62 1.62],'color','k','linewidth',lw) % Maluku
line([127.9 131],[0 0],'color','k','linewidth',lw) %Halmahera


hold off

axis equal;
axis(fa);

set(gca,'fontsize',16,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);
set(clb,'Ticks',[25:30]);


text(129,7.5,'Pacific Ocean','fontsize',16);
text(109,-12.5,'Indian Ocean','fontsize',16);
text(125,-6,'Banda Sea','fontsize',12);
text(119,3.5,'Sulawesi Sea','fontsize',12);
text(116.5,0,'Makassar Strait','fontsize',12);
text(127,-2.2,'Halmahera Sea','fontsize',12);
text(123,-0.2,'Maluku Sea','fontsize',12);
text(131.5,-13,'Australia','fontsize',16);
text(111,0,'Kalimantan','fontsize',16);
text(110.5,-7.5,'Java','fontsize',16);

text(114,-8,'Lombok Strait','fontsize',10);
text(118.2,-8,'Sape Strait','fontsize',10);
text(123.3,-7.5,'Ombai Strait','fontsize',10);
text(126.5,-10.2,'Timor Passage','fontsize',10);


set(gcf,'PaperPositionMode','auto','InvertHardcopy','off','color','w');


%% Fig 2 - Radiative energy fluxes
clear

load radiative_flux.mat
load Red.mat

figure

fa = [108 138 -14 8.5];
ca = [log10(0.3):0.1:log10(30)];
bs = 10;
sc = 0.1;

% subplot(2,1,1);

contourf(XC,YC,log10(IFT),ca,'LineStyle','none');
clb = colorbar;
clb.Label.String = 'Radiative energy fluxes (kW m^−^1)';
caxis([ca(1) ca(end)])
colormap(red_colormap(3:3:end,:));

hold on

contour(XC(:,1),YC(1,:),-D',[1 1]*(-200),'color',[1 1 1]*0.3);
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.8);

quiver(blockmean(XC,bs,bs)',blockmean(YC,bs,bs)',sc*blockmean(IFU,bs,bs)',sc*blockmean(IFV,bs,bs)',0,'k');
quiver(110.5,0,sc*10,sc*0,0,'k');
text(112,0.2,'10 kW m^{-1}','fontsize',14);

text(103,8,'a','fontweight','bold','fontsize',18);
hold off

axis equal;

axis(fa);

set(gca,'fontsize',16,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);
set(clb,'Ticks',log10([0.3 1 3 10 30]),'TickLabels',['0.3';'1  ';'3  ';'10 ';'30 ']);
set(gcf,'PaperPositionMode','auto','InvertHardcopy','off','color','w');


%% Fig 3 - Advective energy fluxes
%clear

load advective_flux.mat
load Red.mat

%figure
% subplot(2,1,2);
figure
contourf(XC,YC,log10(AF),ca,'LineStyle','none');
clb = colorbar;
clb.Label.String = 'Advective energy fluxes (kW m^−^1)';
caxis([ca(1) ca(end)])
colormap(red_colormap(3:3:end,:));

hold on

contour(XC(:,1),YC(1,:),-D',[1 1]*(-200),'color',[1 1 1]*0.3);
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.8);

quiver(blockmean(XC,bs,bs)',blockmean(YC,bs,bs)',sc*blockmean(1e-3*DHX,bs,bs)',sc*blockmean(1e-3*DSY,bs,bs)',0,'k');
quiver(110.5,0,sc*10,sc*0,0,'k');
text(112,0.2,'10 kW m^{-1}','fontsize',14);

text(103,8,'b','fontweight','bold','fontsize',18);
hold off

axis equal;
axis(fa);

set(gca,'fontsize',16,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);
set(clb,'Ticks',log10([0.3 1 3 10 30]),'TickLabels',['0.3';'1  ';'3  ';'10 ';'30 ']);

set(gcf,'PaperPositionMode','auto','InvertHardcopy','off','color','w');

%% Fig 3 - Divergence of eddy energy flux
clear

load radiative_divergence.mat
load blue_red_saturated.mat

figure

fa = [108 138 -14 8.5];
ca = [-30:5:30];

pcolor(XC(2:end-1,2:end-1),YC(2:end-1,2:end-1),runmean(DEF,3,3,0)*1e+3);
shading flat;
clb = colorbar;
clb.Label.String = 'Divergence of eddy energy fluxes (mW m^{−2})';
caxis([ca(1) ca(end)])
colormap(map);

hold on

contour(XC(:,1),YC(1,:),-D',[1 1]*(-200),'color',[1 1 1]*0.3);
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.8);

hold off

axis equal;
axis(fa);

set(gca,'fontsize',16,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);
%set(clb,'Ticks',log10([0.3 1 3 10 30]),'TickLabels',['0.3';'1  ';'3  ';'10 ';'30 ']);

set(gcf,'PaperPositionMode','auto','InvertHardcopy','off','color','w');

%% Fig 4 - Depth profiles
clear

load depth.mat

clr_r = [200   0   0]/255;
clr_g = [  0 128   0]/255;
clr_b = [  0 128 255]/255;
clr_o = [255 128   0]/255;

lw = 4;

figure
hold on

plot(1e+3*Draw_Lx,Draw_y,'linestyle','-','linewidth',lw,'color',clr_o);%Lombok Strait
plot(1e+3*Draw_Fx,Draw_y,'linestyle','-','linewidth',lw,'color',clr_g);%Sape Strait
plot(1e+3*Draw_Ox,Draw_y,'linestyle','-','linewidth',lw,'color',clr_r);%Ombai Strait
plot(1e+3*Draw_Tx,Draw_y,'linestyle','-','linewidth',lw,'color',clr_b);%Timor Passage

plot(1e+3*Draw_Sx,Draw_y,'linestyle','-.','linewidth',lw,'color',clr_o);%Sulawesi Sea
plot(1e+3*Draw_Mx,Draw_y,'linestyle','-.','linewidth',lw,'color',clr_g);%Makassar Strait
plot(1e+3*Draw_Bx,Draw_y,'linestyle','-.','linewidth',lw,'color',clr_r);%Maluku Sea
plot(1e+3*Draw_Hx,Draw_y,'linestyle','-.','linewidth',lw,'color',clr_b);%Halmahera Sea

hold off;

ylim([-300 0]);
xlim([-6 14]);

set(gca,'fontsize',16,'Layer','top','box','on');

xlabel('Eddy energy flux (MW m^{-1})');
ylabel('Depth (m)')
lg = legend('Lombok Strait','Sape Strait','Ombai Strait','Timor Passage','Sulawesi Sea','Makassar Strait','Maluku Sea','Halmahera Sea');
set(lg,'Location','SouthEast','fontsize',18);

set(gcf,'PaperPositionMode','auto','InvertHardcopy','off','color','w');
print -depsc2 -r300 ~/Desktop/fig4_profiles.eps
