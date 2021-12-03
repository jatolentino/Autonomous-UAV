function [uavB] = thisdron()
%clc; clear; close all
% % Plot_uavBe(x1(1),y1(1),z1(1),0,0,pi,1.2)
grid on
az = pi;
scale = 1.2;       %1.2
scale=0.3*scale;   %0.3
dx=0;dy=0;dz=0; 
ax=0;
ay=0;
az=0;

Rx=[ 1, 0, 0; 0, cos(ax), -sin(ax); 0, sin(ax), cos(ax)];
Ry=[ cos(ay), 0, sin(ay); 0, 1, 0; -sin(ay), 0, cos(ay)];
Rz=[ cos(az), -sin(az), 0; sin(az), cos(az), 0; 0, 0,1];

R=1;%Rx*Ry*Rz;
% uavBody
uavBody=[
-8.524 -3.178 0;
-8.524 -1.575 0;
-23.622 -1.575 0;
-23.622 1.575 0;
-8.524 1.575 0;
-8.524 3.178 0;
-6.884 5.868 0;
-1.575 8.933 0;
-1.575 23.622 0;
1.575 23.622 0;
1.575 8.933 0;
6.884 5.868 0;
8.524 3.178 0;
8.524 1.575 0;
23.622 1.575 0;
23.622 -1.575 0;
%
8.524 -1.575 0;
8.524 -3.178 0;
7.014 -5.793 0;
1.575 -8.933 0;
1.575 -23.622 0;
-1.575 -23.622 0;
-1.575 -8.933 0;
-7.014 -5.793 0;]*1/(3.937*3);

zb=0.2;

uavBody1=[uavBody(:,1) uavBody(:,2) uavBody(:,3)+zb];

sizeuav=1;

for k=1:length(uavBody(:,1))-1
    sp1=[uavBody(k,1) uavBody(k,2) uavBody(k,3);uavBody(k+1,1) uavBody(k+1,2) uavBody(k,3); uavBody(k+1,1) uavBody(k+1,2) uavBody1(k,3); uavBody(k,1)  uavBody(k,2) uavBody1(k,3)]*scale*R;
    uavB(k)=patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,[1 1 1]);
    if k==length(uavBody(:,1))-1
        sp1=[uavBody(length(uavBody),1) uavBody(length(uavBody),2) uavBody(k,3); uavBody(1,1) uavBody(1,2) uavBody(k,3); uavBody(1,1) uavBody(1,2) uavBody1(k,3);uavBody(length(uavBody),1) uavBody(length(uavBody),2) uavBody1(k,3)]*scale*R;
        uavB(k+1)= patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,[1 1 1]);
    end
end
sizeuav=sizeuav+k;
uavBody=uavBody*scale*R;
uavBody1=uavBody1*scale*R;
uavB(sizeuav+1)=patch(uavBody(:,1)+dx,uavBody(:,2)+dy,uavBody(:,3)+dz,[1 1 1]);
uavB(sizeuav+2)=patch(uavBody1(:,1)+dx,uavBody1(:,2)+dy,uavBody1(:,3)+dz,[1 1 1]);

%% MOTORS
sizeuav=sizeuav+2;

a=pi/10;
th=pi/4:a:2*pi+pi/4;

x=1.4142*cos(th)*0.15;
y=1.4142*sin(th)*0.15;
z=0*ones(1,length(th));

