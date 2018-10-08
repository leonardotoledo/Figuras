ne = 100;

x0 = 0;
xf = 10;
passo = (xf-x0)/ne;

[x,y] = meshgrid(x0:passo:xf);

F = sin(sqrt(x.^2+y.^2));
%imagesc(F);
%colormap hot;
%colorbar;

plot3(x,y,F);