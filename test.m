function varargout = test(varargin)
% TEST MATLAB code for test.fig
%      TEST, by itself, creates a new TEST or raises the existing
%      singleton*.
%
%      H = TEST returns the handle to a new TEST or the handle to
%      the existing singleton*.
%
%      TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST.M with the given input arguments.
%
%      TEST('Property','Value',...) creates a new TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test

% Last Modified by GUIDE v2.5 27-May-2017 08:13:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test (see VARARGIN)

% Choose default command line output for test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in map1.
function map1_Callback(hObject, eventdata, handles)
% hObject    handle to map1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str;
str = sprintf('You choose map 1.\n');
set(handles.result,'String',str);

hFindPathAxes = handles.findPathAxes;

imageOriginal = imread('map1.png');
imageTransfered = imageOriginal(:,:,1);
logicalMap = logical((255-imageTransfered)/255);
copyMap = logicalMap;
clear logicalMap;
mapResize = imresize(copyMap,[150 150]); 
mapInflated = MapInflate(mapResize, 2); 

% save maps into basic workspace
assignin('base', 'mapResize', mapResize);
assignin('base', 'mapInflated', mapInflated);

cmap = [1 1 1; 0 0 0; 1 0 0; 0 0 1;0 1 0;1 1 0;0.5 0.5 0.5];
colormap(cmap);

% map - a table that keeps track of the state of each grid cell
map = zeros(150,150);
map(~mapInflated) = 1;   % Mark free cells
map(~~mapInflated)  = 2;   % Mark obstacle cells   
axes(hFindPathAxes);
image(1.5, 1.5, map);
grid on;
axis image;
xlabel('x');
ylabel('y');
drawnow;





% --- Executes on button press in map2.
function map2_Callback(hObject, eventdata, handles)
% hObject    handle to map2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global str;
str = sprintf('You choose map 2.\n');
set(handles.result,'String',str);

hFindPathAxes = handles.findPathAxes;

imageOriginal = imread('map2.png');
imageTransfered = imageOriginal(:,:,1);
logicalMap = logical((255-imageTransfered)/255);
copyMap = logicalMap;
clear logicalMap;
mapResize = imresize(copyMap,[150 150]); 
mapInflated = MapInflate(mapResize, 2); 

% save maps into basic workspace
assignin('base', 'mapResize', mapResize);
assignin('base', 'mapInflated', mapInflated);

cmap = [1 1 1; 0 0 0; 1 0 0; 0 0 1;0 1 0;1 1 0;0.5 0.5 0.5];
colormap(cmap);

% map - a table that keeps track of the state of each grid cell
map = zeros(150,150);
map(~mapInflated) = 1;   % Mark free cells
map(~~mapInflated)  = 2;   % Mark obstacle cells   
axes(hFindPathAxes);
image(1.5, 1.5, map);
grid on;
axis image;
xlabel('x');
ylabel('y');
drawnow;





% --- Executes on button press in map3.
function map3_Callback(hObject, eventdata, handles)
% hObject    handle to map3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global str;
str = sprintf('You choose map 3.\n');
set(handles.result,'String',str);

hFindPathAxes = handles.findPathAxes;

imageOriginal = imread('map3.png');
imageTransfered = imageOriginal(:,:,1);
logicalMap = logical((255-imageTransfered)/255);
copyMap = logicalMap;
clear logicalMap;
mapResize = imresize(copyMap,[150 150]); 
mapInflated = MapInflate(mapResize, 2); 

% save maps into basic workspace
assignin('base', 'mapResize', mapResize);
assignin('base', 'mapInflated', mapInflated);

cmap = [1 1 1; 0 0 0; 1 0 0; 0 0 1;0 1 0;1 1 0;0.5 0.5 0.5];
colormap(cmap);

% map - a table that keeps track of the state of each grid cell
map = zeros(150,150);
map(~mapInflated) = 1;   % Mark free cells
map(~~mapInflated)  = 2;   % Mark obstacle cells   
axes(hFindPathAxes);
image(1.5, 1.5, map);
grid on;
axis image;
xlabel('x');
ylabel('y');
drawnow;





