clear global

% Load labJack UD library and initialize LabJack constants
ljud_LoadDriver
ljud_Constants

% Open the first found LabJack U3
[Error ljHandle] = ljud_OpenLabJack(LJ_dtU3,LJ_ctUSB,'1',1);
Error_Message(Error)

SPEED_MULTIPLIER = 1; % Constant for speed that every timing is divided by

% Initialized variables for light timings, need to find these later
red_timing = SPEED_MULTIPLIER;
yellow_timing = SPEED_MULTIPLIER;

% MAIN SCRIPT
% Run starting lights
% Get user input, current via terminal
% Buttons:
% Red Light:
% Yellow Light:
% Green Light:
Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT, 6, 1, 0);
Error_Message(Error)

Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT, 4, 1, 0);
Error_Message(Error)

Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT, 3, 1, 0);
Error_Message(Error)


