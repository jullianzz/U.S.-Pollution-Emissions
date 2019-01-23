a = exist('states_alphabetical');
if a == 0
    [states_alphabetical, counties_alphabetical, cities_alphabetical,...
        state_string_array, county_string_array, city_string_array,...
        addone] = initialize;  %calls function to initialize everything
end

%call appdesigner to retrieve the values of user entered state, county,
%city, and pollutant type. All need to be read in as strings!


%the code below will attempt to take the three parameters that the user
%enters and generates the appropriate x and y vectors to be plotted
%for the state that they enter, where stateinput = user chosen state
%assuming that stateinput is a string!!! 



choice_1_vec = find(state_string_array == stateinput);
choice_2_vec = find(county_string_array == countyinput);
choice_3_vec = find(city_string_array == cityinput);



%this finds the values all three vectors have in common
    A = intersect(choice_1_vec, choice_2_vec);
    B = intersect(A, choice_3_vec); 
%B is the vector of indices

[x,y,z] = generator(pollutant_input,B);  