% --- Executes on button press in findingPath.
function findingPath_Callback(hObject, eventdata, handles)
% hObject    handle to findingPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get the handles to the objects of interest:
hFindPathAxes = handles.findPathAxes;

hStartX = handles.startX;
hStartY = handles.startY;
hGoalX = handles.goalX;
hGoalY = handles.goalY;

% Get the string value
stringStartX = get(hStartX,'String');
stringStartY = get(hStartY,'String');
stringGoalX = get(hGoalX,'String');
stringGoalY = get(hGoalY,'String');

global str;
tmp = strcat(sprintf('\nstart point is: ['),stringStartX);
tmp = strcat(tmp,',');
tmp = strcat(tmp,stringStartY);
tmp = strcat(tmp,sprintf(']\nend point is: ['));
tmp = strcat(tmp,stringGoalX);
tmp = strcat(tmp,',');
tmp = strcat(tmp,stringGoalY);
tmp = strcat(tmp,']');
tmp = strcat(tmp,sprintf('\nfinding path...'));
str = strcat(str,tmp);
set(handles.result,'String',str);

startX = str2num(stringStartX);
startY = str2num(stringStartY);
goalX = str2num(stringGoalX);
goalY = str2num(stringGoalY);

startPoint = [startX,startY];
goalPoint = [goalX, goalY];
% save start point and goal point into basic workspace
assignin('base', 'startPoint', startPoint);
assignin('base', 'goalPoint', goalPoint);

% load map from basic workspace
mapInflated = evalin( 'base', 'mapInflated' );

axes(hFindPathAxes);
xlabel('x');
ylabel('y');
[route,~] = AStar(mapInflated, startPoint, goalPoint,0);
xlabel('x');
ylabel('y');

% save route into basic workspace
assignin('base', 'route', route);

% set default value for objects
setappdata( 0, 'obj1', 0 );
setappdata( 0, 'obj2', 0 );
setappdata( 0, 'obj3', 0 );


tmp = sprintf('\ngrey cells are path.');
str = strcat(str,tmp);
set(handles.result,'String',str);



% --- Executes on button press in showPath.
function showPath_Callback(hObject, eventdata, handles)
% hObject    handle to showPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the handles to the objects of interest:
hFindPathAxes = handles.findPathAxes;

hStartX = handles.startX;
hStartY = handles.startY;
hGoalX = handles.goalX;
hGoalY = handles.goalY;

% Get the string value
stringStartX = get(hStartX,'String');
stringStartY = get(hStartY,'String');
stringGoalX = get(hGoalX,'String');
stringGoalY = get(hGoalY,'String');

global str;
tmp = strcat(sprintf('\nstart point is: ['),stringStartX);
tmp = strcat(tmp,',');
tmp = strcat(tmp,stringStartY);
tmp = strcat(tmp,sprintf(']\nend point is: ['));
tmp = strcat(tmp,stringGoalX);
tmp = strcat(tmp,',');
tmp = strcat(tmp,stringGoalY);
tmp = strcat(tmp,']');
tmp = strcat(tmp,sprintf('\nfinding path...'));
str = strcat(str,tmp);
set(handles.result,'String',str);

startX = str2num(stringStartX);
startY = str2num(stringStartY);
goalX = str2num(stringGoalX);
goalY = str2num(stringGoalY);

startPoint = [startX,startY];
goalPoint = [goalX, goalY];
% save start point and goal point into basic workspace
assignin('base', 'startPoint', startPoint);
assignin('base', 'goalPoint', goalPoint);

% load map from basic workspace
mapInflated = evalin( 'base', 'mapInflated' );

axes(hFindPathAxes);
xlabel('x');
ylabel('y');
[route,~] = AStar(mapInflated, startPoint, goalPoint,1);
xlabel('x');
ylabel('y');

% save route into basic workspace
assignin('base', 'route', route);

% set default value for objects
setappdata( 0, 'obj1', 0 );
setappdata( 0, 'obj2', 0 );
setappdata( 0, 'obj3', 0 );


