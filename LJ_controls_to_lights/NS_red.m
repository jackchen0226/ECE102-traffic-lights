function NS_red(enable)
% Wrapper function for LabJack code of the North-South Red lights.
% Runs high or low voltage to FIO 5 (Red lights of North-South)
%   Inputs:
%           enable : Boolean, if true send a high voltage, else send low.
    if enable
        Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,5,1,0);
        Error_Message(Error)
    else
        Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,5,0,0);
        Error_Message(Error)
    end
end