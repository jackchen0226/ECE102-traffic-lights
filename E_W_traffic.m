function [NS_ped_on, EW_ped_on] = E_W_traffic(NS_ped_on_before, EW_ped_on_before, green_light_timing, yellow_light_timing, ljHandle)
% Runs the East and West traffic and the East and West pedestrian lights
% Inputs:
%       NS_ped_on : Boolean to run East/West pedestrian lights
%       EW_ped_on : Boolean to run North/South pedestrian lights
%       green_light_timings : Time in seconds of duration of green lights
%       yellow_light_timings : Time in seconds of duration of yellow lights
%       ljHandle : Handle for LabJack U3, necesary for I/O.
% Output:
%       EW_ped_on : Boolean, if button for East/West
%       NS_ped_on : Boolean, if button for North/South
% TODO:
%       
