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



SPEED_MULTIPLIER = 1; % Constant for speed that every timing is divided by

% Initialized variables for light timings, need to find these later
red_timing = SPEED_MULTIPLIER;
yellow_timing = SPEED_MULTIPLIER;

% MAIN SCRIPT
% Various light tests
%NS_yellow(false, ljHandle, LJ_ioPUT_DIGITAL_BIT)
%N_S_traffic(false, false, 3, 3, ljHandle)
%pause(3)
NS_red(false, ljHandle, LJ_ioPUT_DIGITAL_BIT)

% DAC
%while true
    %Error = ljud_ePut(ljHandle, LJ_ioPUT_ANALOG_ENABLE_BIT, 0, 1, 0);
 
%   [Error, inVolt] = ljud_eGet(ljHandle, LJ_ioGET_AIN, 0, 0, 0);

 %   disp(inVolt)
  %  pause(0.1)
%end

