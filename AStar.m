% 2017-05-7:
% add up-left, up-right, down-left, down-right when extanding next node
% also considering the boundry

% showResult=0, draw extanding process
% showResult=1, draw extended result
% showResult=2, do draw anything
function [route,numExpanded] = AStar(input_map, start_coords, dest_coords,showResult)
% Run A* algorithm on a grid.
% Inputs : 
%   input_map : a logical array where the freespace cells are false or 0 and
%   the obstacles are true or 1
%   start_coords and dest_coords : Coordinates of the start and end cell
%   respectively, the first entry is the row and the second the column.
% Output :
%    route : An array containing the linear indices of the cells along the
%    shortest route from start to dest or an empty array if there is no
%    route. This is a single dimensional vector
%    numExpanded: Remember to also return the total number of nodes
%    expanded during your search. Do not count the goal node as an expanded node. 

% set up color map for display
% 1 - white - clear cell
% 2 - black - obstacle
% 3 - red = visited
% 4 - blue  - on list
% 5 - green - start
% 6 - yellow - destination

cmap = [1 1 1; 0 0 0; 1 0 0; 0 0 1;0 1 0;1 1 0;0.5 0.5 0.5];
colormap(cmap);

% variable to control if the map is being visualized on every iteration
[nrows, ncols] = size(input_map);
parent = zeros(nrows,ncols);

% map - a table that keeps track of the state of each grid cell
map = zeros(nrows,ncols);
map(~input_map) = 1;   % Mark free cells
map(~~input_map)  = 2;   % Mark obstacle cells
map(start_coords(1),start_coords(2)) = 5;
map(dest_coords(1),dest_coords(2))  = 6;

% Generate linear indices of start and dest nodes
start_node = sub2ind(size(map), start_coords(1), start_coords(2));
dest_node  = sub2ind(size(map), dest_coords(1),  dest_coords(2));

% meshgrid will `replicate grid vectors' nrows and ncols to produce a full grid
% type `help meshgrid' in the Matlab command prompt for more information
% [X, Y] = meshgrid (1:ncols, 1:nrows);
[X, Y] = meshgrid (1:nrows, 1:ncols);

% Evaluate Heuristic function, H, for each grid cellÆô·¢Ê½º¯Êý
% Manhattan distance value from current to destination
%H = abs(X - dest_coords(1)) + abs(Y - dest_coords(2));
% H = H';
H = sqrt((X - dest_coords(1)).^2 + (Y - dest_coords(2)).^2);
H = H';
% Initialize cost arrays
f = Inf(nrows,ncols);
g = Inf(nrows,ncols);

g(start_coords(1),start_coords(2)) = 0;          %value from start to current
f(start_coords(1),start_coords(2)) = H(start_coords(1),start_coords(2));

% keep track of the number of nodes that are expanded
numExpanded = 0;

