
function [x,y,z] = generator(pollutant_input,B)

load uspollutionnums.dat
load Dates_Index.dat
if pollutant_input == "NO2"   %finds no2 and aqi means and vectors
    l = length(B);
    x = zeros(1,l); %x vector, preallocates x vector 
    y = zeros(1,l); %y vector
    z = zeros(1,l); %z vector which will hold AQI data
    sum = 0;
    sum2 = 0;
    count = 0;
    j = 1; %used to index into x and y vector
    date = Dates_Index(B(1));
    x(1) = date;
    for i=1:l
        date_new = Dates_Index(B(i)); %class(date) is string
        no2_temp = uspollutionnums(B(i),1);
        aqi_temp = uspollutionnums(B(i),2);
        if date_new == date
            sum = sum + no2_temp;
            sum2 = sum2 + aqi_temp;
            count = count+1;
        else
            avg = sum/count;
            avg2 = sum2/count;
            y(j) = avg;
            z(j) = avg2;
            j = j+1;
            
            sum = no2_temp;
            sum2 = aqi_temp;
            count = 1;
            x(j) = date_new;
        end
        date = date_new;
    end
    %remove unneeded stuffs from x vector
    x(j+1:end) = [];
    y(j+1:end) = [];
    z(j+1:end) = [];

elseif pollutant_input == "O3" 
    l = length(B);
    x = zeros(1,l); %x vector, preallocates x vector 
    y = zeros(1,l); %y vector
    z = zeros(1,l); %z vector which will hold AQI data
    sum = 0;
    sum2 = 0;
    count = 0;
    j = 1; %used to index into x and y vector
    date = Dates_Index(B(1));
    x(1) = date;
    for i=1:l
        date_new = Dates_Index(B(i)); %class(date) is string
        o3_temp = uspollutionnums(B(i),3);
        aqi_temp = uspollutionnums(B(i),4);
        if date_new == date
            sum = sum + o3_temp;
            sum2 = sum2 + aqi_temp;
            count = count+1;
        else
            avg = sum/count;
            avg2 = sum2/count;
            y(j) = avg;
            z(j) = avg2;
            j = j+1;
            
            sum = o3_temp;
            sum2 = aqi_temp;
            count = 1;
            x(j) = date_new;
        end
        date = date_new;
    end
    %remove unneeded stuffs from x vector
    x(j+1:end) = [];
    y(j+1:end) = [];
    z(j+1:end) = [];
    
    
elseif pollutant_input == "SO2" 
    load SO2_AQI.dat    %creates SO2_AQI vector
    l = length(B);
    x = zeros(1,l); %x vector, preallocates x vector 
    y = zeros(1,l); %y vector
    z = zeros(1,l); %z vector which will hold AQI data
    sum = 0;
    sum2 = 0;
    count = 0;
    count2 = 0;
    j = 1; %used to index into x and y vector
    j2 = 1;
    date = Dates_Index(B(1));
    x(1) = date;
    for i=1:l
        date_new = Dates_Index(B(i)); %class(date) is string
        so2_temp = uspollutionnums(B(i),5);
        aqi_temp = SO2_AQI(B(i),1);
        if date_new == date
            sum = sum + so2_temp;
            count = count+1;
            if aqi_temp ~= -1
                sum2 = sum2 + aqi_temp;
                count2 = count2+1;
            end
        else
            avg = sum/count;
            y(j) = avg;
            j = j+1;
            if aqi_temp ~= -1
                avg2 = sum2/count2;
                z(j2) = avg2;
                j2 = j2+1;
                sum2 = aqi_temp;
                count2 = 1;
            end
            sum = so2_temp;
            count = 1;
            x(j) = date_new;
        end
        date = date_new;
    end
    %remove unneeded stuffs from x vector
    x(j+1:end) = [];
    y(j+1:end) = [];
    z(j2+1:end) = [];
    
    
elseif pollutant_input == "CO"
    load CO_AQI.dat    %creates CO_AQI vector
    l = length(B);
    x = zeros(1,l); %x vector, preallocates x vector 
    y = zeros(1,l); %y vector
    z = zeros(1,l); %z vector which will hold AQI data
    sum = 0;
    sum2 = 0;
    count = 0;
    count2 = 0;
    j = 1; %used to index into x and y vector
    j2 = 1;
    date = Dates_Index(B(1));
    x(1) = date;
    for i=1:l
        date_new = Dates_Index(B(i)); %class(date) is string
        co_temp = uspollutionnums(B(i),6);
        aqi_temp = CO_AQI(B(i),1);
        if date_new == date
            sum = sum + co_temp;
            count = count+1;
            if aqi_temp ~= -1
                sum2 = sum2 + aqi_temp;
                count2 = count2+1;
            end
        else
            avg = sum/count;
            y(j) = avg;
            j = j+1;
            if aqi_temp ~= -1
                avg2 = sum2/count2;
                z(j2) = avg2;
                j2 = j2+1;
                sum2 = aqi_temp;
                count2 = 1;
            end
            sum = co_temp;
            count = 1;
            x(j) = date_new;
        end
        date = date_new;
    end
    %remove unneeded stuffs from x vector
    x(j+1:end) = [];
    y(j+1:end) = [];
    z(j2+1:end) = [];
end


end