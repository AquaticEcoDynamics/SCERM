clear all; close all;

addpath(genpath('Functions'));



ncfile = 'K:\Peel_Scenarios\run_2016_2017_Tidal_Test.nc';
%ncfile = 'Z:\Busch\Studysites\Peel\2018_Modelling\Peel_WQ_Model_v5_2016_2017_3D_Murray\Output\sim_2016_2017_Open.nc';
outdir = 'Y:\Peel Final Report\Budget\run_2016_2017_Tidal_Test\';
if exist(outdir,'dir')
    mkdir(outdir);
end
disp(ncfile);


v_all = tfv_infonetcdf(ncfile);
%vars = v_all(23:end);
vars = v_all([20 21 23:end]);
%outdir = 'I:\Peel\Matfiles/Peel_WQ_Model_v5_2016_2017_3D_Murray/';

%load Export_Locations.mat;
shp = shaperead('GIS/Regions.shp');
%shp = shp_A(4);

data = tfv_readnetcdf(ncfile,'names',{'idx2';'idx3';'cell_X';'cell_Y';'cell_A';'NL';'layerface_Z';'cell_Zb'});clear functions;
names = tfv_infonetcdf(ncfile);
mdata = tfv_readnetcdf(ncfile,'time',1);clear functions;
Time = mdata.Time;
%sites = {'Currency Creek';'Lake Albert WLR';'Lake Alex Middle'};

%______________________________________________________________




for i = 1:length(shp)
    
    
    %     for j = 1:length(data.cell_X)
    %
    %         dist(j) = sqrt(power(abs(data.cell_X(j)-shp(i).X),2) + power(abs(data.cell_Y(j)-shp(i).Y),2));
    %
    %     end
    inpol = inpolygon(data.cell_X,data.cell_Y,shp(i).X,shp(i).Y);
    %    inpol = find(dist <= shp(i).Radius);
    
    ttt = find(inpol == 1);
    fsite(i).theID = ttt;
    fsite(i).Name = shp(i).Name;
    
    
end


% vars = {...
%     'WQ_DIAG_TOT_TOC';...
%     'WQ_OGM_DOC';...
%     'WQ_OGM_POC';...
%     'WQ_OGM_DOCR';...
%     'WQ_OGM_DOPR';...
%     'WQ_OGM_CPOM';...
%     'WQ_PHY_GRN';...
%     'WQ_PHY_CRYPT';...
%     'WQ_PHY_DIATOM';...
%     'WQ_PHY_DINO';...
%     'WQ_PHY_BGA';...
%     'WQ_MAG_CHAETOMORPHA';...
%     'WQ_DIAG_PHY_TPHYS';...
%     'WQ_DIAG_BIV_TBIV';...
%     'WQ_DIAG_MAC_MAC';...
%     'WQ_DIAG_MAC_MAC_AG';...
%     'WQ_DIAG_MAC_MAC_BG';...
%     'WQ_DIAG_PHY_MPB';...
%     'WQ_DIAG_MAG_TMALG';...
%     'WQ_DIAG_PHY_GPP';...
%     'WQ_DIAG_PHY_NCP';...
%     'WQ_DIAG_PHY_CUP';...
%     'WQ_DIAG_MAG_GPP';...
%     'WQ_DIAG_SDF_FSED_POC';...
%     'WQ_DIAG_SDF_FSED_DOC';...
%     'WQ_DIAG_SDF_FSED_DIC';...
%     'WQ_DIAG_SDF_FSED_CH4';...
%     'WQ_DIAG_OGM_PSED_POC';...
%     'WQ_DIAG_PHY_PSED_PHY';...
%     'WQ_DIAG_BIV_NMP?';...
%     'WQ_DIAG_PHY_BPP?';...
%     'WQ_OXY_OXY';...
%     'WQ_DIAG_SDF_FSED_OXY';...
%     'WQ_DIAG_OXY_SED_OXY';...
%     'WQ_DIAG_OXY_ATM_OXY_FLUX';...
%     'WQ_DIAG_BIV_NMP';...
%     'WQ_DIAG_PHY_BPP';...
%     'WQ_DIAG_TOT_TN';...
%     'WQ_NIT_AMM';...
%     'WQ_NIT_NIT';...
%     'WQ_OGM_DON';...
%     'WQ_OGM_PON';...
%     'WQ_OGM_DONR';...
%     'WQ_OGM_CPOM';...
%     'WQ_MAG_CHAETOMORPHA_IN';...
%     'WQ_DIAG_MAG_IN';...
%     'WQ_MAG_CHAETOMORPHA_IN_BEN';...
%     'WQ_DIAG_PHY_MPB';...
%     'WQ_DIAG_MAC_MAC?';...
%     'WQ_DIAG_SDF_FSED_AMM';...
%     'WQ_DIAG_SDF_FSED_NIT';...
%     'WQ_DIAG_SDF_FSED_N2O';...
%     'WQ_DIAG_SDF_FSED_PON';...
%     'WQ_DIAG_SDF_FSED_DON';...
%     'WQ_DIAG_NIT_SED_AMM';...
%     'WQ_DIAG_NIT_SED_NIT';...
%     'WQ_DIAG_NIT_NITRIF';...
%     'WQ_DIAG_NIT_DENIT';...
%     'WQ_DIAG_NIT_ANAMMOX';...
%     'WQ_DIAG_NIT_DNRA';...
%     'WQ_DIAG_PHY_NUP_NO3';...
%     'WQ_DIAG_PHY_NUP_NH4';...
%     'WQ_DIAG_MAG_NUP';...
%     'WQ_DIAG_OGM_PSED_PON';...
%     'WQ_DIAG_OGM_PSED_CPOM';...
%     'WQ_DIAG_BIV_NMP?';...
%     'WQ_DIAG_PHY_BPP';...
%     'WQ_SIL_RSI';...
%     'WQ_DIAG_SDF_FSED_RSI';...
%     'WQ_DIAG_SIL_SED_RSI';...
%     'WQ_PHS_FRP';...
%     'WQ_PHS_FRP_ADS';...
%     'WQ_OGM_DOP';...
%     'WQ_OGM_POP';...
%     'WQ_OGM_CPOM';...
%     'WQ_DIAG_PHY_IP';...
%     'WQ_MAG_CHAETOMORPHA_IP';...
%     'WQ_DIAG_MAG_IP';...
%     'WQ_MAG_CHAETOMORPHA_IP_BEN';...
%     'WQ_DIAG_PHY_MPB';...
%     'WQ_DIAG_MAC_MAC?';...
%     'WQ_DIAG_SDF_FSED_FRP';...
%     'WQ_DIAG_SDF_FSED_POP';...
%     'WQ_DIAG_SDF_FSED_DOP';...
%     'WQ_DIAG_PHS_SED_FRP';...
%     'WQ_DIAG_OGM_PSED_POP';...
%     'WQ_DIAG_OGM_PSED_CPOM';...
%     'WQ_DIAG_PHY_PUP';...
%     'WQ_DIAG_MAG_PUP';...
%     'WQ_DIAG_BIV_NMP';...
%     'WQ_DIAG_PHY_BPP';...
%     'WQ_TRC_AGE';...
%     'WQ_DIAG_TOT_TSS';...
%     'WQ_NCS_SS1';...
%     'WQ_NCS_SS2';...
%     'WQ_NCS_SS1_SED';...
%     'WQ_NCS_SS2_SED';...
%     'WQ_DIAG_NCS_SS1_VVEL';...
%     'WQ_DIAG_NCS_SS2_VVEL';...
%     'WQ_DIAG_NCS_SS_SED';...
%     };

