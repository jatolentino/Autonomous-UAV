clc; clear; close all;
% depends on this function
% function [xrefp,yrefp,zrefp,xfinal,yfinal,zfinal] = Functestcontrol(initomegatotest,omegamintotest,omegamaxtotest)

pCs = plantConstants6;
m = pCs.m;
g = pCs.g;
numberMotors = 12;
ct = pCs.ct;
omegaSpeed = sqrt(m*g/(ct*12)); % yields 800
initomegatotest = omegaSpeed + 1;

omegamaxM = omegaSpeed:10:omegaSpeed + 500;
omegamaxM = omegamaxM(2:end); % not choosing the first value
omegaminM = omegaSpeed:-10:omegaSpeed - 500;
omegaminM = omegaminM(2:end); % not choosing the first value
size(omegaminM);
count = 0;
omegatotalminmax = [];
for i=1:length(omegaminM)
    for j=1:length(omegamaxM)
        omegamintotest = omegaminM(i);
        omegamaxtotest = omegamaxM(j);
        try
            [xrefp,yrefp,zrefp,xfinal,yfinal,zfinal] = Functestcontrol(initomegatotest,omegamintotest,omegamaxtotest);
            if abs(xrefp-xfinal)<10 && abs(yrefp-yfinal)<10 && abs(zrefp-zfinal)<10
                omegatotalminmax(count+1,1) = omegamintotest;
                omegatotalminmax(count+1,2) = omegamaxtotest;
                count = count+1;
            end
        catch
            
        end
    end
end
