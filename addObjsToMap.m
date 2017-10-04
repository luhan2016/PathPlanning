function objsMap = addObjsToMap(obj1_centerPoint,obj2_centerPoint,obj3_centerPoint)
    objsMap = zeros(150,150);
    if obj1_centerPoint(1)==150 && obj1_centerPoint(2)==150;
        obj1=0;
    else
        obj1=1;
    end
    if obj2_centerPoint(1)==150 && obj2_centerPoint(2)==150
        obj2=0;
    else
        obj2=1;
    end
    if obj3_centerPoint(1)==150 && obj3_centerPoint(2)==150
        obj3=0;
    else
        obj3=1;
    end
    if obj1==1
        if obj2==1
            if obj3==1        
               for jjj=obj3_centerPoint(2)-2:obj3_centerPoint(2)+2
                    for iii=obj3_centerPoint(1)-2:obj3_centerPoint(1)+2
                        objsMap(jjj,iii)=1;
                    end
               end           
            end     
           for jjj=obj2_centerPoint(2)-2:obj2_centerPoint(2)+2
                for iii=obj2_centerPoint(1)-2:obj2_centerPoint(1)+2
                    objsMap(jjj,iii)=1;
                end
            end
        elseif obj2==0
            if obj3==1          
               for jjj=obj3_centerPoint(2)-2:obj3_centerPoint(2)+2
                    for iii=obj3_centerPoint(1)-2:obj3_centerPoint(1)+2
                        objsMap(jjj,iii)=1;
                    end
                end        
            end
        end     
       for jjj=obj1_centerPoint(2)-2:obj1_centerPoint(2)+2
            for iii=obj1_centerPoint(1)-2:obj1_centerPoint(1)+2
                objsMap(jjj,iii)=1;
            end
        end
    elseif  obj1 ==0
        if obj2==1
            if obj3==1      
               for jjj=obj3_centerPoint(2)-2:obj3_centerPoint(2)+2
                    for iii=obj3_centerPoint(1)-2:obj3_centerPoint(1)+2
                        objsMap(jjj,iii)=1;
                    end
                end                     
            end     
           for jjj=obj2_centerPoint(2)-2:obj2_centerPoint(2)+2
                for iii=obj2_centerPoint(1)-2:obj2_centerPoint(1)+2
                    objsMap(jjj,iii)=1;
                end
            end
        elseif obj2==0
            if obj3==1     
               for jjj=obj3_centerPoint(2)-2:obj3_centerPoint(2)+2
                    for iii=obj3_centerPoint(1)-2:obj3_centerPoint(1)+2
                        objsMap(jjj,iii)=1;
                    end
               end            
            end
        end 
    end