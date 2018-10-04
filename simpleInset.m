clear all
clc

x1 = linspace(0,1);
y1 = linspace(10,100);

x2 = linspace(0,1);
y2 = linspace(100,101);

figure

% plot on large axes
plot(x1,y1);

% create smaller axes in top right, and plot on it
eixo = axes('Position',[.7 .7 .2 .2]);
eixo.ColorOrder = [1 1 1; 1 1 1];

box on

plot(x2,y2);
