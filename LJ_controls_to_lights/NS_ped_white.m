function NS_ped_white(enable, ljHandle, lj_dig_bit)
% Wrapper function for LabJack code of the North-South ped. white lights.
% Runs high or low voltage to EIO 8 (White ped. lights of North-South)
%   Inputs:
%           enable : Boolean, if true send a high voltage, else send low.
%           ljHandle : Handle for LabJack U3, necesary for I/O.

    if enable
        Error = ljud_ePut(ljHandle, lj_dig_bit,9,1,0);
        Error_Message(Error)
    else
        Error = ljud_ePut(ljHandle, lj_dig_bit,9,0,0);
        Error_Message(Error)
    end
end