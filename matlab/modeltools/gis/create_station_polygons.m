clear all; close all;

load ../matfiles/swan.mat;

[snum,sstr] = xlsread('Site_Details.xlsx','A2:B100');

thesite = snum(:,1);
thename = sstr(:,1);

int = 1;
for i = 1:length(thesite)
    
    thissite = ['s',num2str(thesite(i))];
    
    if isfield(swan,thissite)
    
    vars = fieldnames(swan.(thissite));
    
       T = nsidedpoly(360,'Center',[swan.(thissite).(vars{1}).X swan.(thissite).(vars{1}).Y],'Radius',500);
    
    S(int).X = T.Vertices(:,1);
    S(int).Y = T.Vertices(:,2);
    S(int).Name = [thissite,' ',thename{i}];
    S(int).Geometry = 'Polygon';
    S(int).Plot_Order = i;
    
    int = int + 1;
    
    end
end

shapewrite(S,'Swan_Station_Polygons_500m.shp');
    