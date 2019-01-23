
function [states_alphabetical, counties_alphabetical, cities_alphabetical,...
    state_string_array, county_string_array, city_string_array,...
    addone] = initialize
fidn = fopen('uspollutionnums.txt');
fidd = fopen('uspollutionnums.dat','w');
fidi = fopen('cities.txt');
fids = fopen('states.txt');
fidc = fopen('counties.txt');
fidt = fopen('dates.txt');
fid_coaqi = fopen('COAQI.txt');
fid_so2aqi = fopen('SO2AQI.txt');
 
fgetl(fidn);
aline = fgetl(fidn);

%while loop below writes all numerical data into a .dat file
while aline ~= -1
    [first, last] = strtok(aline);
    NO2_mean = str2double(first);
    [first, last] = strtok(last);
    NO2_AQI = str2double(first);
    [first, last] = strtok(last);
    O3_mean = str2double(first);
    [first, last] = strtok(last);
    O3_AQI = str2double(first);
    [first, last] = strtok(last);
    SO2_mean = str2double(first);
    CO_mean = str2double(strtrim(last));
  
    fprintf(fidd,'%12f%12f%12f%12f%12f%12f\n', NO2_mean, NO2_AQI,...
        O3_mean, O3_AQI, SO2_mean, CO_mean);
    aline = fgetl(fidn);
end


% this loops through the cities to put them in a string array
fgetl(fidi);
aline = fgetl(fidi);
city_string_array = strings(1,1048575);
city_cell_array = cell(1,1048575);
i = 1;
while aline ~= -1
    city_string_array(i) = string(aline);
    city_cell_array{i} = aline;
    aline = fgetl(fidi);
    i = i+1;
end



% %this loops through the states to put them in a string array
fgetl(fids);
aline = fgetl(fids);
state_string_array = strings(1,1048575);
state_cell_array = cell(1,1048575);
i = 1;
while aline ~= -1
    state_string_array(i) = string(aline);
    state_cell_array{i} = aline;
    aline = fgetl(fids);
    i = i+1;
end


%this loops through the counties to put them in a string array
fgetl(fidc);
aline = fgetl(fidc);
county_string_array = strings(1,1048575);
county_cell_array = cell(1,1048575);
i = 1;
while aline ~= -1
    county_string_array(i) = string(aline);
    county_cell_array{i} = aline;
    aline = fgetl(fidc);
    i = i+1;
end

%CREATES the alpabetical list for states
states_alphabetical = categories(categorical(state_cell_array))';
counties_alphabetical = categories(categorical(county_cell_array))';
cities_alphabetical = categories(categorical(city_cell_array))';

%add 'Select One' to cell array
addone = cell(1,38);
addone(2:38) = states_alphabetical;
addone(1) = {'Select One'};


fid_coaqii = fopen('CO_AQI.dat','w');
fgetl(fid_coaqi);
aline = fgetl(fid_coaqi);
for i = 1:1048575
    if isempty(aline)
        CO_AQI = -1;  % !! whenever CO_AQI = -1 know it is just a placeholder!!
    else
        CO_AQI = str2double(aline);
    end
    fprintf(fid_coaqii,'%d\n',CO_AQI);
    aline = fgetl(fid_coaqi);
end



fid_so2aqii = fopen('SO2_AQI.dat','w');
fgetl(fid_so2aqi);
aline = fgetl(fid_so2aqi);
for i = 1:1048575
    if isempty(aline)
        SO2_AQI = -1; % !! whenever SO2_AQI = -1 know it is just a placeholder!
    else
        SO2_AQI = str2double(aline);
    end
    fprintf(fid_so2aqii,'%d\n',SO2_AQI);
    aline = fgetl(fid_so2aqi);
end 



% %this loops through the dates to put them in a string array
fid_dates_index = fopen('Dates_Index.dat','w');
fgetl(fidt);
aline = fgetl(fidt);
while aline ~= -1
    [m, last] = strtok(aline,'/');
    m = str2double(m);
    [d, last] = strtok(last,'/');
    d = str2double(d);
    last = strrep(last,' ','');
    y = str2double(last(2:3));
    
    days = 365*y;
    for i = 1:m-1
        if i==2
            days = days+28;
        elseif i==1||i==3||i==5||i==7||i==8||i==10||i==12
            days = days+31;
        elseif i==4||i==6||i==9||i==11
            days = days+30;
        end
    end
    days = days+d-1;
    
    %leap years
    if y > 8 
        days = days+3;
    elseif y==8 && m>2 
        days = days+3;
    elseif y > 4
        days = days+2;
    elseif y==4 && m>2
        days = days+2;
    elseif y > 2
        days = days+1;
    elseif y==0 && m>2 
        days = days+1;
    end
    index = days+1;
  
    fprintf(fid_dates_index,'%d\n',index);
    aline = fgetl(fidt);
end

end
