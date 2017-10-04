function smoothPath= Spline_Smooth(pathX, pathY, N_pickPointsFromPath,N_newPoint)
k = 1;
if N_pickPointsFromPath>3
    m = round(length(pathX)/(N_pickPointsFromPath-2));
else
    m=1;
end
for i=1:m:length(pathX)
   x(k) = pathX(i);
   y(k) = pathY(i);
   k = k+1;
end
if (i < length(pathX)-m/3)
    x(k) = pathX(length(pathX));
    y(k) = pathY(length(pathX));
else
    k = k-1;
end
t = 0:k-1;
n = 1/N_newPoint;
tq = 0:n:k-1;
xq = interp1(t,x,tq,'spline');
yq = interp1(t,y,tq,'spline');

smoothPath =[xq;yq];