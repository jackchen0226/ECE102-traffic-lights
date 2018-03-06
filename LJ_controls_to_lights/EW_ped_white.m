function EW_ped_white(enable, ljHandle, lj_dig_bit)
% Wrapper function for LabJack code of the East-West ped. white lights.
% Runs high or low voltage to EIO 8 (White ped. lights of East-West)
%   Inputs:
%           enable : Boolean, if true send a high voltage, else send low.
%           ljHandle : Handle for LabJack U3, necesary for I/O.

    if enable
        Error = ljud_ePut(ljHandle, lj_dig_bit,8,1,0);
        Error_Message(Error)
    else
        Error = ljud_ePut(ljHandle, lj_dig_bit,8,0,0);
        Error_Message(Error)
    end
end