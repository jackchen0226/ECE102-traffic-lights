function [N_S_ped_on, E_W_ped_on] = NS_ped_red(enable, ljHandle, lj_dac, lj_dig, desired_timing)
% Wrapper function for LabJack code of the North-South ped. red lights.
%
% Runs high or low voltage to DAC 0 (Red ped. lights of North-South). This
% function will flash the red light every half second for desired_timing
% number of seconds. Will not return anything if desired_timing is not
% passed in. Returns if N/S and E/W pedestrian buttons were hit otherwise.
%
% Inputs:
%           enable : Boolean, if true send a high voltage, else send low.
%           ljHandle : Handle for LabJack U3, necesary for I/O.
%           lj_dac_bit : Write bit for analog DAC.
%           desired_timing : (optional) Flashes red light for given seconds
% Outputs:
%           N_S_ped_on : Boolean, if the North/South ped. light was pressed.
%           E_W_ped_on : Boolean, if the East/West ped. light was pressed.

    % If desired_timing was passed in
    N_S_ped_on = false;
    E_W_ped_on = false;
    write_voltage = 3.3; % Voltage in digital output high.
    if nargin > 3
        % For loop for number of seconds, have a stopwatch that checks
        % when one (1) second elapses for each iteration of the for loop.
        for i = 1:desired_timing
            tStart = tic;
            while toc(tStart) < 1.0
                % For the first half of the second, turn on the light. The
                % second half of the second, turn off the light.
                if toc(tStart) < 0.5
                    Error = ljud_ePut(ljHandle, lj_dac, 0, write_voltage, 0);
                    Error_Message(Error)
                else
                    Error = ljud_ePut(ljHandle, lj_dac, 0, 0, 0);
                    Error_Message(Error)
                end
                
                % Below contains timing code to check for pedestrian lights
                
                % If the East or West pedestrian button was not pressed before,
                % set the variable so that it has been pressed.      
                if (~E_W_ped_on)
                    [Error, EWstate] = ljud_eGet(ljHandle, lj_dig,0,0,0);
                    Error_Message(Error)
                    if (EWstate == 0)
                        E_W_ped_on = true;
                    end
                end

                % If the North or South pedestrian button was not pressed before,
                % set the variable so that it has been pressed.
                if (~N_S_ped_on)
                    [Error, NSstate] = ljud_eGet(ljHandle, lj_dig,1,0,0);
                    Error_Message(Error)
                    if (NSstate == 0)
                        N_S_ped_on = true;
                    end
                end 
            end
        end
        
        % Make sure to keep the light on after flashing ends.
        Error = ljud_ePut(ljHandle, lj_dac, 0, write_voltage, 0);
        Error_Message(Error)
    else
        if enable
            Error = ljud_ePut(ljHandle, lj_dac, 0, write_voltage, 0);
            Error_Message(Error)
        else
            Error = ljud_ePut(ljHandle, lj_dac, 0, 0, 0);
            Error_Message(Error)
        end
    end
end