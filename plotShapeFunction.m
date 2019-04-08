clear
clc

%% Para o texto dos nós:
afastamento = .15;

%% Quantidade de pontos:
N = 30;
step = 2/(N-1);

%% Local coordinates:
Ksi = -1:step:1;
Eta = -1:step:1;

%% Shape functions:
N1 = @(Ksi,Eta) .25 .* (1-Ksi) .* (1-Eta);
N2 = @(Ksi,Eta) .25 .* (1+Ksi) .* (1-Eta);
N3 = @(Ksi,Eta) .25 .* (1+Ksi) .* (1+Eta);
N4 = @(Ksi,Eta) .25 .* (1-Ksi) .* (1+Eta);

%% Nodes:
Node(1,:) = [-1 -1 0];
Node(2,:) = [1 -1 0];
Node(3,:) = [1 1 0];
Node(4,:) = [-1 1 0];
Node(5,:) = Node(1,:); % Usado apenas para fechar o quadrado.

figure
hold on;

%% Plotting element:
patch(Node(:,1), Node(:,2), Node(:,3), 'FaceColor','[.1,.6,.9]');

%% Plotting shape function:
axis equal;
plotShape(Ksi, Eta, Node, N4, '1st', '4');

%% Plotting nodes and node texts:
plot3(Node(:,1), Node(:,2), Node(:,3), 'ro', 'MarkerFaceColor', 'r');
text(Node(1,1)-afastamento, Node(1,2)-afastamento, afastamento,'1', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(2,1)+afastamento, Node(2,2)-afastamento, afastamento,'2', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(3,1)+afastamento, Node(3,2)+afastamento, afastamento,'3', 'Color', 'Red', 'FontWeight', 'bold');
text(Node(4,1)-afastamento, Node(4,2)+afastamento, afastamento,'4', 'Color', 'Red', 'FontWeight', 'bold');