tmp = sprintf('\ngrey cells are path.');
str = strcat(str,tmp);
set(handles.result,'String',str);



% --- Executes on button press in smoothPath.
function smoothPath_Callback(hObject, eventdata, handles)
% hObject    handle to smoothPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hpathFollowingAxes = handles.pathFollowingAxes;

% load route and map from basic workspace
mapResize = evalin( 'base', 'mapResize' );
route = evalin( 'base', 'route' );

axes(hpathFollowingAxes);
image(mapResize); 
xlabel('x');
ylabel('y');
hold on; 

% smooth the path
[pathY , pathX] = ind2sub(size(mapResize),route);
plot(pathX,pathY, 'r-', 'LineWidth',3);
axis image;
smoothPath = Spline_Smooth(pathX, pathY, round(length(pathX)/4),3);
smoothPathX = smoothPath(1,:);
smoothPathY = smoothPath(2,:);
plot(smoothPathX,smoothPathY,'k.-', 'LineWidth',1);

assignin('base', 'Smooth_GlbX', smoothPathX);
assignin('base', 'Smooth_GlbY', smoothPathY);

% save information into basic workspace
assignin('base', 'pathX', pathX);
assignin('base', 'pathY', pathY);
assignin('base', 'smoothPathX', smoothPathX);
assignin('base', 'smoothPathY', smoothPathY);

hold off;
global str;
tmp = sprintf('\nsmooth path.');
str = strcat(str,tmp);
set(handles.result,'String',str);



% --- Executes on button press in pathFollowing.
function pathFollowing_Callback(hObject, eventdata, handles)
% hObject    handle to pathFollowing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global str;
tmp = strcat(sprintf('\npath following...'),sprintf('\nsafety zone is 0-5m'));
tmp = strcat(tmp,sprintf('\nre-plan zone is 5-15m'));
str = strcat(tmp,sprintf('\nsence distance is 15-25m'));
set(handles.result,'String',str);

hpathFollowingAxes = handles.pathFollowingAxes;

% load information from basic workspace
startPoint = evalin( 'base', 'startPoint' );
goalPoint = evalin( 'base', 'goalPoint' );
mapResize = evalin( 'base', 'mapResize' );
mapInflated = evalin( 'base', 'mapInflated' );
pathX = evalin( 'base', 'pathX' );
pathY = evalin( 'base', 'pathY' );
smoothPathX = evalin( 'base', 'smoothPathX' );
smoothPathY = evalin( 'base', 'smoothPathY' );

Smooth_GlbX = evalin( 'base', 'Smooth_GlbX' );
Smooth_GlbY = evalin( 'base', 'Smooth_GlbY' );

obj1_centerPoint=[150,150];
obj2_centerPoint=[150,150];
obj3_centerPoint=[150,150];
obj1 = getappdata( 0, 'obj1');
setappdata( 0, 'obj1', 0 );
if obj1 == 1
    obj1_centerPoint = evalin( 'base', 'obj1_centerPoint' );
    obj1_currentPos = evalin( 'base', 'obj1_currentPos' );
end

obj2 = getappdata( 0, 'obj2');
setappdata( 0, 'obj2', 0 );
if obj2 == 1
    obj2_centerPoint = evalin( 'base', 'obj2_centerPoint' );
    obj2_currentPos = evalin( 'base', 'obj2_currentPos' );
end

obj3 = getappdata( 0, 'obj3');
setappdata( 0, 'obj3', 0 );
if obj3 == 1
    obj3_centerPoint = evalin( 'base', 'obj3_centerPoint' );
    obj3_currentPos = evalin( 'base', 'obj3_currentPos' );
end


Robot_Pos = startPoint;
i = 1;
countSlowPoint = 1;
obj_centerPoint = [150,150]; 
global stop;
stop = false;

