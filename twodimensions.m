%% MESH GENERATION

ne = 1; % Number of elements.

% PLOT DATA
a = 0;
b = 3;
passo = (b-a)/100/ne;

[x,y] = meshgrid(a:passo:b); % Generating data points

% TRIANGLE ELEMENT NODES

elem(1).node{1} = [0,0];
elem(1).node{2} = [3,0];
elem(1).node{3} = [0,3];
elem(1).area = .5*((elem(1).node{2}(1) - elem(1).node{1}(1))... % (x2-x1)
                 *(elem(1).node{3}(2) - elem(1).node{1}(2))...  % *(y3-y1)
                 -(elem(1).node{3}(1) - elem(1).node{1}(1))...  % -(x3-x1)
                 *(elem(1).node{2}(2) - elem(1).node{1}(2)));   % *(y2-y1)

elem(1).N{1} = .5/elem(1).area * (elem(1).node{2}(1)*elem(1).node{3}(2)-elem(1).node{3}(1)*elem(1).node{2}(2)...
                               + (elem(1).node{2}(2)-elem(1).node{3}(2)).*x + (elem(1).node{3}(1)-elem(1).node{2}(1)).*y );
               
elem(1).N{2} = .5/elem(1).area * (elem(1).node{3}(1)*elem(1).node{1}(2)-elem(1).node{1}(1)*elem(1).node{3}(2)...
                               + (elem(1).node{3}(2)-elem(1).node{1}(2)).*x + (elem(1).node{1}(1)-elem(1).node{3}(1)).*y );
               
elem(1).N{3} = .5/elem(1).area * (elem(1).node{1}(1)*elem(1).node{2}(2)-elem(1).node{2}(1)*elem(1).node{1}(2)...
                               + (elem(1).node{1}(2)-elem(1).node{2}(2)).*x + (elem(1).node{2}(1)-elem(1).node{1}(1)).*y );


f(1) = sinefunc(elem(1).node{1}(1),elem(1).node{1}(2));
f(2) = sinefunc(elem(1).node{2}(1),elem(1).node{2}(2));
f(3) = sinefunc(elem(1).node{3}(1),elem(1).node{3}(2));

fnum = elem(1).N{1}*f(1) + elem(1).N{2}*f(2) + elem(1).N{3}*f(3);

plot3(x,y,sinefunc(x,y),'g');
hold on;
plot3(x,y,fnum,'*');