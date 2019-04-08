function plotShape(Ksi, Eta, Node, N, orderLabel, nodeLabel)

for i = 1:length(Ksi)
    for j = 1:length(Eta)
        K = Ksi(i);
        E = Eta(j);
        plot3(K, E, N(K,E), 'ko', 'MarkerFaceColor','[.25,.25,.25]');
    end
end

if orderLabel == '1st'
    switch nodeLabel
        case '1'
            plot3([Node(1,1) -1], [Node(1,2) -1], [Node(1,3) 1], 'k--');
        case '2'
            plot3([Node(2,1) 1], [Node(2,2) -1], [Node(2,3) 1], 'k--');
        case '3'
            plot3([Node(3,1) 1], [Node(3,2) 1], [Node(3,3) 1], 'k--');
        case '4'
            plot3([Node(4,1) -1], [Node(4,2) 1], [Node(4,3) 1], 'k--');
        otherwise
            error('You selected an invalid node.');
    end
else
    switch nodeLabel
        case '11'
            plot3([Node(1,1).pos(1) Node(1,1).pos(1)], [Node(1,1).pos(2) Node(1,1).pos(2)], [Node(1,1).pos(3) 1], 'k--');
        case '21'
            plot3([Node(2,1).pos(1) Node(2,1).pos(1)], [Node(2,1).pos(2) Node(2,1).pos(2)], [Node(2,1).pos(3) 1], 'k--');
        case '31'
            plot3([Node(3,1).pos(1) Node(3,1).pos(1)], [Node(3,1).pos(2) Node(3,1).pos(2)], [Node(3,1).pos(3) 1], 'k--');
        case '12'
            plot3([Node(1,2).pos(1) Node(1,2).pos(1)], [Node(1,2).pos(2) Node(1,2).pos(2)], [Node(1,2).pos(3) 1], 'k--');
        case '22'
            plot3([Node(2,2).pos(1) Node(2,2).pos(1)], [Node(2,2).pos(2) Node(2,2).pos(2)], [Node(2,2).pos(3) 1], 'k--');
        case '32'
            plot3([Node(3,2).pos(1) Node(3,2).pos(1)], [Node(3,2).pos(2) Node(3,2).pos(2)], [Node(3,2).pos(3) 1], 'k--');
        case '13'
            plot3([Node(1,3).pos(1) Node(1,3).pos(1)], [Node(1,3).pos(2) Node(1,3).pos(2)], [Node(1,3).pos(3) 1], 'k--');
        case '23'
            plot3([Node(2,3).pos(1) Node(2,3).pos(1)], [Node(2,3).pos(2) Node(2,3).pos(2)], [Node(2,3).pos(3) 1], 'k--');
        case '33'
            plot3([Node(3,3).pos(1) Node(3,3).pos(1)], [Node(3,3).pos(2) Node(3,3).pos(2)], [Node(3,3).pos(3) 1], 'k--');
        otherwise
            error('You selected an invalid node.');
    end
end