function [N_S_ped_on, E_W_ped_on] = N_S_traffic(N_S_ped_on, E_W_ped_on_before, green_light_timing, yellow_light_timing, ljHandle)
% Runs the North and South traffic and the East and West pedestrian lights
% Inputs:
%       N_S_ped_on : Boolean to run East/West pedestrian lights
%       E_W_ped_on : Boolean to run North/South pedestrian lights
%       green_light_timings : Time in seconds of duration of green lights
%       yellow_light_timings : Time in seconds of duration of yellow lights
%       ljHandle : Handle for LabJack U3, necesary for I/O.
% Output:
%       E_W_ped_on : Boolean, if button for East/West 

% TODO: Add more implementations
%       Fix light function implementations
%       pass on ljHandle

    ljud_Constants
    lj_dig_bit = LJ_ioPUT_DIGITAL_BIT;
    E_W_ped_on = E_W_ped_on_before;
    % Turn on green, off red and yellow lights. Wait for green_light_timing
    % amount of seconds. Also turn on white and off red pedestrian lights
    % if button was pressed previously.
    NS_green(true, ljHandle, lj_dig_bit)
    NS_yellow(false, ljHandle, lj_dig_bit)
    NS_red(false, ljHandle, lj_dig_bit)
    if (N_S_ped_on)
        EW_ped_white(true, ljHandle, lj_dig_bit) % Implement
        EW_ped_red(false, ljHandle, lj_dig_bit) % Implement
    end
    [N_S_ped_on_1, E_W_ped_on] = timings(green_light_timing, ljHandle, 'e');
    
    % Turn off green, on yellow lights. Wait for yellow_light_timing amount
    % of seconds. Also turn off white and flash red pedestrian lights if
    % button was pressed previously.
    NS_green(false, ljHandle, lj_dig_bit)
    NS_yellow(true, ljHandle, lj_dig_bit)
    if (N_S_ped_on)
        EW_ped_white(false, ljHandle, lj_dig_bit) % Implement
        EW_ped_red(true, ljHandle, lj_dig_bit, yellow_light_timing) % Implement
    end
        [N_S_ped_on_2, E_W_ped_on] = timings(yellow_light_timing, ljHandle, 'e');
    
    % Turn off yellow, on red. Then set N_S_ped_light to false
    NS_yellow(false, ljHandle, lj_dig_bit)
    NS_red(true, ljHandle, lj_dig_bit)
    N_S_ped_on = false;
    if (N_S_ped_on || N_S_ped_on_1 || N_S_ped_on_2)
        N_S_ped_on = true;
    end
    
    
end