% Main Loop
while true
    
    % Draw current map
    map(start_node) = 5;
    map(dest_node) = 6;
    
    % make drawMapEveryTime = true if you want to see how the 
    % nodes are expanded on the grid. 
    if (showResult==0)
        image(1.5, 1.5, map);
        grid on;
        axis image;
        drawnow;
    end
    
    % Find the node with the minimum f value
    [min_f, current_node] = min(f(:));
    % Compute row, column coordinates of current node
    [current(1), current(2)] = ind2sub(size(f), current_node);
    if ((current_node == dest_node) || isinf(min_f))
        break;
    end
    
    % Update input_map
    map(current(1),current(2)) = 3;
    f(current(1),current(2)) = Inf; % remove this node from further consideration
  
    % *********************************************************************
    % ALL YOUR CODE BETWEEN THESE LINES OF STARS
    % Visit all of the neighbors around the current node and update the
    % entries in the map, f, g and parent arrays

    %? Whether the node is part of an obstacle
	%If the node is in freespace,
    %? Whether or not it has been visited
    %? Is currently on the list of nodes being considered.
    
    %left up     
    if(current(1)<nrows+1 && current(1)-1>0 && current(2)-1>0 && current(2)<ncols+1)
        upLeftNeighbor(1) = current(1)-1;
        upLeftNeighbor(2) = current(2)-1;
        colorUp=map(upLeftNeighbor(1),upLeftNeighbor(2));
        if(colorUp==6)
            g(upLeftNeighbor(1),upLeftNeighbor(2))= g(current(1),current(2))+sqrt(2);
            f(upLeftNeighbor(1),upLeftNeighbor(2)) =g(upLeftNeighbor(1),upLeftNeighbor(2))+ H(upLeftNeighbor(1),upLeftNeighbor(2));
            numExpanded = numExpanded+1;
            parent(nrows*(upLeftNeighbor(2)-1)+upLeftNeighbor(1))=nrows*(current(2)-1)+current(1);
            break;
        % not visited and not obstacles, 2=obstacle,3=visited
        elseif(f(upLeftNeighbor(1),upLeftNeighbor(2))==Inf && colorUp~=2 && colorUp~=3)
            g(upLeftNeighbor(1),upLeftNeighbor(2))= g(current(1),current(2))+sqrt(2);
            f(upLeftNeighbor(1),upLeftNeighbor(2)) =g(upLeftNeighbor(1),upLeftNeighbor(2))+ H(upLeftNeighbor(1),upLeftNeighbor(2));
            map(upLeftNeighbor(1),upLeftNeighbor(2))=4;%on list
            numExpanded = numExpanded+1;   
            parent(nrows*(upLeftNeighbor(2)-1)+upLeftNeighbor(1))=nrows*(current(2)-1)+current(1);
        end
    end
    
    % right dowm
    if(current(1)+1<nrows+1 && current(1)>0 && current(2)>0 && current(2)+1<ncols+1)
        rightDownNeighbor(1) = current(1)+1;
        rightDownNeighbor(2) = current(2)+1;
        colorDown=map(rightDownNeighbor(1),rightDownNeighbor(2));
        if(colorDown==6)
            g(rightDownNeighbor(1),rightDownNeighbor(2))= g(current(1),current(2))+sqrt(2);
            f(rightDownNeighbor(1),rightDownNeighbor(2)) =g(rightDownNeighbor(1),rightDownNeighbor(2))+ H(rightDownNeighbor(1),rightDownNeighbor(2));
            numExpanded = numExpanded+1;   
            parent(nrows*(rightDownNeighbor(2)-1)+rightDownNeighbor(1))=nrows*(current(2)-1)+current(1);
            break;
        %not visited and not obstacles£¬2=obstacle,3=visited
        elseif(f(rightDownNeighbor(1),rightDownNeighbor(2))==Inf && colorDown~=2 && colorDown~=3)
            g(rightDownNeighbor(1),rightDownNeighbor(2))= g(current(1),current(2))+sqrt(2);
            f(rightDownNeighbor(1),rightDownNeighbor(2)) =g(rightDownNeighbor(1),rightDownNeighbor(2))+ H(rightDownNeighbor(1),rightDownNeighbor(2));
            map(rightDownNeighbor(1),rightDownNeighbor(2))=4;%on list
            numExpanded = numExpanded+1;   
            parent(nrows*(rightDownNeighbor(2)-1)+rightDownNeighbor(1))=nrows*(current(2)-1)+current(1);
        end
    end
    % left down
    if(current(1)+1<nrows+1 && current(1)>0 && current(2)-1>0 && current(2)<ncols+1)
        leftDownNeighbor(1) = current(1)+1;
        leftDownNeighbor(2) = current(2)-1;
        colorLeft=map(leftDownNeighbor(1),leftDownNeighbor(2));
        if(colorLeft==6)
            g(leftDownNeighbor(1),leftDownNeighbor(2))= g(current(1),current(2))+sqrt(2);
            f(leftDownNeighbor(1),leftDownNeighbor(2)) =g(leftDownNeighbor(1),leftDownNeighbor(2))+ H(leftDownNeighbor(1),leftDownNeighbor(2));
            numExpanded = numExpanded+1;   
            parent(nrows*(leftDownNeighbor(2)-1)+leftDownNeighbor(1))=nrows*(current(2)-1)+current(1);
            break;
        % not visited and not obstacles£¬2=obstacle,3=visited
        elseif(f(leftDownNeighbor(1),leftDownNeighbor(2))==Inf && colorLeft~=2 && colorLeft~=3)
            g(leftDownNeighbor(1),leftDownNeighbor(2))= g(current(1),current(2))+sqrt(2);
            f(leftDownNeighbor(1),leftDownNeighbor(2)) =g(leftDownNeighbor(1),leftDownNeighbor(2))+ H(leftDownNeighbor(1),leftDownNeighbor(2));
            map(leftDownNeighbor(1),leftDownNeighbor(2))=4;%on list
            numExpanded = numExpanded+1;   
            parent(nrows*(leftDownNeighbor(2)-1)+leftDownNeighbor(1))=nrows*(current(2)-1)+current(1);
        end
    end
    
    % right up
    if(current(1)<nrows+1 && current(1)-1>0 && current(2)>0 && current(2)+1<ncols+1)
        rightUpNeighbor(1) = current(1)-1;
        rightUpNeighbor(2) = current(2)+1;
        colorRight=map(rightUpNeighbor(1),rightUpNeighbor(2));
        if(colorRight==6)
            g(rightUpNeighbor(1),rightUpNeighbor(2))= g(current(1),current(2))+sqrt(2);
            f(rightUpNeighbor(1),rightUpNeighbor(2)) =g(rightUpNeighbor(1),rightUpNeighbor(2))+ H(rightUpNeighbor(1),rightUpNeighbor(2));
            numExpanded = numExpanded+1;   
            parent(nrows*(rightUpNeighbor(2)-1)+rightUpNeighbor(1))=nrows*(current(2)-1)+current(1);
            break;
        % not visited and not obstcles£¬2=obstacle,3=visited
        elseif(f(rightUpNeighbor(1),rightUpNeighbor(2))==Inf && colorRight~=2 && colorRight~=3)
            g(rightUpNeighbor(1),rightUpNeighbor(2))= g(current(1),current(2))+sqrt(2);
            f(rightUpNeighbor(1),rightUpNeighbor(2)) =g(rightUpNeighbor(1),rightUpNeighbor(2))+ H(rightUpNeighbor(1),rightUpNeighbor(2));
            map(rightUpNeighbor(1),rightUpNeighbor(2)) = 4;%on list
            numExpanded = numExpanded+1;   
            parent(nrows*(rightUpNeighbor(2)-1)+rightUpNeighbor(1))=nrows*(current(2)-1)+current(1);
        end
    end
      
    %up
    if(current(1)<nrows+1 && current(1)-1>0 && current(2)>0 && current(2)<ncols+1)
        upNeighbor(1) = current(1)-1;
        upNeighbor(2) = current(2);
        colorUp=map(upNeighbor(1),upNeighbor(2));
        if(colorUp==6)
            g(upNeighbor(1),upNeighbor(2))= g(current(1),current(2))+1;
            f(upNeighbor(1),upNeighbor(2)) =g(upNeighbor(1),upNeighbor(2))+ H(upNeighbor(1),upNeighbor(2));
            numExpanded = numExpanded+1;
            parent(nrows*(upNeighbor(2)-1)+upNeighbor(1))=nrows*(current(2)-1)+current(1);
            break;
        % not visited and not obstcales£¬2=obstacle,3=visited
        elseif(f(upNeighbor(1),upNeighbor(2))==Inf && colorUp~=2 && colorUp~=3)
            g(upNeighbor(1),upNeighbor(2))= g(current(1),current(2))+1;
            f(upNeighbor(1),upNeighbor(2)) =g(upNeighbor(1),upNeighbor(2))+ H(upNeighbor(1),upNeighbor(2));
            map(upNeighbor(1),upNeighbor(2))=4;%on list
            numExpanded = numExpanded+1;  
            parent(nrows*(upNeighbor(2)-1)+upNeighbor(1))=nrows*(current(2)-1)+current(1);
        end
    end
    %dowm
    if(current(1)+1<nrows+1 && current(1)>0 && current(2)>0 && current(2)<ncols+1)
        downNeighbor(1) = current(1)+1;
        downNeighbor(2) = current(2);
        colorDown=map(downNeighbor(1),downNeighbor(2));
        if(colorDown==6)
            g(downNeighbor(1),downNeighbor(2))= g(current(1),current(2))+1;
            f(downNeighbor(1),downNeighbor(2)) =g(downNeighbor(1),downNeighbor(2))+ H(downNeighbor(1),downNeighbor(2));
            numExpanded = numExpanded+1;   
            parent(nrows*(downNeighbor(2)-1)+downNeighbor(1))=nrows*(current(2)-1)+current(1);
            break;
        % not visited and not obstacles£¬2=obstacle,3=visited
        elseif(f(downNeighbor(1),downNeighbor(2))==Inf && colorDown~=2 && colorDown~=3)
            g(downNeighbor(1),downNeighbor(2))= g(current(1),current(2))+1;
            f(downNeighbor(1),downNeighbor(2)) =g(downNeighbor(1),downNeighbor(2))+ H(downNeighbor(1),downNeighbor(2));
            map(downNeighbor(1),downNeighbor(2))=4;%on list
            numExpanded = numExpanded+1;   
            parent(nrows*(downNeighbor(2)-1)+downNeighbor(1))=nrows*(current(2)-1)+current(1);
        end
    end
    %left
    if(current(1)<nrows+1 && current(1)>0 && current(2)-1>0 && current(2)<ncols+1)
        leftNeighbor(1) = current(1);
        leftNeighbor(2) = current(2)-1;
        colorLeft=map(leftNeighbor(1),leftNeighbor(2));
        if(colorLeft==6)
            g(leftNeighbor(1),leftNeighbor(2))= g(current(1),current(2))+1;
            f(leftNeighbor(1),leftNeighbor(2)) =g(leftNeighbor(1),leftNeighbor(2))+ H(leftNeighbor(1),leftNeighbor(2));
            numExpanded = numExpanded+1;   
            parent(nrows*(leftNeighbor(2)-1)+leftNeighbor(1))=nrows*(current(2)-1)+current(1);
            break;
        % not visited and not obstacles£¬2=obstacle,3=visited
        elseif(f(leftNeighbor(1),leftNeighbor(2))==Inf && colorLeft~=2 && colorLeft~=3)
            g(leftNeighbor(1),leftNeighbor(2))= g(current(1),current(2))+1;
            f(leftNeighbor(1),leftNeighbor(2)) =g(leftNeighbor(1),leftNeighbor(2))+ H(leftNeighbor(1),leftNeighbor(2));
            map(leftNeighbor(1),leftNeighbor(2))=4;%on list
            numExpanded = numExpanded+1;   
            parent(nrows*(leftNeighbor(2)-1)+leftNeighbor(1))=nrows*(current(2)-1)+current(1);
        end
    end
    %right
    if(current(1)<nrows+1 && current(1)>0 && current(2)>0 && current(2)+1<ncols+1)
        rightNeighbor(1) = current(1);
        rightNeighbor(2) = current(2)+1;
        colorRight=map(rightNeighbor(1),rightNeighbor(2));
        if(colorRight==6)
            g(rightNeighbor(1),rightNeighbor(2))= g(current(1),current(2))+1;
            f(rightNeighbor(1),rightNeighbor(2)) =g(rightNeighbor(1),rightNeighbor(2))+ H(rightNeighbor(1),rightNeighbor(2));
            numExpanded = numExpanded+1;   
            parent(nrows*(rightNeighbor(2)-1)+rightNeighbor(1))=nrows*(current(2)-1)+current(1);
            break;
        % not visited and not obstacles£¬2=obstacle,3=visited
        elseif(f(rightNeighbor(1),rightNeighbor(2))==Inf && colorRight~=2 && colorRight~=3)
            g(rightNeighbor(1),rightNeighbor(2))= g(current(1),current(2))+1;
            f(rightNeighbor(1),rightNeighbor(2)) =g(rightNeighbor(1),rightNeighbor(2))+ H(rightNeighbor(1),rightNeighbor(2));
            map(rightNeighbor(1),rightNeighbor(2)) = 4;%on list
            numExpanded = numExpanded+1;   
            parent(nrows*(rightNeighbor(2)-1)+rightNeighbor(1))=nrows*(current(2)-1)+current(1);
        end
    end
end

%% Construct route from start to dest by following the parent links
if (isinf(f(dest_node)))
	route = [];
else
    route = [dest_node];
    parent(start_node)=0;
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end
%     disp('parent');disp(parent);
%     disp('route');disp(route);


    % Snippet of code used to visualize the map and the path
    if showResult == 0
        for k = 2:length(route) - 1        
            map(route(k)) = 7;
            pause(0.1);
            image(1.5, 1.5, map);
            grid on;
            axis image;
        end
    elseif  showResult == 1
        for k = 2:length(route) - 1        
            map(route(k)) = 7;
            image(1.5, 1.5, map);
            grid on;
            axis image;
        end
        image(1.5, 1.5, map);
        grid on;
        axis image;
        drawnow;
    end
end