while sqrt((Robot_Pos(1)-goalPoint(1))^2+(Robot_Pos(2)-goalPoint(2))^2)> 1 && i < length(smoothPathX) && (stop == false)
    
    %----draw image ----------
    image(mapResize);
    hold on;
    plot(Smooth_GlbX, Smooth_GlbY, 'm-', 'LineWidth', 1);
    plot(pathX,pathY, 'r-', 'LineWidth',3);
    plot(smoothPathX,smoothPathY,'k.-', 'LineWidth',1);
    xlabel('x');
    ylabel('y');
    axis image;    
     
    % ---- draw object------
    if obj1 == 1;   rectangle('Position',obj1_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);    end 
    if obj2 == 1;	rectangle('Position',obj2_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);    end 
    if obj3 == 1;   rectangle('Position',obj3_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);    end
    
    objsMap = addObjsToMap(obj1_centerPoint,obj2_centerPoint,obj3_centerPoint);
    assignin('base', 'objsMap', objsMap);
      
    [~,Laser_Obj_S,Laser_Obj_M,Laser_Obj_L] = DrawRobot(smoothPathX(i), smoothPathY(i), smoothPathX(i+1), smoothPathY(i+1),4,mapResize,objsMap); 


    
    %--------------solution 1: obj in small circle --------------------
    if(Laser_Obj_S == 1 )
        str = strcat(str,sprintf('\nStop!'));
        set(handles.result,'String',str);
        DrawRobot(smoothPathX(i), smoothPathY(i), smoothPathX(i+1), smoothPathY(i+1),4,mapResize,objsMap); 
        pause(1);
        i = i+1;
    % ------------end solution 1-----------------------------------


    % --------------- solution 2: object in middle circle--------------
    elseif(Laser_Obj_M == 1)  
        str = strcat(str,sprintf('\nReplaning...'));
        set(handles.result,'String',str);

        DrawRobot(smoothPathX(i), smoothPathY(i), smoothPathX(i+1), smoothPathY(i+1),3,mapResize,objsMap); 
        % load map and goalpoint from basic workspace
        mapInflated = evalin( 'base', 'mapInflated' );
        goalPoint = evalin( 'base', 'goalPoint' );
        mapResize = evalin( 'base', 'mapResize' );
        startPoint = [ round(smoothPathY(i+1)), round(smoothPathX(i+1)) ];

        % inflate the objs in the inflated map
        if obj1 == 1
            if obj1_centerPoint(1)-3<0;     obj1_centerPoint(1)=obj1_centerPoint(1)+3;  end
            if obj1_centerPoint(1)+3>150;   obj1_centerPoint(1)=obj1_centerPoint(1)-3;  end
            for jjj=obj1_centerPoint(2)-3:obj1_centerPoint(2)+3
                for iii=obj1_centerPoint(1)-3:obj1_centerPoint(1)+3
                    mapInflated(jjj,iii)=1;
                end
            end
        end
        if obj2 == 1
            if obj2_centerPoint(1)-3<0;     obj2_centerPoint(1)=obj2_centerPoint(1)+3;  end
            if obj2_centerPoint(1)+3>150;   obj2_centerPoint(1)=obj2_centerPoint(1)-3;  end
            for jjj=obj2_centerPoint(2)-3:obj2_centerPoint(2)+3
                for iii=obj2_centerPoint(1)-3:obj2_centerPoint(1)+3
                    mapInflated(jjj,iii)=1;
                end
            end
        end
        if obj3 == 1
            if obj3_centerPoint(1)-3<0;     obj3_centerPoint(1)=obj3_centerPoint(1)+3;  end
            if obj3_centerPoint(1)+3>150;   obj3_centerPoint(1)=obj3_centerPoint(1)-3;  end
            for jjj=obj3_centerPoint(2)-3:obj3_centerPoint(2)+3
                for iii=obj3_centerPoint(1)-3:obj3_centerPoint(1)+3
                    mapInflated(jjj,iii)=1;
                end
            end
        end           
        % if after inflate the objs, goal point is occupied, then set goal point neighbor area is 0(free/ empty)
        if mapInflated(goalPoint(1),goalPoint(2)) == 1
            for jjj=goalPoint(2)-3:goalPoint(2)+3
                for iii=goalPoint(1)-3:goalPoint(1)+3
                    mapInflated(iii,iii)=0;
                end
            end
        end

        % replanning
        [route,~] = AStar(mapInflated, startPoint, goalPoint, 2);
        [pathY , pathX] = ind2sub(size(mapResize),route);
        plot(pathX,pathY, 'c-', 'LineWidth',3);
        axis image;
        if round(length(pathX)/4) > 3;
            smoothPath = Spline_Smooth(pathX, pathY, round(length(pathX)/4),3);
        else
            smoothPath = Spline_Smooth(pathX, pathY, 3,3);
        end
        smoothPathX = smoothPath(1,:);
        smoothPathY = smoothPath(2,:);              
        plot(smoothPathX,smoothPathY,'k.-', 'LineWidth',1);

        % save information into basic workspace
        assignin('base', 'route', route);
        assignin('base', 'pathX', pathX);
        assignin('base', 'pathY', pathY);
        assignin('base', 'smoothPathX', smoothPathX);
        assignin('base', 'smoothPathY', smoothPathY);
        i = 1;
    % ------------end solution 2-----------------------------------


    % ------------ solution 3: object in the big circle -------------
    elseif(Laser_Obj_L == 1) 
        str = strcat(str,sprintf('\nSlow Down...'));
        set(handles.result,'String',str);

        if countSlowPoint <= 5 
            slowX = (smoothPathX(i+1)-smoothPathX(i))/4;
            slowY = (smoothPathY(i+1)-smoothPathY(i))/4;
        end
        smoothPathX(i) = smoothPathX(i) + (countSlowPoint-1)*slowX;
        smoothPathY(i) = smoothPathY(i) + (countSlowPoint-1)*slowY;       
        [Robot_Heading(i),~,~] = DrawRobot(smoothPathX(i), smoothPathY(i), smoothPathX(i)+slowX, smoothPathY(i)+slowY,2,mapResize,objsMap);  


        if sqrt((smoothPathX(i+1)-obj_centerPoint(1))^2+(smoothPathY(i+1)-obj_centerPoint(2))^2) > 25
                i = i+1;  
        else                    
            if countSlowPoint < 5
                countSlowPoint = countSlowPoint+1;
            else
                i = i+1;
                countSlowPoint = 1;
            end 
        end                
    % ------------end solution 3-----------------------------------


    % ------------ solution 4: objects not in the circle or no object-----
    else
        str = strcat(str,sprintf('\nPath following...'));
        set(handles.result,'String',str);
        DrawRobot(smoothPathX(i),smoothPathY(i),smoothPathX(i+1),smoothPathY(i+1),1,mapResize,objsMap);
        i = i+1;
    % ------------end solution 4-----------------------------------
    end % end object in circle


    Robot_Pos = [smoothPathX(i) smoothPathY(i)];
    drawnow;
    if obj1 == 1               
        [obj1_nextPos,obj1_centerPoint] = moveObj(obj1_centerPoint,mapResize);
        obj1_currentPos = obj1_nextPos;
    end
    if obj2 == 1                        
        [obj2_nextPos,obj2_centerPoint] = moveObj(obj2_centerPoint,mapResize);
        obj2_currentPos = obj2_nextPos;
    end
    if obj3 == 1                        
        [obj3_nextPos,obj3_centerPoint] = moveObj(obj3_centerPoint,mapResize);
        obj3_currentPos = obj3_nextPos;
    end
