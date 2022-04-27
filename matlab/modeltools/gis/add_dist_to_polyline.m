clear all; close all;

shp = shaperead('Swan_Transect_Pnt.shp');

for i = 1:length(shp)
    shp(i).km = shp(i).cngmeters / 1000;
end

shapewrite(shp,'Swan_Transect_Pnt.shp');