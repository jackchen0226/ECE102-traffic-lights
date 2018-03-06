function EW_red(enable, ljHandle, lj_dig_bit)
% Wrapper function for LabJack code of the East-West Red lights.
% Runs high or low voltage to FIO 3 (Red lights of East-West)
%   Inputs:
%           enable : Boolean, if true send a high voltage, else send low.
%           ljHandle : Handle for LabJack U3, necesary for I/O.

    if enable
        Error = ljud_ePut(ljHandle, lj_dig_bit,3,1,0);
        Error_Message(Error)
    else
        Error = ljud_ePut(ljHandle, lj_dig_bit,3,0,0);
        Error_Message(Error)
    end
end