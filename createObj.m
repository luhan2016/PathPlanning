% obj1_Posotion is th ecenter point of the circle
function [obj_Posotion,obj_centerPoint] = createObj(mapResize,startX, startY)

i=1;
isObj = false;
if nargin == 3
    obj_x = startX;
    obj_y = startY;
else
    MapInflated = MapInflate(mapResize, 2);
    while  isObj == false
        j = 0;
        % set mapsize 150x150, generate random location 
        obj_RandomX = randperm(150);
        obj_RandomY = randperm(150);   
        obj_x = obj_RandomX(i);
        obj_y = obj_RandomY(i);
        
        while( obj_x-2<=0 || obj_x+2>=150 || obj_y-2<=0 || obj_y+2>=150)
            i = i + 1;
            obj_x = obj_RandomX(i);
            obj_y = obj_RandomY(i);
            if i == 150
                i=1;
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
            isObj=true;
        end
    end 
end 
          
obj_Posotion = [obj_x-2, obj_y-2, 4, 4];
% rectangle('Position',obj_Posotion,'Curvature',[1 1],'FaceColor',[0 0 1]);
% return circle center point locatin
obj_centerPoint = [obj_x, obj_y];