end % end while

if i == length(smoothPathX)
    image(mapResize);
    plot(pathX,pathY, 'r-', 'LineWidth',3);
    plot(smoothPathX,smoothPathY,'k.-', 'LineWidth',1);
    axis image;
    pos = [goalPoint(2)-2, goalPoint(1)-2 ,4 ,4 ];
    rectangle('Position',pos,'Curvature',[1 1],'FaceColor',[1 0 0]);  
    if obj1 == 1
        rectangle('Position',obj1_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);
    end 
    if obj2 == 1
        rectangle('Position',obj2_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);
    end 
    if obj3 == 1
        rectangle('Position',obj3_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);
    end
    str = strcat(str,sprintf('\nReach the goal point...'));
    set(handles.result,'String',str);
end




% --- Executes on button press in obj1.
function obj1_Callback(hObject, eventdata, handles)
% hObject    handle to obj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the handles to the objects of interest:
hObj1X = handles.obj1X;
hObj1Y = handles.obj1Y;

% Get the string value
stringObj1X = get(hObj1X,'String');
stringObj1Y = get(hObj1Y,'String');

obj1X = str2num(stringObj1X);
obj1Y = str2num(stringObj1Y);

setappdata( 0, 'obj1', 1 );

mapResize = evalin( 'base', 'mapResize' );
if(length(obj1X)>0 && length(obj1Y)>0)
    [obj1_currentPos,obj1_centerPoint] = createObj(mapResize,obj1X,obj1Y);
