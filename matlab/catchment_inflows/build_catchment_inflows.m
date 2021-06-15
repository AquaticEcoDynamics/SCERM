clear all; close all;

addpath(genpath('../Inflows'));

shp = shaperead('../../../Source_to_SCERM/Maps/InflowPoints.shp');

inflowfile = dir(['../Inflows/BCs/Flow/','*.csv']);

load('data.mat');

outdir = 'FLU/';

if ~exist(outdir,'dir')
    mkdir(outdir);
end

for i = 1:length(inflowfile)
    
    fname = regexprep(inflowfile(i).name,'.csv','');
    
    inflow.(fname) = tfv_readBCfile(['../Inflows/BCs/Flow/',inflowfile(i).name]);
    
end

thetime = datenum(2007,01,01):01:datenum(2019,01,01);


inflownames = {...
    'Bayswater_Inflow',...
    'Bennett_Inflow',...
    'Canning_Inflow',...
    'Ellenbrook_Inflow',...
    'Helena_Inflow',...
    'Jane_Inflow',...
    'Susannah_Inflow',...
    'Upper_Swan_Inflow_2000',...
    };




catname = {...
    'Bayswater',...
    'Bennett Brook',...
    'Upper Canning',...
    'Ellen Brook',...
    'Helena River',...
    'Jane Brook',...
    'Susannah',...
    'Millendon',...
    };

vars = fieldnames(inflow.Bayswater_Inflow);


catsites = fieldnames(data);

% for i = 1:length(catsites)
%
%     cs = catsites{i};
%
%     isfound = 0;
%
%     for j = 1:length(shp)
%         ss = shp(j).nNames;
%
%         if strcmpi(ss,cs) == 1
%             isfound = 1;
%         end
%     end
%     if ~isfound
%         stop
%     end
% end
%

for i = 1:length(shp)
    
    sss = find(strcmpi(catname,shp(i).Nearest8) == 1);
    
    
    thesite = shp(i).nNames;
    theBC = inflownames{sss};
    
    
    outfile = [outdir,shp(i).SubCat,'.csv'];
    fid = fopen(outfile,'wt');
    
    for j = 1:length(vars)
        if j == length(vars)
            fprintf(fid,'%s\n',vars{j});
        else
            if j == 1
                fprintf(fid,'ISOTime,');
            else
                
                fprintf(fid,'%s,',vars{j});
            end
        end
    end
    
    % Now the write loop
    
    for k = 1:length(thetime)
        
        index_bc = find(inflow.(theBC).Date == thetime(k));
        index_cat = find(data.(thesite).Flow.Date == thetime(k));
        
        TN = inflow.(theBC).Amm(index_bc) + ...
            inflow.(theBC).Nit(index_bc) + ...
            inflow.(theBC).DON_T(index_bc) + ...
            inflow.(theBC).PON_T(index_bc);
        
        TP = inflow.(theBC).FRP(index_bc) + ...
            inflow.(theBC).OP(index_bc);
        
        
        fprintf(fid,'%s,',datestr(thetime(k),'dd/mm/yyyy HH:MM:SS'));
        
        for j = 2:length(vars)
            
            pvar = 0;
            
            switch vars{j}
                case 'Flow'
                    pvar = data.(thesite).Flow.Data(index_cat);
                case 'Amm'
                    theconv = inflow.(theBC).Amm(index_bc) / TN;
                    pvar = data.(thesite).TN.Data(index_cat) * theconv;
                case 'Nit'
                    theconv = inflow.(theBC).Nit(index_bc) / TN;
                    pvar = data.(thesite).TN.Data(index_cat) * theconv; 
                case 'DON_T'
                    theconv = inflow.(theBC).DON_T(index_bc) / TN;
                    pvar = data.(thesite).TN.Data(index_cat) * theconv;
                case 'PON_T'
                    theconv = inflow.(theBC).DON_T(index_bc) + ...
                        inflow.(theBC).Nit(index_bc) + ...
                        inflow.(theBC).Amm(index_bc);
                    pvar = data.(thesite).TN.Data(index_cat) - theconv;                    
                    
                case 'FRP'
                    theconv = inflow.(theBC).FRP(index_bc) / TP;
                    pvar = data.(thesite).TP.Data(index_cat) * theconv;
                    
                    theFRP = pvar;
                    
                case 'OP'
                    theconv = inflow.(theBC).FRP(index_bc) * 2;
                    %pvar = data.(thesite).TP.Data(index_cat) - theconv;
                    
                    pvar = data.(thesite).TP.Data(index_cat) - theFRP - (theFRP*0.1);
                     clear theFRP;
                    
                case 'TN'
                    %theconv = inflow.(theBC).FRP(index_bc) * 2;
                    pvar = data.(thesite).TN.Data(index_cat);
                case 'TP'
                    %theconv = inflow.(theBC).FRP(index_bc) * 2;
                    pvar = data.(thesite).TP.Data(index_cat);                    
                    
                otherwise
                    
                    pvar =inflow.(theBC).(vars{j})(index_bc);
            end
            
            pvar(pvar < 0) = 0;
            
            if j == length(vars)
                fprintf(fid,'%4.4f\n',pvar);
            else
                fprintf(fid,'%4.4f,',pvar);
            end
        end
    end
    
    fclose(fid);
end
                    
                    
plot_bcfiles(outdir)                   
            
            
            
            
            
