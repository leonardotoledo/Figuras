clear
clc

%% MESH GENERATION

domain = [-5,-5;5,5];

ncol = 3;
nlines = 2;

nelem = nlines*ncol;
nnodes = (nlines+1)*(ncol+1);

%% NODE GENERATION

deltaX = (domain(2,1)-domain(1,1))/ncol;
deltaY = (domain(2,2)-domain(1,2))/nlines;

node(nnodes) = struct;

column = 1;
line = 1;

for i = 1:nnodes
    
    node(i).coordinate = [domain(1,1) domain(2,2)] + [(column-1)*deltaX -(line-1)*deltaY];
    
    % Reassembling column and line values:
    if column == ncol+1
        column = 0;
        line = line + 1;
    end
    
    column = column + 1;
end

%% ELEMENT GENERATION

column = 1;
line = 1;

for i = 1:nelem
    
    elem(i).connections = [i i+1 ncol+i+1 ncol+i+2] + (line-1) * ones(1,4);
    
    for j = 1:4
        elem(i).node(j).coordinate = node(elem(i).connections(j)).coordinate;
    end
    
    % Reassembling column and line values:
    if column == ncol
        column = 0;
        line = line + 1;
    end
    
    column = column + 1;
end