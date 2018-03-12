clear global

% Load labJack UD library and initialize LabJack constants
ljud_LoadDriver
ljud_Constants

% Open the first found LabJack U3
[Error, ljHandle] = ljud_OpenLabJack(LJ_dtU3,LJ_ctUSB,'1',1);
Error_Message(Error)

% Reset to factory settings
Error = ljud_ePut(ljHandle, LJ_ioPIN_CONFIGURATION_RESET,0,0,0);
Error_Message(Error)

% Set Extended I/O to 0 volts (off)
Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,9,0,0);
Error_Message(Error)
Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,8,0,0);
Error_Message(Error)

% Add wrapper functions to path
addpath('LJ_controls_to_lights')

%[user_response, debug_mode, speed] = prompt_user();

SPEED_MULTIPLIER = speed; % Constant for speed that every timing is divided by

% Initialized variables for light timings, need to find these later
green_timing = 45.0 / SPEED_MULTIPLIER;
yellow_timing = 3.0; % Unchanging

% MAIN SCRIPT
% Various light tests
%[NS, EW] = E_W_traffic(false, false, 5, 3, ljHandle)
%EW_ped_red(true, ljHandle, LJ_ioPUT_DAC, LJ_ioPUT_DIGITAL_BIT, 5)
%pause(2)
%EW_red(false, ljHandle, LJ_ioPUT_DIGITAL_BIT)


% DAC
%{

NS_ped_on = false;
EW_ped_on = false;

% not in debug mode
while ~debug_mode
    if strncmp(user_response, 'N', 1) || strncmp(user_response, 'S', 1)
        [NS_ped_on, EW_ped_on] = N_S_traffic(NS_ped_on, EW_ped_on, green_timing, yellow_timing, ljHandle);
        [NS_ped_on, EW_ped_on] = E_W_traffic(NS_ped_on, EW_ped_on, green_timing, yellow_timing, ljHandle);
    elseif (strncmp(user_response, 'E', 1) || strncmp(user_response, 'W', 1))
        [NS_ped_on, EW_ped_on] = E_W_traffic(NS_ped_on, EW_ped_on, green_timing, yellow_timing, ljHandle);
        [NS_ped_on, EW_ped_on] = N_S_traffic(NS_ped_on, EW_ped_on, green_timing, yellow_timing, ljHandle);
    end
end
if debug_mode
    % TEST DEBUG
    run_debug(user_response, green_timing, yellow_timing, ljHandle)
end
%}
