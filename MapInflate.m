function MapInflated = MapInflate(Map, robotRadius)
    MapInflated = Map;
    [X Y] = size(Map);
    % for loop-- extand(inflate) times
    for inflateTime = 1:robotRadius
        for i = 1:X
            for j = 1:Y
                if(Map(i,j)==1)
                    if( i+1<X && j+1<Y)
                        if(Map(i+1,j+1)==0)
                            MapInflated(i+1,j+1)=1;
                        end
                    end
                    if( i+1<X && j-1>0)
                        if(Map(i+1,j-1)==0)
                            MapInflated(i+1,j-1)=1;
                        end
                    end
                    if (i-1>0 && j+1<Y)
                        if(Map(i-1,j+1)==0)
                            MapInflated(i-1,j+1)=1;
                        end
                    end
                    if(i-1>0 && j-1>0)
                        if(Map(i-1,j-1)==0)
                            MapInflated(i-1,j-1)=1;
                        end
                    end
                end
            end
        end
        Map = MapInflated;
    end
end