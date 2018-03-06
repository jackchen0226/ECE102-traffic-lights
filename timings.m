function [N_S_ped_on, E_W_ped_on] = timings(desired_time, ljHandle, active_ped_light)
% Waits until desired_time elapses, checking pedestrian buttons.
% Inputs:
%       desired_time : Number of seconds to wait for.
%       ljHandle : Handle for LabJack U3, necesary for I/O.
%       active_ped_light : Character, marker for corresponding pedestrian 
%                          light to be on.
% Outputs:
%       N_S_ped_on : Boolean, if the North/South ped. light was pressed.
%       E_W_ped_on : Boolean, if the East/West ped. light was pressed.
    
    ljud_Constants
    N_S_ped_on = false;
    E_W_ped_on = false;
    if nargin > 2
        if strcmp(active_ped_light, 'e')
            E_W_ped_on = true;
        elseif strcmp(active_ped_light, 'n')
            N_S_ped_on = true;
        end
    end

    tStart = tic;
    while toc(tStart) < desired_time
        % If the East or West pedestrian button was not pressed before, set
        % the variable so that it has been pressed.      
        if (~E_W_ped_on)
            [Error, EWstate] = ljud_eGet(ljHandle, LJ_ioGET_DIGITAL_BIT,0,0,0);
            Error_Message(Error)
            if (EWstate == 0)
                E_W_ped_on = true;
            end
        end
        
        % If the North or South pedestrian button was not pressed before,
        % set the variable so that it has been pressed.
        if (~N_S_ped_on)
            [Error, NSstate] = ljud_eGet(ljHandle, LJ_ioGET_DIGITAL_BIT,1, 0, 0);
            Error_Message(Error)
            if (NSstate == 0)
                N_S_ped_on = true;
            end
        end       
    end   
end
