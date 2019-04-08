clear
clc

%% Para o texto dos nós:
afastamento = .25;

%% Quantidade de pontos:
N = 50;
step = 2/(N-1);

%% Local coordinates:
Ksi = -1:step:1;
Eta = -1:step:1;

% I - column number.
% J - row number.

%% Nodes:
Node(1,1).pos = [-1 -1 0];
Node(2,1).pos = [0 -1 0];
Node(3,1).pos = [1 -1 0];
Node(1,2).pos = [-1 0 0];
Node(2,2).pos = [0 0 0];
Node(3,2).pos = [1 0 0];
Node(1,3).pos = [-1 1 0];
Node(2,3).pos = [0 1 0];
Node(3,3).pos = [1 1 0];

%% Shape functions:
N11 = @(Ksi,Eta) .25 .* Ksi .* Eta .* (Ksi-1) .* (Eta-1);
N21 = @(Ksi,Eta) .5 .* Eta .* (1-Ksi.^2) .* (Eta-1);
N31 = @(Ksi,Eta) .25 .* Ksi .* Eta .* (Ksi+1) .* (Eta-1);
N12 = @(Ksi,Eta) .5 .* Ksi .* (1-Eta.^2) .* (Ksi-1);   
N22 = @(Ksi,Eta) (1-Ksi.^2) .* (1-Eta.^2); 
N32 = @(Ksi,Eta) .5 .* Ksi .* (1-Eta.^2) .* (Ksi+1);
N13 = @(Ksi,Eta) .25 .* Ksi .* Eta .* (Ksi-1) .* (Eta+1);
N23 = @(Ksi,Eta) .5 .* Eta .* (1-Ksi.^2) .* (Eta+1);
N33 = @(Ksi,Eta) .25 .* Ksi .* Eta .* (Ksi+1) .* (Eta+1);

pos = [Node(:).pos];

figure
hold on;

%% Plotting element:
patch([-1 1 1 -1], [-1 -1 1 1], [0 0 0 0], 'FaceColor','[.1,.6,.9]');

%% Plotting shape function:
axis equal;
plotShape(Ksi, Eta, Node, N33, '2nd','33');

%% Plotting nodes and node texts:
plot3(pos(1:3:27), pos(2:3:27), pos(3:3:27), 'ro', 'MarkerFaceColor', 'r');
text(Node(1,1).pos(1)-afastamento, Node(1,1).pos(2)-afastamento, afastamento,'11', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(2,1).pos(1), Node(2,1).pos(2)-afastamento, afastamento,'21', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(3,1).pos(1)+afastamento, Node(3,1).pos(2)-afastamento, afastamento,'31', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(1,2).pos(1)-afastamento, Node(1,2).pos(2), afastamento,'12', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(2,2).pos(1), Node(2,2).pos(2), afastamento,'22', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(3,2).pos(1)+afastamento, Node(3,2).pos(2), afastamento,'32', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(1,3).pos(1)-afastamento, Node(1,3).pos(2)+afastamento, afastamento,'13', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(2,3).pos(1), Node(2,3).pos(2)+afastamento, afastamento,'23', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(3,3).pos(1)+afastamento, Node(3,3).pos(2)+afastamento, afastamento,'33', 'Color', 'Red', 'FontWeight', 'bold');