clear all; close all;

load ../modeltools/matfiles/swan.mat;


filename = 'Biomass_species_level_data.xlsx';
sheetname = 'Total';

[snum,sstr] = xlsread(filename,sheetname,'A2:U85149');

mdate = datenum(sstr(:,1),'dd/mm/yyyy');

sites = sstr(:,6);

groups = sstr(:,14);

thedata = snum(:,18);


usites = unique(sites);
ugroups = unique(groups);

for i = 1:length(usites)
    sss = find(strcmpi(sites,usites{i}) ==1);
    
    
    for j = 1:length(ugroups)
        
        ttt = find(strcmpi(groups(sss),ugroups{j}) == 1);
        
        if ~isempty(ttt)
            
            bio.(usites{i}).(ugroups{j}).Date = mdate(sss(ttt));
            bio.(usites{i}).(ugroups{j}).Data = thedata(sss(ttt));
            bio.(usites{i}).(ugroups{j}).Depth(1:length(ttt),1) = 0;
            
        end
    end
end
    
sites = fieldnames(bio);

swansites = fieldnames(swan);

for i = 1:length(sites)
    
    sss = find(strcmpi(swansites,sites{i})==1);
    
    if isempty(sss)
        disp('No sites found....');
        stop;
    else
        vars = fieldnames(bio.(sites{i}));
        
        for j = 1:length(vars)
            
            
            thevar = ['WQ_PHY_',vars{j}];
            
            
            swanvars = fieldnames(swan.(sites{i}));
            
            swan.(sites{i}).(thevar).Date = bio.(sites{i}).(vars{j}).Date;
            swan.(sites{i}).(thevar).Data = bio.(sites{i}).(vars{j}).Data;
            swan.(sites{i}).(thevar).Depth = bio.(sites{i}).(vars{j}).Depth;
            swan.(sites{i}).(thevar).X = swan.(sites{i}).(swanvars{1}).X;
            swan.(sites{i}).(thevar).Y = swan.(sites{i}).(swanvars{1}).Y;
            swan.(sites{i}).(thevar).Variable_Name = thevar;
            swan.(sites{i}).(thevar).Units = {'mmol/m3'};
        end
    end
end

save swan.mat swan -mat;
        
    