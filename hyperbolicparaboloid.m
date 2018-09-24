a = 25;
b = 40;
numElements = 30;

x = linspace(-2*a, 2*a, numElements);
y = linspace(-2*b, 2*b, numElements);

[X, Y] = meshgrid(x, y);

z = X.^2 / a^2 - Y.^2 / b^2;
z = reshape(z, [], length(y));

surf(z);
axis off;
colormap hot;
%grid on;