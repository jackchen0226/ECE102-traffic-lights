function [NS_ped_on, EW_ped_on] = N_S_traffic(NS_ped_on_before, EW_ped_on_before, green_light_timing, yellow_light_timing, ljHandle)
% Runs the North and South traffic and the East and West pedestrian lights
% Inputs:
%       NS_ped_on : Boolean to run East/West pedestrian lights
%       EW_ped_on : Boolean to run North/South pedestrian lights
%       green_light_timings : Time in seconds of duration of green lights
%       yellow_light_timings : Time in seconds of duration of yellow lights
%       ljHandle : Handle for LabJack U3, necesary for I/O.
% Output:
%       EW_ped_on : Boolean, if button for East/West 
%       NS_ped_on : Boolean, if button for North/Souths

    ljud_Constants
    lj_dig_bit = LJ_ioPUT_DIGITAL_BIT;
    EW_bools = EW_ped_on_before;
    % Turn on green, off red and yellow lights. Wait for green_light_timing
    % amount of seconds. Also turn on white and off red pedestrian lights
    % if button was pressed previously.
    NS_green(true, ljHandle, lj_dig_bit)
    NS_yellow(false, ljHandle, lj_dig_bit)
    NS_red(false, ljHandle, lj_dig_bit)
    if (NS_ped_on_before)
        EW_ped_white(true, ljHandle, lj_dig_bit) % Test
        EW_ped_red(false, ljHandle, lj_dig_bit) % Implement
    end
    [NS_ped_on_1, EW_ped_on_1] = timings(green_light_timing, ljHandle);
    EW_bools = [EW_bools EW_ped_on_1];
    NS_bools = NS_ped_on_1;
    
    % Turn off green, on yellow lights. Wait for yellow_light_timing amount
    % of seconds. Also turn off white and flash red pedestrian lights if
    % button was pressed previously.
    NS_green(false, ljHandle, lj_dig_bit)
    NS_yellow(true, ljHandle, lj_dig_bit)
    if (NS_ped_on_before)
        EW_ped_white(false, ljHandle, lj_dig_bit) % Test
        [NS_ped_on_2, EW_ped_on_2] = EW_ped_red(true, ljHandle, lj_dig_bit, yellow_light_timing); % Implement
    else
        [NS_ped_on_2, EW_ped_on_2] = timings(yellow_light_timing, ljHandle);
    end
    EW_bools = [EW_bools, EW_ped_on_2];
    NS_bools = [NS_bools, NS_ped_on_2];
    
    % Turn off yellow, on red. Then set N_S_ped_light to false
    NS_yellow(false, ljHandle, lj_dig_bit)
    NS_red(true, ljHandle, lj_dig_bit)
    
    % Check which booleans to pass on, if any of the button presses during
    % the 2 runs of timing were hit, then return a true value.
    EW_ped_on = or(EW_bools);
    NS_ped_on = or(NS_bools);
end