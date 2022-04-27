clear all; close all;

shp = shaperead('Swan_Transect_Pnt.shp');

dist(1) = 0;

for i = 2:length(shp)
    dist(i) = sqrt(power(shp(i).X - shp(i-1).X,2) + power(shp(i).Y - shp(i-1).Y,2)) + dist(i-1);
end

dist = dist / 1000;

getdist = [0:5:60];


for i = 1:length(getdist)
    [~,ind] = min(abs(dist - getdist(i)));
    S(i).Geometry = 'Point';
    S(i).X = shp(ind).X;
    S(i).Y = shp(ind).Y;
    S(i).Dist = dist(ind);
end

shapewrite(S,'Pnt_Markers.shp');