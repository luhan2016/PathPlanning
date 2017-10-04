% obj1_Posotion is th ecenter point of the circle
function [obj_nextPos,obj_centerPoint] = moveObj(obj_centerPoint,mapResize)

obj_x = obj_centerPoint(1);
obj_y = obj_centerPoint(2);

movable = false;
MapInflated = MapInflate(mapResize, 2);

% 1:left+up(--); 2:up(=-); 3:right+up(+-),4:left(-=),
% 5:right(+=),6:left+down(-+), 7:down(=+), 8:right+down(++)
while movable == false
    j = 0;
    obj_case = randperm(8);
    if obj_case(1)==1
        if obj_x-1  > 3 
            obj_x = obj_x - 1;
        else
            obj_x = 147;
        end
        if obj_y -1  > 3 
            obj_y = obj_y - 1;
        else
            obj_y = 147;
        end
    elseif obj_case(1)==2
        if obj_y -1 > 3
            obj_y = obj_y - 1;
        else
            obj_y = 147;
        end
    elseif obj_case(1)==3
        if obj_x < 147 && obj_x > 1
            obj_x = obj_x + 1;
        else
            obj_x = 3;
        end
        if obj_y -1 > 3
            obj_y = obj_y - 1;
        else
            obj_y = 147;
        end
    elseif obj_case(1)==4
        if obj_x -1 > 3
            obj_x = obj_x - 1;
        else
            obj_x = 147;
        end
    elseif obj_case(1)==5
        if obj_x < 147 && obj_x > 1
            obj_x = obj_x + 1;
        else
            obj_x = 3;
        end
    elseif obj_case(1)==6
        if obj_x -1 > 3
            obj_x = obj_x - 1;
        else
            obj_x = 147;
        end
        if obj_y < 147 && obj_y > 1
            obj_y = obj_y + 1;
        else
            obj_y = 3;
        end
    elseif obj_case(1)==7
        if obj_y < 147 && obj_y > 1
            obj_y = obj_y + 1;
        else
            obj_y = 3;
        end
    elseif obj_case(1)==8
        if obj_x < 147 && obj_x > 1
            obj_x = obj_x + 1;
        else
            obj_x = 3;
        end
        if obj_y < 147 && obj_y > 1
            obj_y = obj_y + 1;
        else
            obj_y = 3;
        end
    end
    
    for jj=obj_y-2:obj_y+2
        for ii=obj_x-2:obj_x+2
            if MapInflated(jj,ii)==1
                j=j+1;
            end
        end
    end
    if j==0
        movable=true;
    end
end
obj_nextPos = [obj_x-2, obj_y-2, 4, 4];
obj_centerPoint = [obj_x, obj_y];


