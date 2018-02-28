function [N_S_ped_on, E_W_ped_on] = timings(desired_time, active_ped_light)
% Waits until a certain amount of time elapses then returns true

    
    N_S_ped_on = false;
    E_W_ped_on = false;
    if strcmp(active_ped_light, 'e')
        E_W_ped_on = true;
    elseif strcmp(active_ped_light, 'n')
        N_S_ped_on = true;
    end

    
    tStart = tic;
    while toc(tStart) > desired_time
        % If the East or West pedestrian button was not pressed before, set
        % the variable so that it has been pressed.
        if (~E_W_ped_on)
            [Error, E_W_state] = ljud_eGet(ljHandle, LJ_ioGET_DIGITAL_BIT,0, 0, 0);
            Error_Message(Error)
            if (E_W_state == 0)
                E_W_ped_on = true;
            end
        end
        
        % If the North or South pedestrian button was not pressed before,
        % set the variable so that it has been pressed.
        if (~N_S_ped_on)
            [Error, N_S_state] = ljud_eGet(ljHandle, LJ_ioGET_DIGITAL_BIT,1, 0, 0);
            Error_Message(Error)
            if (N_S_state == 0)
                N_S_ped_on = true;
            end
        end  
    end
    
end
