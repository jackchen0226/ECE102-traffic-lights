function [NS_ped_on, EW_ped_on] = N_S_traffic(NS_ped_on_before, EW_ped_on_before, green_timing, yellow_timing, ljHandle)
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
    lj_dig = LJ_ioPUT_DIGITAL_BIT;
    lj_dac = LJ_ioPUT_DAC;
    NS_bools = NS_ped_on_before;
    EW_bools = [];
    
    % Turn on green, off red and yellow lights. Wait for green_light_timing
    % amount of seconds. Also turn on white and off red pedestrian lights
    % if button was pressed previously.
    NS_green(true, ljHandle, lj_dig)
    NS_yellow(false, ljHandle, lj_dig)
    NS_red(false, ljHandle, lj_dig)
    if (EW_ped_on_before)
        EW_ped_white(true, ljHandle, lj_dig) % Test
        EW_ped_red(false, ljHandle, lj_dac) % Implement
    end
    [NS_ped_on_1, EW_ped_on_1] = timings(green_timing, ljHandle);
    EW_bools = [EW_bools, EW_ped_on_1];
    NS_bools = [NS_bools, NS_ped_on_1];
    
    % Turn off green, on yellow lights. Wait for yellow_light_timing amount
    % of seconds. Also turn off white and flash red pedestrian lights if
    % button was pressed previously.
    NS_green(false, ljHandle, lj_dig)
    NS_yellow(true, ljHandle, lj_dig)
    if (EW_ped_on_before)
        EW_ped_white(false, ljHandle, lj_dig) % Test
        [NS_ped_on_2, EW_ped_on_2] = EW_ped_red(true, ljHandle, lj_dac, lj_dig, yellow_timing);
    else
        [NS_ped_on_2, EW_ped_on_2] = timings(yellow_timing, ljHandle);
    end
    EW_bools = [EW_bools, EW_ped_on_2];
    NS_bools = [NS_bools, NS_ped_on_2];
    
    % Turn off yellow, on red. Then set N_S_ped_light to false
    NS_yellow(false, ljHandle, lj_dig)
    NS_red(true, ljHandle, lj_dig)
    
    % Check which booleans to pass on, if any of the button presses during
    % the 2 runs of timing were hit, then return a true value.
    EW_ped_on = EW_bools(1) || EW_bools(2);
    NS_ped_on = NS_bools(1) || NS_bools(2) || NS_bools(3);
end