else        
    [obj1_currentPos,obj1_centerPoint] = createObj(mapResize);
end

rectangle('Position',obj1_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);

% save route into basic workspace
assignin('base', 'obj1_centerPoint', obj1_centerPoint);
assignin('base', 'obj1_currentPos', obj1_currentPos);

global str;
tmp = sprintf('\nobject 1 start point is: [');
tmp = strcat(tmp,num2str(obj1_centerPoint(1)));
tmp = strcat(tmp,',');
tmp = strcat(tmp,num2str(obj1_centerPoint(2)));
tmp = strcat(tmp,']');
str = strcat(str,tmp);
set(handles.result,'String',str);




% --- Executes on button press in obj2.
function obj2_Callback(hObject, eventdata, handles)
% hObject    handle to obj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the handles to the objects of interest:
hObj2X = handles.obj2X;
hObj2Y = handles.obj2Y;

% Get the string value
stringObj2X = get(hObj2X,'String');
stringObj2Y = get(hObj2Y,'String');

obj2X = str2num(stringObj2X);
obj2Y = str2num(stringObj2Y);

% save route into basic workspace
assignin('base', 'obj2X', obj2X);
assignin('base', 'obj2Y', obj2Y);

setappdata( 0, 'obj2', 1 );
mapResize = evalin( 'base', 'mapResize' );
if(length(obj2X)>0 && length(obj2Y)>0)
    [obj2_currentPos,obj2_centerPoint] = createObj(mapResize,obj2X,obj2Y);
else        
    [obj2_currentPos,obj2_centerPoint] = createObj(mapResize);
end

rectangle('Position',obj2_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);

% save route into basic workspace
assignin('base', 'obj2_centerPoint', obj2_centerPoint);
assignin('base', 'obj2_currentPos', obj2_currentPos);

global str;
tmp = sprintf('\nobject 2 start point is: [');
tmp = strcat(tmp,num2str(obj2_centerPoint(1)));
tmp = strcat(tmp,',');
tmp = strcat(tmp,num2str(obj2_centerPoint(2)));
tmp = strcat(tmp,']');
str = strcat(str,tmp);
set(handles.result,'String',str);


% --- Executes on button press in obj3.
function obj3_Callback(hObject, eventdata, handles)
% hObject    handle to obj3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.result,'String','obj3');
% Get the handles to the objects of interest:
hObj3X = handles.obj3X;
hObj3Y = handles.obj3Y;

% Get the string value
stringObj3X = get(hObj3X,'String');
stringObj3Y = get(hObj3Y,'String');

obj3X = str2num(stringObj3X);
obj3Y = str2num(stringObj3Y);

% save route into basic workspace
assignin('base', 'obj3X', obj3X);
assignin('base', 'obj3Y', obj3Y);

setappdata( 0, 'obj3', 1 );
mapResize = evalin( 'base', 'mapResize' );
if(length(obj3X)>0 && length(obj3Y)>0)
    [obj3_currentPos,obj3_centerPoint] = createObj(mapResize,obj3X,obj3Y);
else        
    [obj3_currentPos,obj3_centerPoint] = createObj(mapResize);
end

rectangle('Position',obj3_currentPos,'Curvature',[1 1],'FaceColor',[0 0 1]);

