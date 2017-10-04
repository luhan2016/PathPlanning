function [RobotHeadingThetha,Laser_Obj_S,Laser_Obj_M,Laser_Obj_L] = DrawRobot(smoothPathX_current,smoothPathY_current,smoothPathX_next,smoothPathY_next,strategy,mapResize,objsMap)
   % startegy: 1-no obstacles(>25), 2- SLOW DOWN(25--15),3 REPLAN(15-5)4 danger (5)

    pos = [smoothPathX_current-2, smoothPathY_current-2 ,4 ,4 ];
    rectangle('Position',pos,'Curvature',[1 1],'FaceColor',[1 0 0]);     
    
    thethaX = smoothPathX_next - smoothPathX_current;
    thethaY = smoothPathY_next - smoothPathY_current;
    RobotHeadingThetha = atan( thethaY / thethaX);
    
    if(thethaX<0 && thethaY<0 )
        laserTheta = 0+pi/2+RobotHeadingThetha: 0.1 : pi+pi/2+RobotHeadingThetha; 
    elseif(thethaX>0 && thethaY<0)
        laserTheta = 0-pi/2+RobotHeadingThetha: 0.1: pi-pi/2+RobotHeadingThetha; 
    elseif(thethaX<0 && thethaY > 0)   
        laserTheta = 0+pi/2+RobotHeadingThetha: 0.1: pi+pi/2+RobotHeadingThetha; 
    elseif (thethaX> 0 && thethaY> 0)       
        laserTheta = 0-pi/2+RobotHeadingThetha: 0.1 : pi-pi/2+RobotHeadingThetha;
    elseif (thethaX == 0 && thethaY> 0)       
        laserTheta = 0: 0.1 : pi;
    elseif (thethaX == 0 && thethaY < 0)       
        laserTheta = pi: 0.1 : 2*pi;
    elseif (thethaX > 0 && thethaY == 0)       
        laserTheta = 0-pi/2: 0.1 : pi-pi/2;
    elseif (thethaX <= 0 && thethaY == 0)       
        laserTheta = 0+pi/2: 0.1 : pi+pi/2;
    end
        
    smaLaser = 5*ones(1,length(laserTheta)); 
    [smaLaser_x,smaLaser_y] = pol2cart(laserTheta,smaLaser);    
    
    midLaser = 15*ones(1,length(laserTheta)); 
    [midLaser_x,midLaser_y] = pol2cart(laserTheta,midLaser);
    
    bigLaser = 25*ones(1,length(laserTheta)); 
    [bigLaser_x,bigLaser_y] = pol2cart(laserTheta,bigLaser);
    
    Laser_Obj_S = 0;
    Laser_Obj_M = 0;
    Laser_Obj_L = 0;
    %----------------------------------------------------------------------
    % modify laser range based on the obstacles
    for ii = 1:length(smaLaser_x)
       flag = 0;
       RR = linspace(0, 5, 10);
       jj = 0;
       while flag == 0
           jj = jj+1;
           [RR_x, RR_y] = pol2cart(laserTheta(ii),RR(jj));
           if (objsMap(round(smoothPathY_current+RR_y), round(smoothPathX_current+RR_x)) == 1)
               Laser_Obj_S = 1;
               flag = 1;
           elseif (mapResize(round(smoothPathY_current+RR_y), round(smoothPathX_current+RR_x)) == 1) || (jj == 10)
               flag = 1;
           end
       end
       if flag == 1
            smaLaser(ii) = RR(jj-1);
       end
    end
   [smaLaser_x,smaLaser_y] = pol2cart(laserTheta,smaLaser);
    %----------------------------------------------------------------------
    % modify laser range based on the obstacles
   for ii = 1:length(midLaser_x)
       flag = 0;
       RR = linspace(0, 15, 30);
       jj = 0;
       while flag == 0
           jj = jj+1;
           [RR_x, RR_y] = pol2cart(laserTheta(ii),RR(jj));
           if (objsMap(round(smoothPathY_current+RR_y), round(smoothPathX_current+RR_x)) == 1)
               Laser_Obj_M = 1;
               flag = 1;
           elseif (mapResize(round(smoothPathY_current+RR_y), round(smoothPathX_current+RR_x)) == 1) || (jj == 30)
               flag = 1;
           end
       end
       if flag == 1
            midLaser(ii) = RR(jj-1);
       end
    end
   [midLaser_x,midLaser_y] = pol2cart(laserTheta,midLaser);
    %----------------------------------------------------------------------
    % modify laser range based on the obstacles
    for ii = 1:length(bigLaser_x)
       flag = 0;
       RR = linspace(0, 25, 50);
       jj = 0;
       while flag == 0
           jj = jj+1;
           [RR_x, RR_y] = pol2cart(laserTheta(ii),RR(jj));
           if (objsMap(round(smoothPathY_current+RR_y), round(smoothPathX_current+RR_x)) == 1)
               Laser_Obj_L = 1;
               flag = 1;
           elseif (mapResize(round(smoothPathY_current+RR_y), round(smoothPathX_current+RR_x)) == 1) || (jj == 50)
               flag = 1;
           end
       end
       if flag == 1
            bigLaser(ii) = RR(jj-1);
       end
    end
   [bigLaser_x,bigLaser_y] = pol2cart(laserTheta,bigLaser);

   
    %----------------------------------------------------------------------
    % draw all lasers 
    for j=1:length(smaLaser)
        if(strategy == 1)
            plot([smoothPathX_current, smoothPathX_current+bigLaser_x(j)],[smoothPathY_current,smoothPathY_current+bigLaser_y(j)], 'y'); 
            hold on; 
            plot([smoothPathX_current, smoothPathX_current+midLaser_x(j)],[smoothPathY_current,smoothPathY_current+midLaser_y(j)], 'g');
            hold on;
            plot([smoothPathX_current, smoothPathX_current+smaLaser_x(j)],[smoothPathY_current,smoothPathY_current+smaLaser_y(j)], 'b');
            hold on;
        elseif(strategy == 2)   
            plot([smoothPathX_current, smoothPathX_current+bigLaser_x(j)],[smoothPathY_current,smoothPathY_current+bigLaser_y(j)], 'r'); 
            hold on;
            plot([smoothPathX_current, smoothPathX_current+midLaser_x(j)],[smoothPathY_current,smoothPathY_current+midLaser_y(j)], 'g');
            hold on;
            plot([smoothPathX_current, smoothPathX_current+smaLaser_x(j)],[smoothPathY_current,smoothPathY_current+smaLaser_y(j)], 'b');
            hold on;
        elseif(strategy == 3)     
            plot([smoothPathX_current, smoothPathX_current+bigLaser_x(j)],[smoothPathY_current,smoothPathY_current+bigLaser_y(j)], 'r'); 
            hold on;
            plot([smoothPathX_current, smoothPathX_current+midLaser_x(j)],[smoothPathY_current,smoothPathY_current+midLaser_y(j)], 'r');
            hold on;
            plot([smoothPathX_current, smoothPathX_current+smaLaser_x(j)],[smoothPathY_current,smoothPathY_current+smaLaser_y(j)], 'b');
            hold on;
        elseif(strategy == 4)    
            plot([smoothPathX_current, smoothPathX_current+bigLaser_x(j)],[smoothPathY_current,smoothPathY_current+bigLaser_y(j)], 'r'); 
            hold on;
            plot([smoothPathX_current, smoothPathX_current+midLaser_x(j)],[smoothPathY_current,smoothPathY_current+midLaser_y(j)], 'r');
            hold on;
            plot([smoothPathX_current, smoothPathX_current+smaLaser_x(j)],[smoothPathY_current,smoothPathY_current+smaLaser_y(j)], 'r');
            hold on;
        end
    end
   
end