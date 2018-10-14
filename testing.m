clear all;
clc;

% X = [1 4; 8 9];
% Y = [2 3; 4 5];
% Z = [0.3 42; 16 8];
% 
% xlimits = minmax(X(:));
% ylimits = minmax(Y(:));
% 
% % spacing = .01;
% % xqlinear = xlimits(1):spacing:xlimits(2);
% % yqlinear = ylimits(1):spacing:ylimits(2);
% 
% [XQ, YQ] = meshgrid(xlimits:.1:ylimits);
% 
% F = scatteredInterpolant(X(:), Y(:), Z(:));
% ZQ = F(XQ, YQ);
% 
% plot3(XQ, YQ, ZQ);

xv = [0,3,0,0];
yv = [0,3,3,0];

rng default
xq = rand(500,1)*5;
yq = rand(500,1)*5;

[in,on] = inpolygon(xq,yq,xv,yv);

plot(xv,yv);
axis equal;
hold on;

plot(xq(in),yq(in),'r+');
plot(xq(~in),yq(~in),'bo');