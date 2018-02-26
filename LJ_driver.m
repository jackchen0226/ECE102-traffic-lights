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


