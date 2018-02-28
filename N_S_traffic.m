function E_W_ped_on = N_S_traffic(N_S_ped_on, green_light_timing, yellow_light_timing)
% Runs the North and South traffic and the East and West pedestrian lights
% Inputs:
%       N_S_ped_on : Boolean, if true then runs East/West pedestrian lights
%       green_light_timings : Time in seconds of duration of green lights
%       yellow_light_timings : Time in seconds of duration of yellow lights

    % Turn on green, off red and yellow lights. Wait for green_light_timing
    % amount of seconds. Also turn on white and off red pedestrian lights
    % if button was pressed previously.
    NS_green(true)
    NS_yellow(false)
    NS_red(false)
    if (N_S_ped_on)
        EW_ped_white(true)
        EW_ped_red(false)
    end
    [~, E_W_ped_on] = timings(green_light_timing, 'e');
    
    % Turn off green, on yellow lights. Wait for yellow_light_timing amount
    % of seconds. Also turn off white and flash red pedestrian lights if
    % button was pressed previously.
    NS_green(false)
    NS_yellow(true)
    if (N_S_ped_on)
        EW_ped_white(false)
        EW_ped_red(true, 'f')
    end
        
        
     
    
end