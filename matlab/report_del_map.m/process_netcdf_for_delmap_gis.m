clear all; close all;

addpath(genpath('../../../aed_matlab_modeltools/TUFLOWFV/tuflowfv/'));


thenetcdf = {...
    'K:\Swan\Sensitivity\2015_Basecase\Output\SCERM44_2015_2016_newIC.nc';
    'K:\Swan\Sensitivity\2015_FLU\Output\SCERM44_2015_2016_FLU.nc';
    'K:\Swan\aed_drive\SCERM\SCERM_v6_A3\Output\SCERM44_2015_2016_Capped.nc';
    };

names = {'Base';'FLU';'Capped'};

thedates = datenum(2015,[09 12],01);



dat = tfv_readnetcdf(thenetcdf{3},'timestep',1);clear functions
surf_ind = dat.idx3;
vert(:,1) = double(dat.node_X);
vert(:,2) = double(dat.node_Y);

faces = double(dat.cell_node');
% %--% Fix the triangles
faces(faces(:,4)== 0,4) = faces(faces(:,4)== 0,1);clear dat;

for i = 1:length(thenetcdf)

    dat = tfv_readnetcdf(thenetcdf{i},'time',1);clear functions
    mtime = dat.Time; clear dat;

    dat = tfv_readnetcdf(thenetcdf{i},'names',{'WQ_DIAG_TOT_TN'});

    timeind = find(mtime >= thedates(1) & mtime < thedates(2));

    thedata = dat.WQ_DIAG_TOT_TN(surf_ind,timeind);clear dat;

    themap = mean(thedata,2);

    output.(names{i}) = themap * 14/1000;
end

save output.mat output faces vert -mat;

load output.mat;

delmap1 = output.Capped - output.Base;
delmap2 = output.FLU - output.Base;

convert_2dm_to_shp('Swan_Canning_v4_ERZ_seagrass_NS.2dm','delmaps.shp','Capped',delmap1,'FLU',delmap2);

newmap = blank_col([-0.5 0.5],[-0.05 0.05]);

figure
axes('position',[0 0.1 0.5 0.85]);
patch('faces',faces,'vertices',vert,'FaceVertexCData',delmap1);shading flat;hold on
title('Capped - Base (TN mg/L)');
axis off; axis equal;
colormap(newmap)
caxis([-0.5 0.5]);
cb = colorbar('southoutside');
set(cb,'position',[0.1 0.1 0.3 0.01]);
xlim([381881.661710278          406797.244050742]);
ylim([6450432.84244702          6482200.20993111]);


axes('position',[0.5 0.1 0.5 0.85]);

patch('faces',faces,'vertices',vert,'FaceVertexCData',delmap2);shading flat;hold on
title('FLU - Base (TN mg/L)');
axis off; axis equal;
colormap(newmap)
caxis([-0.5 0.5]);
cb1 = colorbar('southoutside');
set(cb1,'position',[0.6 0.1 0.3 0.01]);
xlim([381881.661710278          406797.244050742]);
ylim([6450432.84244702          6482200.20993111]);


set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'centimeters');
xSize = 20;
ySize = 20;
xLeft = (21-xSize)/2;
yTop = (30-ySize)/2;
set(gcf,'paperposition',[0 0 xSize ySize])

saveas(gcf,'TN DELMAP Working Draft.jpg');