hp1=[x'+1.92 y' z'];
hp2=[x'-1.92 y' z'];
hp3=[x' y'-2 z'];
hp4=[x' y'+2 z'];

zb=0.21;
for k=1:length(hp1)-1  % IZQUIERDA
    sp1=[hp1(k,1) hp1(k,2) 0;hp1(k+1,1) hp1(k+1,2) 0; hp1(k+1,1) hp1(k+1,2) zb; hp1(k,1)  hp1(k,2) zb]*scale*R;
  uavB(sizeuav+k)=patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,'k');
if k==length(hp1)-1
    sp1=[hp1(length(hp1),1) hp1(length(hp1),2) 0; hp1(1,1) hp1(1,2) 0; hp1(1,1) hp1(1,2) zb;hp1(length(hp1),1) hp1(length(hp1),2) zb]*scale*R;
  uavB(sizeuav+k+1)=patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,'k');
end
end
sizeuav=sizeuav+k+1;
for k=1:length(hp2)-1  % DERECHA
    sp1=[hp2(k,1) hp2(k,2) 0;hp2(k+1,1) hp2(k+1,2) 0; hp2(k+1,1) hp2(k+1,2) zb; hp2(k,1)  hp2(k,2) zb]*scale*R;
  uavB(sizeuav+k)=patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,'k');
if k==length(hp2)-1
    sp1=[hp2(length(hp2)) hp2(length(hp2),2) 0; hp2(1,1) hp2(1,2) 0; hp2(1,1) hp2(1,2) zb;hp2(length(hp2),1) hp2(length(hp2),2) zb]*scale*R;
  uavB(sizeuav+k+1)=patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,'k');
end
end
sizeuav=sizeuav+k+1;

for k=1:length(hp3)-1
    sp1=[hp3(k,1) hp3(k,2) 0;hp3(k+1,1) hp3(k+1,2) 0; hp3(k+1,1) hp3(k+1,2) zb; hp3(k,1)  hp3(k,2) zb]*scale*R;
  uavB(sizeuav+k)=patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,'k');
if k==length(hp3)-1
    sp1=[hp3(length(hp3)) hp3(length(hp3),2) 0; hp3(1,1) hp3(1,2) 0; hp3(1,1) hp3(1,2) zb;hp3(length(hp3),1) hp3(length(hp3),2) zb]*scale*R;
   uavB(sizeuav+k+1)= patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,'k');
end
end
sizeuav=sizeuav+k+1;
for k=1:length(hp4)-1
    sp1=[hp4(k,1) hp4(k,2) 0;hp4(k+1,1) hp4(k+1,2) 0; hp4(k+1,1) hp4(k+1,2) zb; hp4(k,1)  hp4(k,2) zb]*scale*R;
  uavB(sizeuav+k)=patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,'k');
if k==length(hp4)-1
    sp1=[hp4(length(hp4)) hp4(length(hp4),2) 0; hp4(1,1) hp4(1,2) 0; hp4(1,1) hp4(1,2) zb;hp4(length(hp4),1) hp4(length(hp4),2) zb]*scale*R;
   uavB(sizeuav+k+1)= patch(sp1(:,1)+dx,sp1(:,2)+dy,sp1(:,3)+dz,'k');
end
end

sizeuav=sizeuav+k+1;


hp1=hp1*scale*R;
hp2=hp2*scale*R;
hp3=hp3*scale*R;
hp4=hp4*scale*R;

zb = 0.21*scale;
% 
uavB(sizeuav+1)=patch(hp1(:,1)+dx,hp1(:,2)+dy,hp1(:,3)+dz,'k');
uavB(sizeuav+2)=patch(hp2(:,1)+dx,hp2(:,2)+dy,hp2(:,3)+dz,'k');
uavB(sizeuav+3)=patch(hp3(:,1)+dx,hp3(:,2)+dy,hp3(:,3)+dz,'k');
uavB(sizeuav+4)=patch(hp4(:,1)+dx,hp4(:,2)+dy,hp4(:,3)+dz,'k');

uavB(sizeuav+5)=patch(hp1(:,1)+dx,hp1(:,2)+dy,hp1(:,3)+zb+dz,'k');
uavB(sizeuav+6)=patch(hp2(:,1)+dx,hp2(:,2)+dy,hp2(:,3)+zb+dz,'k');
uavB(sizeuav+7)=patch(hp3(:,1)+dx,hp3(:,2)+dy,hp3(:,3)+zb+dz,'k');
uavB(sizeuav+8)=patch(hp4(,1)+dx,hp4(:,2)+dy,hp4(:,3)+zb+dz,'k');