% save route into basic workspace
assignin('base', 'obj3_centerPoint', obj3_centerPoint);
assignin('base', 'obj3_currentPos', obj3_currentPos);


global str;
tmp = sprintf('\nobject 3 start point is: [');
tmp = strcat(tmp,num2str(obj3_centerPoint(1)));
tmp = strcat(tmp,',');
tmp = strcat(tmp,num2str(obj3_centerPoint(2)));
tmp = strcat(tmp,']');
str = strcat(str,tmp);
set(handles.result,'String',str);





% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.result,'String','stop!');
smoothPathX = evalin( 'base', 'smoothPathX' );

global str;
str = 'stop!';
set(handles.result,'String',str);

global stop;
stop = true;


% --- Executes on button press in restart.
function restart_Callback(hObject, eventdata, handles)
% hObject    handle to restart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.result,'String','restart !');

global stop;
stop = true;
axes(handles.findPathAxes);
imshow(imread('empty.png'));
drawnow;
axes(handles.pathFollowingAxes);
imshow(imread('empty.png'));
drawnow;

% Get the string value
set(handles.startX, 'String', '');
set(handles.startY, 'String', '');
set(handles.goalX, 'String', '');
set(handles.goalY, 'String', '');
set(handles.obj1X, 'String', '');
set(handles.obj1Y, 'String', '');
set(handles.obj2X, 'String', '');
set(handles.obj2Y, 'String', '');
set(handles.obj3X, 'String', '');
set(handles.obj3Y, 'String', '');

set(handles.result,'String','restart!');






% ------------------------ default function -----------------------------



function startX_Callback(hObject, eventdata, handles)
% hObject    handle to startX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startX as text
%        str2double(get(hObject,'String')) returns contents of startX as a double


% --- Executes during object creation, after setting all properties.
function startX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function startY_Callback(hObject, eventdata, handles)
% hObject    handle to startX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startX as text
%        str2double(get(hObject,'String')) returns contents of startX as a double


% --- Executes during object creation, after setting all properties.
function startY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goalX_Callback(hObject, eventdata, handles)
% hObject    handle to goalX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goalX as text
%        str2double(get(hObject,'String')) returns contents of goalX as a double


% --- Executes during object creation, after setting all properties.
function goalX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goalX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goalY_Callback(hObject, eventdata, handles)
% hObject    handle to goalX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goalX as text
%        str2double(get(hObject,'String')) returns contents of goalX as a double


% --- Executes during object creation, after setting all properties.
function goalY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goalX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function obj1X_Callback(hObject, eventdata, handles)
% hObject    handle to obj1X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of obj1X as text
%        str2double(get(hObject,'String')) returns contents of obj1X as a double


% --- Executes during object creation, after setting all properties.
function obj1X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obj1X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function obj1Y_Callback(hObject, eventdata, handles)
% hObject    handle to obj1Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of obj1Y as text
%        str2double(get(hObject,'String')) returns contents of obj1Y as a double


% --- Executes during object creation, after setting all properties.
function obj1Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obj1Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function obj2X_Callback(hObject, eventdata, handles)
% hObject    handle to obj2X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of obj2X as text
%        str2double(get(hObject,'String')) returns contents of obj2X as a double


% --- Executes during object creation, after setting all properties.
function obj2X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obj2X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function obj2Y_Callback(hObject, eventdata, handles)
% hObject    handle to obj2Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of obj2Y as text
%        str2double(get(hObject,'String')) returns contents of obj2Y as a double


% --- Executes during object creation, after setting all properties.
function obj2Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obj2Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function obj3X_Callback(hObject, eventdata, handles)
% hObject    handle to obj3X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of obj3X as text
%        str2double(get(hObject,'String')) returns contents of obj3X as a double


% --- Executes during object creation, after setting all properties.
function obj3X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obj3X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function obj3Y_Callback(hObject, eventdata, handles)
% hObject    handle to obj3Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of obj3Y as text
%        str2double(get(hObject,'String')) returns contents of obj3Y as a double


% --- Executes during object creation, after setting all properties.
function obj3Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obj3Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
