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
%
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