for i = 1:length(vars)
    
    if sum(strcmpi(names,vars{i})) == 1
        
        disp(['Importing ',vars{i}]);
        
        
        mod = tfv_readnetcdf(ncfile,'names',vars(i));clear functions;
        tic
        for j = 1:length(shp)
            savedata = [];
            
            findir = [outdir,shp(j).Name,'/'];
            if ~exist(findir,'dir')
                mkdir(findir);
            end
            %if ~exists([findir,vars{i},'.mat'],'file')
            
            savedata.X = data.cell_X(fsite(j).theID);
            savedata.Y = data.cell_Y(fsite(j).theID);
            
            
            
            
            if strcmpi(vars{i},'H') == 1 | strcmpi(vars{i},'D') == 1 | strcmpi(vars{i},'cell_A') == 1
                savedata.(vars{i}) = mod.(vars{i})(fsite(j).theID,:);
            else
                for k = 1:length(fsite(j).theID)
                    
                    ss = find(data.idx2 == fsite(j).theID(k));
                    
                    surfIndex = min(ss);
                    botIndex = max(ss);
                    savedata.(vars{i}).Top(k,:) = mod.(vars{i})(surfIndex,:);
                    savedata.(vars{i}).Bot(k,:) = mod.(vars{i})(botIndex,:);
                    
                    cell_num = fsite(j).theID(k);
                    cell_Area = data.cell_A(cell_num);
                    num_layers = data.NL(cell_num);
                    startlayer = sum(data.NL(1:cell_num-1))+cell_num;
                    endlayer = startlayer + num_layers;
                    layer_depths = data.layerface_Z(startlayer:endlayer,:);
                    
                    
                    for l = 1:length(ss)
                        
                        vol(l,:) = (layer_depths(l,:) - layer_depths(l+1,:)) * cell_Area;
                        mass(l,:) = vol(l) * mod.(vars{i})(ss(l),:);
                        
                    end
                    savedata.(vars{i}).Column(k,:) = sum(mass,1);
                    savedata.(vars{i}).Area(k) = cell_Area;
                    
                    clear vol mass;
                end
            end
            
            savedata.Time = Time;
            
            save([findir,vars{i},'.mat'],'savedata','-mat','-v7.3');
            clear savedata;
            % end
        end
        toc
    end
end

% end



