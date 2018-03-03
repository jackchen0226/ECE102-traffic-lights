function NS_yellow(enable, ljHandle, lj_dig_bit)
% Wrapper function for LabJack code of the North-South Yellow lights.
% Runs high or low voltage to FIO 5 (Yellow lights of North-South)
%   Inputs:
%           enable : Boolean, if true send a high voltage, else send low.
%           ljHandle : Handle for LabJack U3, necesary for I/O.

    if enable
        Error = ljud_ePut(ljHandle, lj_dig_bit,5,1,0);
        Error_Message(Error)
    else
        Error = ljud_ePut(ljHandle, lj_dig_bit,5,0,0);
        Error_Message(Error)
    end
end